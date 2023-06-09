// ***************************************************************************
// ***************************************************************************
// Copyright 2022 (c) Analog Devices, Inc. All rights reserved.
//
// In this HDL repository, there are many different and unique modules, consisting
// of various HDL (Verilog or VHDL) components. The individual modules are
// developed independently, and may be accompanied by separate and unique license
// terms.
//
// The user should read each of these license terms, and understand the
// freedoms and responsabilities that he or she has by using this source/core.
//
// This core is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory
//      of this repository (LICENSE_GPL2), and also online at:
//      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license, which can be found in the top level directory
//      of this repository (LICENSE_ADIBSD), and also on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************
//
//

`include "utils.svh"

import axi_vip_pkg::*;
import axi4stream_vip_pkg::*;
import logger_pkg::*;
import test_harness_env_pkg::*;

`define AD7616_DMA                      32'h44A3_0000
`define AXI_AD7616                      32'h44A8_0000
`define AXI_PWMGEN                      32'h44B0_0000
`define DDR_BASE                        32'h8000_0000

localparam AD7616_CNVST_EN            = 32'h0000_0440;
localparam AD7616_CNVST_RATE          = 32'h0000_0444;

localparam AD7616_BASE = `AXI_AD7616;

localparam AD7616_PI_ADDR_PCORE_VERSION  = 32'h0000_0400;
localparam AD7616_PI_ADDR_ID             = 32'h0000_0404;
localparam AD7616_PI_ADDR_SCRATCH        = 32'h0000_0408;
localparam AD7616_PI_ADDR_CTRL           = 32'h0000_0440;
localparam AD7616_PI_ADDR_CONV_RATE      = 32'h0000_0444;
localparam AD7616_PI_ADDR_BURST_LENGTH   = 32'h0000_0448;
localparam AD7616_PI_ADDR_RDATA          = 32'h0000_044C;
localparam AD7616_PI_ADDR_WDATA          = 32'h0000_0450;

localparam AD7616_CTRL_RESETN            = 1;
localparam AD7616_CTRL_CNVST_EN          = 2;
localparam NUM_OF_TRANSFERS              = 10;

program test_program_pi (
  input         rx_cnvst,
  output [15:0] rx_db_i,
  input         rx_db_t,
  input         rx_rd_n,
  input         rx_wr_n,
  output        rx_cs_n,
  input  [15:0] rx_db_o,
  input         sys_clk,
  output        rx_busy);

assign rx_db_i = tx_data_buf;
assign rx_busy = rx_cnvst;

test_harness_env env;

// --------------------------
// Wrapper function for AXI read verif
// --------------------------
task axi_read_v(
    input   [31:0]  raddr,
    input   [31:0]  vdata);
begin
  env.mng.RegReadVerify32(raddr,vdata);
end
endtask

task axi_read(
    input   [31:0]  raddr,
    output  [31:0]  data);
begin
  env.mng.RegRead32(raddr,data);
end
endtask

// --------------------------
// Wrapper function for AXI write
// --------------------------
task axi_write;
  input [31:0]  waddr;
  input [31:0]  wdata;
begin
  env.mng.RegWrite32(waddr,wdata);
end
endtask

// --------------------------
// Main procedure
// --------------------------
initial begin

  //creating environment
  env = new(`TH.`SYS_CLK.inst.IF,
            `TH.`DMA_CLK.inst.IF,
            `TH.`DDR_CLK.inst.IF,
            `TH.`MNG_AXI.inst.IF,
            `TH.`DDR_AXI.inst.IF);

  setLoggerVerbosity(6);
  env.start();

  //asserts all the resets for 100 ns
  `TH.`SYS_RST.inst.IF.assert_reset;
  #100
  `TH.`SYS_RST.inst.IF.deassert_reset;
  #100

  sanity_test;

  #100

  //reg mode rd wr test

  #100

  //dma_parallel_test;
  data_acquisition_test;

  `INFO(("Test Done"));

  $finish;

end

wire        rx_rd_n_negedge_s;
wire        rx_rd_n_posedge_s;
reg         rx_rd_n_d;
reg [15:0]  tx_data_buf = 16'ha1b2;
bit [31:0]  dma_data_store_arr [(NUM_OF_TRANSFERS) - 1:0];

initial begin
  while(1) begin
    @(posedge sys_clk);
      rx_rd_n_d <= rx_rd_n;
  end
end

assign rx_rd_n_negedge_s = ~rx_rd_n & rx_rd_n_d;
assign rx_rd_n_posedge_s = rx_rd_n & ~rx_rd_n_d;

initial begin
  while(1) begin
    @(posedge sys_clk);
    if (rx_rd_n_negedge_s) begin
      tx_data_buf <= tx_data_buf + 16'h0808;

      if (transfer_cnt[0]) begin
        dma_data_store_arr [(transfer_cnt - 1) >> 1] [15:0] = tx_data_buf;
      end else begin
        dma_data_store_arr [(transfer_cnt - 1) >> 1] [31:16] = tx_data_buf;
      end
    end
  end
end

//---------------------------------------------------------------------------
// Sanity test reg interface
//---------------------------------------------------------------------------

task sanity_test;
begin
  #100 axi_write (AD7616_BASE + AD7616_PI_ADDR_SCRATCH, 32'hDEADBEEF);
  #100 axi_read_v (AD7616_BASE + AD7616_PI_ADDR_SCRATCH, 32'hDEADBEEF);
  `INFO(("Sanity Test Done"));
