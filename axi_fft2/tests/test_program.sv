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

// Memory address of AXI FFT core
`define FFT 32'h7c42_0000

program test_program;
  test_harness_env env;

  shortreal inputData[16];

  int regData;

  initial begin
    // 1 period of a cosine wave over 8 samples, interweave of IQ data
    inputData = {
      1.0000000, // Re
      0.0000000, // Im
      0.6234898,
      0.0000000,
      -0.22252093,
      0.0000000,
      -0.90096887,
      0.0000000,
      -0.90096887,
      0.0000000,
      -0.22252093,
      0.0000000,
      0.6234898,
      0.0000000,
      1.0000000,
      0.0000000
    };

    // Expecting
    // 1.000000
    // 0.000000
    // 3.843377
    // 1.591979
    // -0.301938
    // -0.301938
    // -0.041439
    // -0.100043
    // 0.000000
    // 0.000000
    // -0.041439
    // 0.100043
    // -0.301938
    // 0.301938
    // 3.843377
    // -1.591979

    // Create the environment
    env = new(`TH.`SYS_CLK.inst.IF,
              `TH.`DMA_CLK.inst.IF,
              `TH.`DDR_CLK.inst.IF,
              `TH.`MNG_AXI.inst.IF,
              `TH.`DDR_AXI.inst.IF);
    #2ps;

    // Start components
    setLoggerVerbosity(6);
    env.start();
    sys_reset();
    #1us;

    // Test AXI FFT
    // Bring up core
    env.mng.RegWrite32(`FFT+32'h0080, 32'h00000001);

    // Write input data
    for (int i = 0; i < 16; i++) begin
      env.mng.RegWrite32(`FFT+32'h00000100+(i*4), $shortrealtobits(inputData[i]));
    end

    // Trigger and wait for done
    env.mng.RegWrite32(`FFT+32'h0084, 32'h00000000);
    env.mng.RegRead32(`FFT+32'h0044, regData);
    while (!regData[0]) begin
      env.mng.RegRead32(`FFT+32'h0044, regData);
    end

    // Read values
    for (int i = 0; i < 16; i++) begin
      env.mng.RegRead32(`FFT+32'h0140+(i*4), regData);
      `INFO(("Read output at %d: %f", i, $bitstoshortreal(regData)));
    end

    #20us;
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
