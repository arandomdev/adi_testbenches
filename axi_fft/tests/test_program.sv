// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2018 (c) Analog Devices, Inc. All rights reserved.
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
//
`include "utils.svh"

import test_harness_env_pkg::*;
import logger_pkg::*;
import axi4stream_vip_pkg::*;
import m_axis_sequencer_pkg::*;
import `PKGIFY(test_harness, s_axis_input)::*;
import `PKGIFY(test_harness, m_axis_output)::*;
import `PKGIFY(test_harness, s_axis_config)::*;

// Memory address of AXI FFT core
`define FFT 32'h7c42_0000

program test_program;
  test_harness_env env;

  // reg read
  int regData;

  // axis agents
  `AGENT(test_harness, s_axis_input, slv_t) slv_input_agent;
  `AGENT(test_harness, m_axis_output, mst_t) mst_output_agent;
  `AGENT(test_harness, s_axis_config, slv_t) slv_config_agent;

  m_axis_sequencer #(`AGENT(test_harness, m_axis_output, mst_t),
                       `AXIS_VIP_PARAMS(test_harness, m_axis_output)
                      ) output_axis_seq;

  axi4stream_monitor_transaction mon_trans;
  xil_axi4stream_data_byte input_data_rec[8];
  xil_axi4stream_data_byte config_data_rec[2];

  initial begin
    // Create the environment
    env = new(`TH.`SYS_CLK.inst.IF,
              `TH.`DMA_CLK.inst.IF,
              `TH.`DDR_CLK.inst.IF,
              `TH.`MNG_AXI.inst.IF,
              `TH.`DDR_AXI.inst.IF);
    
    slv_input_agent = new("Slave Input Agent", `TH.`S_AXIS_INPUT.inst.IF);
    mst_output_agent = new("Master Output Agent", `TH.`M_AXIS_OUTPUT.inst.IF);
    slv_config_agent = new("Slave Config Agent", `TH.`S_AXIS_CONFIG.inst.IF);

    output_axis_seq = new(mst_output_agent);
    #2ps;

    // Start components
    setLoggerVerbosity(6);
    slv_input_agent.set_verbosity(0);
    mst_output_agent.set_verbosity(0);
    slv_config_agent.set_verbosity(0);

    env.start();
    slv_input_agent.start_slave();
    mst_output_agent.start_master();
    slv_config_agent.start_slave();

    slv_input_agent.start_monitor();
    slv_config_agent.start_monitor();

    sys_reset();
    #1us;

    // Test AXI FFT
    // Bring up core
    env.mng.RegWrite32(`FFT+32'h0080, 32'h00000001);

    `INFO(("Test 1: Input data"));
    // Write test data to input blocks
    for (int i = 0; i < 16; i++) begin
      env.mng.RegWrite32(`FFT+32'h00000100+(i*4), i);
    end

    fork
      // Trigger
      env.mng.RegWrite32(`FFT+32'h0084, 32'h00000000);

      // Read data from core and validate
      repeat (8) begin
        slv_input_agent.monitor.item_collected_port.get(mon_trans);
        mon_trans.get_data(input_data_rec);
        `INFO(("Input data transaction frame: %x", input_data_rec));
      end
    join
    `INFO(("Test 1 PASS"));

    `INFO(("Test 2: Config data"));
    // set config reg, trigger, and validate
    env.mng.RegWrite32(`FFT+32'h0010, 9'b101010101);
    fork
      env.mng.RegWrite32(`FFT+32'h0088, 32'h00000000);
      begin
        slv_config_agent.monitor.item_collected_port.get(mon_trans);
        mon_trans.get_data(config_data_rec);
        `INFO(("Config data transaction frame: %x", config_data_rec));
      end
    join
    `INFO(("Test 2: PASS"));

    `INFO(("Test 3: Output data"));
    output_axis_seq.configure(0, 0);
    output_axis_seq.update(64, 1, 0);

    // Push data onto sequencer
    for (byte i = 0; i < 16; i++) begin
      output_axis_seq.byte_stream.push_back(i);
      output_axis_seq.byte_stream.push_back(0);
      output_axis_seq.byte_stream.push_back(0);
      output_axis_seq.byte_stream.push_back(0);
    end
    output_axis_seq.enable();
    output_axis_seq.run();

    // Wait for transaction done
    env.mng.RegRead32(`FFT+32'h0014, regData);
    while (!regData[0]) begin
      env.mng.RegRead32(`FFT+32'h0014, regData);
    end

    // Read values
    for (int i = 0; i < 16; i++) begin
      env.mng.RegRead32(`FFT+32'h0140+(i*4), regData);
      `INFO(("Read output at %d: %x", i, regData));
    end

    #5us;
    `INFO(("Test 3: PASS"));

    #20us;
    output_axis_seq.stop();
    slv_input_agent.stop_slave();
    mst_output_agent.stop_master();
    slv_config_agent.stop_slave();
    env.stop();
    `INFO(("Test bench done!"));
    $finish();
  end

  task sys_reset;
    //asserts all the resets for 100 ns
    `TH.`SYS_RST.inst.IF.assert_reset;
    #100
    `TH.`SYS_RST.inst.IF.deassert_reset;
  endtask :sys_reset

endprogram