end
endtask

//---------------------------------------------------------------------------
// Transfer Counter
//---------------------------------------------------------------------------

bit [31:0] transfer_cnt;

initial begin
  while(1) begin
    @(posedge rx_rd_n_negedge_s && transfer_status);
      transfer_cnt <= transfer_cnt + 'h1;
  end
end

//---------------------------------------------------------------------------
// Data Acquisition Test ?? TBD
//---------------------------------------------------------------------------

reg [31:0] rdata_reg;
bit [31:0] captured_word_arr [(NUM_OF_TRANSFERS) -1 :0];
bit transfer_status = 0;

task data_acquisition_test;
  begin

    //Configure DMA
    env.mng.RegWrite32(`AD7616_DMA+32'h400, 32'h00000001); // Enable DMA
    env.mng.RegWrite32(`AD7616_DMA+32'h40c, 32'h00000006); // use TLAST
    env.mng.RegWrite32(`AD7616_DMA+32'h418, (NUM_OF_TRANSFERS*4)-1); // X_LENGHTH = 1024-1
    env.mng.RegWrite32(`AD7616_DMA+32'h410, `DDR_BASE); // DEST_ADDRESS
    env.mng.RegWrite32(`AD7616_DMA+32'h408, 32'h00000001); // Submit transfer DMA

    #100 axi_write (AD7616_BASE + AD7616_PI_ADDR_CTRL, 32'h0);
    #100 axi_write (AD7616_BASE + AD7616_PI_ADDR_CTRL, AD7616_CTRL_RESETN);
    #100 axi_write (AD7616_BASE + AD7616_PI_ADDR_CTRL, AD7616_CTRL_RESETN | AD7616_CTRL_CNVST_EN);

    #10000

    #100 axi_write (AD7616_BASE + AD7616_PI_ADDR_CTRL, AD7616_CTRL_RESETN);

    // Configure pwm gen
    #100 axi_write (`AXI_PWMGEN + 32'h00000010, 32'h00000000);
    #100 axi_write (`AXI_PWMGEN + 32'h00000040, 'h64);
    #100 axi_write (`AXI_PWMGEN + 32'h00000010, 32'h00000002);

    #100
    transfer_status = 1;

    wait(transfer_cnt == 2 * NUM_OF_TRANSFERS);

    #100
    transfer_status = 0;

    // Stop pwm gen
    #100 axi_write (`AXI_PWMGEN + 32'h00000010, 32'h00000001);
    $display("[%t] axi_pwm_gen stopped.", $time);

    #200
    #100 axi_write (AD7616_BASE + AD7616_PI_ADDR_WDATA, 32'hdead);
    #100 axi_read  (AD7616_BASE + AD7616_PI_ADDR_RDATA, rdata_reg);

    #2000

    for (int i=0; i<=((NUM_OF_TRANSFERS) -1); i=i+1) begin
      #1
      captured_word_arr[i] = env.ddr_axi_agent.mem_model.backdoor_memory_read_4byte(`DDR_BASE + 4*i);
    end

    if (captured_word_arr [(NUM_OF_TRANSFERS) - 1:2] != dma_data_store_arr [(NUM_OF_TRANSFERS) - 1:2]) begin
      `ERROR(("Data Acquisition Test FAILED"));
    end else begin
      `INFO(("Data Acquisition Test PASSED"));
    end

  end
endtask

endprogram
