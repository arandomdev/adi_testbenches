// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2021 (c) Analog Devices, Inc. All rights reserved.
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
//      <https://www.gnu.org/licenses/old_licenses/gpl-2.0.html>
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
/* Auto generated Register Map */
/* Fri May 28 12:27:32 2021 */

package adi_regmap_jesd_tx_pkg;
  import adi_regmap_pkg::*;


/* JESD204 TX (axi_jesd204_tx) */

  const reg_t JESD_TX_VERSION = '{ 'h0000, "VERSION" , '{
    "VERSION_MAJOR": '{ 31, 16, RO, 'h0001 },
    "VERSION_MINOR": '{ 15, 8, RO, 'h03 },
    "VERSION_PATCH": '{ 7, 0, RO, 'h61 }}};
  `define SET_JESD_TX_VERSION_VERSION_MAJOR(x) SetField(JESD_TX_VERSION,"VERSION_MAJOR",x)
  `define GET_JESD_TX_VERSION_VERSION_MAJOR(x) GetField(JESD_TX_VERSION,"VERSION_MAJOR",x)
  `define SET_JESD_TX_VERSION_VERSION_MINOR(x) SetField(JESD_TX_VERSION,"VERSION_MINOR",x)
  `define GET_JESD_TX_VERSION_VERSION_MINOR(x) GetField(JESD_TX_VERSION,"VERSION_MINOR",x)
  `define SET_JESD_TX_VERSION_VERSION_PATCH(x) SetField(JESD_TX_VERSION,"VERSION_PATCH",x)
  `define GET_JESD_TX_VERSION_VERSION_PATCH(x) GetField(JESD_TX_VERSION,"VERSION_PATCH",x)

  const reg_t JESD_TX_PERIPHERAL_ID = '{ 'h0004, "PERIPHERAL_ID" , '{
    "PERIPHERAL_ID": '{ 31, 0, RO, 'h???????? }}};
  `define SET_JESD_TX_PERIPHERAL_ID_PERIPHERAL_ID(x) SetField(JESD_TX_PERIPHERAL_ID,"PERIPHERAL_ID",x)
  `define GET_JESD_TX_PERIPHERAL_ID_PERIPHERAL_ID(x) GetField(JESD_TX_PERIPHERAL_ID,"PERIPHERAL_ID",x)

  const reg_t JESD_TX_SCRATCH = '{ 'h0008, "SCRATCH" , '{
    "SCRATCH": '{ 31, 0, RW, 'h00000000 }}};
  `define SET_JESD_TX_SCRATCH_SCRATCH(x) SetField(JESD_TX_SCRATCH,"SCRATCH",x)
  `define GET_JESD_TX_SCRATCH_SCRATCH(x) GetField(JESD_TX_SCRATCH,"SCRATCH",x)

  const reg_t JESD_TX_IDENTIFICATION = '{ 'h000c, "IDENTIFICATION" , '{
    "IDENTIFICATION": '{ 31, 0, RO, 'h32303454 }}};
  `define SET_JESD_TX_IDENTIFICATION_IDENTIFICATION(x) SetField(JESD_TX_IDENTIFICATION,"IDENTIFICATION",x)
  `define GET_JESD_TX_IDENTIFICATION_IDENTIFICATION(x) GetField(JESD_TX_IDENTIFICATION,"IDENTIFICATION",x)

  const reg_t JESD_TX_SYNTH_NUM_LANES = '{ 'h0010, "SYNTH_NUM_LANES" , '{
    "SYNTH_NUM_LANES": '{ 31, 0, RO, 'h???????? }}};
  `define SET_JESD_TX_SYNTH_NUM_LANES_SYNTH_NUM_LANES(x) SetField(JESD_TX_SYNTH_NUM_LANES,"SYNTH_NUM_LANES",x)
  `define GET_JESD_TX_SYNTH_NUM_LANES_SYNTH_NUM_LANES(x) GetField(JESD_TX_SYNTH_NUM_LANES,"SYNTH_NUM_LANES",x)

  const reg_t JESD_TX_SYNTH_DATA_PATH_WIDTH = '{ 'h0014, "SYNTH_DATA_PATH_WIDTH" , '{
    "Reserved": '{ 31, 16, RO, 'h0000 },
    "TPL_DATA_PATH_WIDTH": '{ 15, 8, RO, 'h00000002 },
    "SYNTH_DATA_PATH_WIDTH": '{ 7, 0, RO, 'h00000002 }}};
  `define SET_JESD_TX_SYNTH_DATA_PATH_WIDTH_Reserved(x) SetField(JESD_TX_SYNTH_DATA_PATH_WIDTH,"Reserved",x)
  `define GET_JESD_TX_SYNTH_DATA_PATH_WIDTH_Reserved(x) GetField(JESD_TX_SYNTH_DATA_PATH_WIDTH,"Reserved",x)
  `define SET_JESD_TX_SYNTH_DATA_PATH_WIDTH_TPL_DATA_PATH_WIDTH(x) SetField(JESD_TX_SYNTH_DATA_PATH_WIDTH,"TPL_DATA_PATH_WIDTH",x)
  `define GET_JESD_TX_SYNTH_DATA_PATH_WIDTH_TPL_DATA_PATH_WIDTH(x) GetField(JESD_TX_SYNTH_DATA_PATH_WIDTH,"TPL_DATA_PATH_WIDTH",x)
  `define SET_JESD_TX_SYNTH_DATA_PATH_WIDTH_SYNTH_DATA_PATH_WIDTH(x) SetField(JESD_TX_SYNTH_DATA_PATH_WIDTH,"SYNTH_DATA_PATH_WIDTH",x)
  `define GET_JESD_TX_SYNTH_DATA_PATH_WIDTH_SYNTH_DATA_PATH_WIDTH(x) GetField(JESD_TX_SYNTH_DATA_PATH_WIDTH,"SYNTH_DATA_PATH_WIDTH",x)

  const reg_t JESD_TX_SYNTH_REG_1 = '{ 'h0018, "SYNTH_REG_1" , '{
    "Reserved": '{ 31, 19, RO, 'h0000 },
    "ENABLE_CHAR_REPLACE": '{ 18, 18, RO, 'h00 },
    "ASYNC_CLK": '{ 12, 12, RO, 0 },
    "ENCODER": '{ 9, 8, RO, 'h?? },
    "NUM_LINKS": '{ 7, 0, RO, 'h?? }}};
  `define SET_JESD_TX_SYNTH_REG_1_Reserved(x) SetField(JESD_TX_SYNTH_REG_1,"Reserved",x)
  `define GET_JESD_TX_SYNTH_REG_1_Reserved(x) GetField(JESD_TX_SYNTH_REG_1,"Reserved",x)
  `define SET_JESD_TX_SYNTH_REG_1_ENABLE_CHAR_REPLACE(x) SetField(JESD_TX_SYNTH_REG_1,"ENABLE_CHAR_REPLACE",x)
  `define GET_JESD_TX_SYNTH_REG_1_ENABLE_CHAR_REPLACE(x) GetField(JESD_TX_SYNTH_REG_1,"ENABLE_CHAR_REPLACE",x)
  `define SET_JESD_TX_SYNTH_REG_1_ASYNC_CLK(x) SetField(JESD_TX_SYNTH_REG_1,"ASYNC_CLK",x)
  `define GET_JESD_TX_SYNTH_REG_1_ASYNC_CLK(x) GetField(JESD_TX_SYNTH_REG_1,"ASYNC_CLK",x)
  `define SET_JESD_TX_SYNTH_REG_1_ENCODER(x) SetField(JESD_TX_SYNTH_REG_1,"ENCODER",x)
  `define GET_JESD_TX_SYNTH_REG_1_ENCODER(x) GetField(JESD_TX_SYNTH_REG_1,"ENCODER",x)
  `define SET_JESD_TX_SYNTH_REG_1_NUM_LINKS(x) SetField(JESD_TX_SYNTH_REG_1,"NUM_LINKS",x)
  `define GET_JESD_TX_SYNTH_REG_1_NUM_LINKS(x) GetField(JESD_TX_SYNTH_REG_1,"NUM_LINKS",x)

  const reg_t JESD_TX_IRQ_ENABLE = '{ 'h0080, "IRQ_ENABLE" , '{
    "IRQ_ENABLE": '{ 31, 0, RW, 'h00000000 }}};
  `define SET_JESD_TX_IRQ_ENABLE_IRQ_ENABLE(x) SetField(JESD_TX_IRQ_ENABLE,"IRQ_ENABLE",x)
  `define GET_JESD_TX_IRQ_ENABLE_IRQ_ENABLE(x) GetField(JESD_TX_IRQ_ENABLE,"IRQ_ENABLE",x)

  const reg_t JESD_TX_IRQ_PENDING = '{ 'h0084, "IRQ_PENDING" , '{
    "IRQ_PENDING": '{ 31, 0, RW1CV, 'h00000000 }}};
  `define SET_JESD_TX_IRQ_PENDING_IRQ_PENDING(x) SetField(JESD_TX_IRQ_PENDING,"IRQ_PENDING",x)
  `define GET_JESD_TX_IRQ_PENDING_IRQ_PENDING(x) GetField(JESD_TX_IRQ_PENDING,"IRQ_PENDING",x)

  const reg_t JESD_TX_IRQ_SOURCE = '{ 'h0088, "IRQ_SOURCE" , '{
    "IRQ_SOURCE": '{ 31, 0, RW1CV, 'h00000000 }}};
  `define SET_JESD_TX_IRQ_SOURCE_IRQ_SOURCE(x) SetField(JESD_TX_IRQ_SOURCE,"IRQ_SOURCE",x)
  `define GET_JESD_TX_IRQ_SOURCE_IRQ_SOURCE(x) GetField(JESD_TX_IRQ_SOURCE,"IRQ_SOURCE",x)

  const reg_t JESD_TX_LINK_DISABLE = '{ 'h00c0, "LINK_DISABLE" , '{
    "Reserved": '{ 31, 1, RO, 'h00 },
    "LINK_DISABLE": '{ 0, 0, RW, 'h1 }}};
  `define SET_JESD_TX_LINK_DISABLE_Reserved(x) SetField(JESD_TX_LINK_DISABLE,"Reserved",x)
  `define GET_JESD_TX_LINK_DISABLE_Reserved(x) GetField(JESD_TX_LINK_DISABLE,"Reserved",x)
  `define SET_JESD_TX_LINK_DISABLE_LINK_DISABLE(x) SetField(JESD_TX_LINK_DISABLE,"LINK_DISABLE",x)
  `define GET_JESD_TX_LINK_DISABLE_LINK_DISABLE(x) GetField(JESD_TX_LINK_DISABLE,"LINK_DISABLE",x)

  const reg_t JESD_TX_LINK_STATE = '{ 'h00c4, "LINK_STATE" , '{
    "Reserved": '{ 31, 2, RO, 'h00 },
    "EXTERNAL_RESET": '{ 1, 1, RO, 'h? },
    "LINK_STATE": '{ 0, 0, RO, 'h1 }}};
  `define SET_JESD_TX_LINK_STATE_Reserved(x) SetField(JESD_TX_LINK_STATE,"Reserved",x)
  `define GET_JESD_TX_LINK_STATE_Reserved(x) GetField(JESD_TX_LINK_STATE,"Reserved",x)
  `define SET_JESD_TX_LINK_STATE_EXTERNAL_RESET(x) SetField(JESD_TX_LINK_STATE,"EXTERNAL_RESET",x)
  `define GET_JESD_TX_LINK_STATE_EXTERNAL_RESET(x) GetField(JESD_TX_LINK_STATE,"EXTERNAL_RESET",x)
  `define SET_JESD_TX_LINK_STATE_LINK_STATE(x) SetField(JESD_TX_LINK_STATE,"LINK_STATE",x)
  `define GET_JESD_TX_LINK_STATE_LINK_STATE(x) GetField(JESD_TX_LINK_STATE,"LINK_STATE",x)

  const reg_t JESD_TX_LINK_CLK_FREQ = '{ 'h00c8, "LINK_CLK_FREQ" , '{
    "LINK_CLK_FREQ": '{ 31, 0, ROV, 'h????????? }}};
  `define SET_JESD_TX_LINK_CLK_FREQ_LINK_CLK_FREQ(x) SetField(JESD_TX_LINK_CLK_FREQ,"LINK_CLK_FREQ",x)
  `define GET_JESD_TX_LINK_CLK_FREQ_LINK_CLK_FREQ(x) GetField(JESD_TX_LINK_CLK_FREQ,"LINK_CLK_FREQ",x)

  const reg_t JESD_TX_DEVICE_CLK_FREQ = '{ 'h00cc, "DEVICE_CLK_FREQ" , '{
    "DEVICE_CLK_FREQ": '{ 20, 0, ROV, 'h????????? }}};
  `define SET_JESD_TX_DEVICE_CLK_FREQ_DEVICE_CLK_FREQ(x) SetField(JESD_TX_DEVICE_CLK_FREQ,"DEVICE_CLK_FREQ",x)
  `define GET_JESD_TX_DEVICE_CLK_FREQ_DEVICE_CLK_FREQ(x) GetField(JESD_TX_DEVICE_CLK_FREQ,"DEVICE_CLK_FREQ",x)

  const reg_t JESD_TX_SYSREF_CONF = '{ 'h0100, "SYSREF_CONF" , '{
    "Reserved": '{ 31, 2, RO, 'h00 },
    "SYSREF_ONESHOT": '{ 1, 1, RW, 'h0 },
    "SYSREF_DISABLE": '{ 0, 0, RW, 'h0 }}};
  `define SET_JESD_TX_SYSREF_CONF_Reserved(x) SetField(JESD_TX_SYSREF_CONF,"Reserved",x)
  `define GET_JESD_TX_SYSREF_CONF_Reserved(x) GetField(JESD_TX_SYSREF_CONF,"Reserved",x)
  `define SET_JESD_TX_SYSREF_CONF_SYSREF_ONESHOT(x) SetField(JESD_TX_SYSREF_CONF,"SYSREF_ONESHOT",x)
  `define GET_JESD_TX_SYSREF_CONF_SYSREF_ONESHOT(x) GetField(JESD_TX_SYSREF_CONF,"SYSREF_ONESHOT",x)
  `define SET_JESD_TX_SYSREF_CONF_SYSREF_DISABLE(x) SetField(JESD_TX_SYSREF_CONF,"SYSREF_DISABLE",x)
  `define GET_JESD_TX_SYSREF_CONF_SYSREF_DISABLE(x) GetField(JESD_TX_SYSREF_CONF,"SYSREF_DISABLE",x)

  const reg_t JESD_TX_SYSREF_LMFC_OFFSET = '{ 'h0104, "SYSREF_LMFC_OFFSET" , '{
    "Reserved": '{ 31, 10, RO, 'h00 },
    "SYSREF_LMFC_OFFSET": '{ 9, 0, RW, 'h00 }}};
  `define SET_JESD_TX_SYSREF_LMFC_OFFSET_Reserved(x) SetField(JESD_TX_SYSREF_LMFC_OFFSET,"Reserved",x)
  `define GET_JESD_TX_SYSREF_LMFC_OFFSET_Reserved(x) GetField(JESD_TX_SYSREF_LMFC_OFFSET,"Reserved",x)
  `define SET_JESD_TX_SYSREF_LMFC_OFFSET_SYSREF_LMFC_OFFSET(x) SetField(JESD_TX_SYSREF_LMFC_OFFSET,"SYSREF_LMFC_OFFSET",x)
  `define GET_JESD_TX_SYSREF_LMFC_OFFSET_SYSREF_LMFC_OFFSET(x) GetField(JESD_TX_SYSREF_LMFC_OFFSET,"SYSREF_LMFC_OFFSET",x)

  const reg_t JESD_TX_SYSREF_STATUS = '{ 'h0108, "SYSREF_STATUS" , '{
    "Reserved": '{ 31, 2, RO, 'h00 },
    "SYSREF_ALIGNMENT_ERROR": '{ 1, 1, RW1CV, 'h0 },
    "SYSREF_DETECTED": '{ 0, 0, RW1CV, 'h0 }}};
  `define SET_JESD_TX_SYSREF_STATUS_Reserved(x) SetField(JESD_TX_SYSREF_STATUS,"Reserved",x)
  `define GET_JESD_TX_SYSREF_STATUS_Reserved(x) GetField(JESD_TX_SYSREF_STATUS,"Reserved",x)
  `define SET_JESD_TX_SYSREF_STATUS_SYSREF_ALIGNMENT_ERROR(x) SetField(JESD_TX_SYSREF_STATUS,"SYSREF_ALIGNMENT_ERROR",x)
  `define GET_JESD_TX_SYSREF_STATUS_SYSREF_ALIGNMENT_ERROR(x) GetField(JESD_TX_SYSREF_STATUS,"SYSREF_ALIGNMENT_ERROR",x)
  `define SET_JESD_TX_SYSREF_STATUS_SYSREF_DETECTED(x) SetField(JESD_TX_SYSREF_STATUS,"SYSREF_DETECTED",x)
  `define GET_JESD_TX_SYSREF_STATUS_SYSREF_DETECTED(x) GetField(JESD_TX_SYSREF_STATUS,"SYSREF_DETECTED",x)

  const reg_t JESD_TX_LANES_DISABLE = '{ 'h0200, "LANES_DISABLE" , '{
    "LANE_DISABLEn": '{ n, n, RW, 'h0 }}};
  `define SET_JESD_TX_LANES_DISABLE_LANE_DISABLEn(x) SetField(JESD_TX_LANES_DISABLE,"LANE_DISABLEn",x)
  `define GET_JESD_TX_LANES_DISABLE_LANE_DISABLEn(x) GetField(JESD_TX_LANES_DISABLE,"LANE_DISABLEn",x)

  const reg_t JESD_TX_LINK_CONF0 = '{ 'h0210, "LINK_CONF0" , '{
    "Reserved": '{ 31, 19, RO, 'h00 },
    "OCTETS_PER_FRAME": '{ 18, 16, RW, 'h00 },
    "Reserved": '{ 15, 10, RO, 'h00 },
    "OCTETS_PER_MULTIFRAME": '{ 9, 0, RW, 'h03 }}};
  `define SET_JESD_TX_LINK_CONF0_Reserved(x) SetField(JESD_TX_LINK_CONF0,"Reserved",x)
  `define GET_JESD_TX_LINK_CONF0_Reserved(x) GetField(JESD_TX_LINK_CONF0,"Reserved",x)
  `define SET_JESD_TX_LINK_CONF0_OCTETS_PER_FRAME(x) SetField(JESD_TX_LINK_CONF0,"OCTETS_PER_FRAME",x)
  `define GET_JESD_TX_LINK_CONF0_OCTETS_PER_FRAME(x) GetField(JESD_TX_LINK_CONF0,"OCTETS_PER_FRAME",x)
  `define SET_JESD_TX_LINK_CONF0_Reserved(x) SetField(JESD_TX_LINK_CONF0,"Reserved",x)
  `define GET_JESD_TX_LINK_CONF0_Reserved(x) GetField(JESD_TX_LINK_CONF0,"Reserved",x)
  `define SET_JESD_TX_LINK_CONF0_OCTETS_PER_MULTIFRAME(x) SetField(JESD_TX_LINK_CONF0,"OCTETS_PER_MULTIFRAME",x)
  `define GET_JESD_TX_LINK_CONF0_OCTETS_PER_MULTIFRAME(x) GetField(JESD_TX_LINK_CONF0,"OCTETS_PER_MULTIFRAME",x)

  const reg_t JESD_TX_LINK_CONF1 = '{ 'h0214, "LINK_CONF1" , '{
    "Reserved": '{ 31, 2, RO, 'h0 },
    "CHAR_REPLACEMENT_DISABLE": '{ 1, 1, RW, 'h0 },
    "SCRAMBLER_DISABLE": '{ 0, 0, RW, 'h0 }}};
  `define SET_JESD_TX_LINK_CONF1_Reserved(x) SetField(JESD_TX_LINK_CONF1,"Reserved",x)
  `define GET_JESD_TX_LINK_CONF1_Reserved(x) GetField(JESD_TX_LINK_CONF1,"Reserved",x)
  `define SET_JESD_TX_LINK_CONF1_CHAR_REPLACEMENT_DISABLE(x) SetField(JESD_TX_LINK_CONF1,"CHAR_REPLACEMENT_DISABLE",x)
  `define GET_JESD_TX_LINK_CONF1_CHAR_REPLACEMENT_DISABLE(x) GetField(JESD_TX_LINK_CONF1,"CHAR_REPLACEMENT_DISABLE",x)
  `define SET_JESD_TX_LINK_CONF1_SCRAMBLER_DISABLE(x) SetField(JESD_TX_LINK_CONF1,"SCRAMBLER_DISABLE",x)
  `define GET_JESD_TX_LINK_CONF1_SCRAMBLER_DISABLE(x) GetField(JESD_TX_LINK_CONF1,"SCRAMBLER_DISABLE",x)

  const reg_t JESD_TX_MULTI_LINK_DISABLE = '{ 'h0218, "MULTI_LINK_DISABLE" , '{
    "LINK_DISABLEn": '{ n, n, RW, 'h0 }}};
  `define SET_JESD_TX_MULTI_LINK_DISABLE_LINK_DISABLEn(x) SetField(JESD_TX_MULTI_LINK_DISABLE,"LINK_DISABLEn",x)
  `define GET_JESD_TX_MULTI_LINK_DISABLE_LINK_DISABLEn(x) GetField(JESD_TX_MULTI_LINK_DISABLE,"LINK_DISABLEn",x)

  const reg_t JESD_TX_LINK_CONF4 = '{ 'h021c, "LINK_CONF4" , '{
    "Reserved": '{ 31, 8, RO, 'h0 },
    "TPL_BEATS_PER_MULTIFRAME": '{ 7, 0, RW, 'h00 }}};
  `define SET_JESD_TX_LINK_CONF4_Reserved(x) SetField(JESD_TX_LINK_CONF4,"Reserved",x)
  `define GET_JESD_TX_LINK_CONF4_Reserved(x) GetField(JESD_TX_LINK_CONF4,"Reserved",x)
  `define SET_JESD_TX_LINK_CONF4_TPL_BEATS_PER_MULTIFRAME(x) SetField(JESD_TX_LINK_CONF4,"TPL_BEATS_PER_MULTIFRAME",x)
  `define GET_JESD_TX_LINK_CONF4_TPL_BEATS_PER_MULTIFRAME(x) GetField(JESD_TX_LINK_CONF4,"TPL_BEATS_PER_MULTIFRAME",x)

  const reg_t JESD_TX_LINK_CONF2 = '{ 'h0240, "LINK_CONF2" , '{
    "Reserved": '{ 31, 3, RO, 'h0 },
    "SKIP_ILAS": '{ 2, 2, RW, 'h0 },
    "CONTINUOUS_ILAS": '{ 1, 1, RW, 'h0 },
    "CONTINUOUS_CGS": '{ 0, 0, RW, 'h0 }}};
  `define SET_JESD_TX_LINK_CONF2_Reserved(x) SetField(JESD_TX_LINK_CONF2,"Reserved",x)
  `define GET_JESD_TX_LINK_CONF2_Reserved(x) GetField(JESD_TX_LINK_CONF2,"Reserved",x)
  `define SET_JESD_TX_LINK_CONF2_SKIP_ILAS(x) SetField(JESD_TX_LINK_CONF2,"SKIP_ILAS",x)
  `define GET_JESD_TX_LINK_CONF2_SKIP_ILAS(x) GetField(JESD_TX_LINK_CONF2,"SKIP_ILAS",x)
  `define SET_JESD_TX_LINK_CONF2_CONTINUOUS_ILAS(x) SetField(JESD_TX_LINK_CONF2,"CONTINUOUS_ILAS",x)
  `define GET_JESD_TX_LINK_CONF2_CONTINUOUS_ILAS(x) GetField(JESD_TX_LINK_CONF2,"CONTINUOUS_ILAS",x)
  `define SET_JESD_TX_LINK_CONF2_CONTINUOUS_CGS(x) SetField(JESD_TX_LINK_CONF2,"CONTINUOUS_CGS",x)
  `define GET_JESD_TX_LINK_CONF2_CONTINUOUS_CGS(x) GetField(JESD_TX_LINK_CONF2,"CONTINUOUS_CGS",x)

  const reg_t JESD_TX_LINK_CONF3 = '{ 'h0244, "LINK_CONF3" , '{
    "Reserved": '{ 31, 8, RO, 'h0 },
    "MFRAMES_PER_ILAS": '{ 7, 0, RW, 'h03 }}};
  `define SET_JESD_TX_LINK_CONF3_Reserved(x) SetField(JESD_TX_LINK_CONF3,"Reserved",x)
  `define GET_JESD_TX_LINK_CONF3_Reserved(x) GetField(JESD_TX_LINK_CONF3,"Reserved",x)
  `define SET_JESD_TX_LINK_CONF3_MFRAMES_PER_ILAS(x) SetField(JESD_TX_LINK_CONF3,"MFRAMES_PER_ILAS",x)
  `define GET_JESD_TX_LINK_CONF3_MFRAMES_PER_ILAS(x) GetField(JESD_TX_LINK_CONF3,"MFRAMES_PER_ILAS",x)

  const reg_t JESD_TX_MANUAL_SYNC_REQUEST = '{ 'h0248, "MANUAL_SYNC_REQUEST" , '{
    "Reserved": '{ 31, 1, RO, 'h0 },
    "MANUAL_SYNC_REQUEST": '{ 0, 0, W1S, 'h0 }}};
  `define SET_JESD_TX_MANUAL_SYNC_REQUEST_Reserved(x) SetField(JESD_TX_MANUAL_SYNC_REQUEST,"Reserved",x)
  `define GET_JESD_TX_MANUAL_SYNC_REQUEST_Reserved(x) GetField(JESD_TX_MANUAL_SYNC_REQUEST,"Reserved",x)
  `define SET_JESD_TX_MANUAL_SYNC_REQUEST_MANUAL_SYNC_REQUEST(x) SetField(JESD_TX_MANUAL_SYNC_REQUEST,"MANUAL_SYNC_REQUEST",x)
  `define GET_JESD_TX_MANUAL_SYNC_REQUEST_MANUAL_SYNC_REQUEST(x) GetField(JESD_TX_MANUAL_SYNC_REQUEST,"MANUAL_SYNC_REQUEST",x)

  const reg_t JESD_TX_LINK_STATUS = '{ 'h0280, "LINK_STATUS" , '{
    "Reserved": '{ 31, 12, RO, 'h00 },
    "STATUS_SYNC": '{ 11, 4, ROV, 'h?? },
    "Reserved": '{ 3, 2, RO, 'h00 },
    "STATUS_STATE": '{ 1, 0, ROV, 'h00 }}};
  `define SET_JESD_TX_LINK_STATUS_Reserved(x) SetField(JESD_TX_LINK_STATUS,"Reserved",x)
  `define GET_JESD_TX_LINK_STATUS_Reserved(x) GetField(JESD_TX_LINK_STATUS,"Reserved",x)
  `define SET_JESD_TX_LINK_STATUS_STATUS_SYNC(x) SetField(JESD_TX_LINK_STATUS,"STATUS_SYNC",x)
  `define GET_JESD_TX_LINK_STATUS_STATUS_SYNC(x) GetField(JESD_TX_LINK_STATUS,"STATUS_SYNC",x)
  `define SET_JESD_TX_LINK_STATUS_Reserved(x) SetField(JESD_TX_LINK_STATUS,"Reserved",x)
  `define GET_JESD_TX_LINK_STATUS_Reserved(x) GetField(JESD_TX_LINK_STATUS,"Reserved",x)
  `define SET_JESD_TX_LINK_STATUS_STATUS_STATE(x) SetField(JESD_TX_LINK_STATUS,"STATUS_STATE",x)
  `define GET_JESD_TX_LINK_STATUS_STATUS_STATE(x) GetField(JESD_TX_LINK_STATUS,"STATUS_STATE",x)

  const reg_t JESD_TX_LANEn_ILAS0 = '{ 'h0310 + 'h20*n, "LANEn_ILAS0" , '{
    "Reserved": '{ 31, 28, RO, 'h0 },
    "BID": '{ 27, 24, RW, 'h0 },
    "DID": '{ 23, 16, RW, 'h00 },
    "Reserved": '{ 15, 0, RO, 'h0000 }}};
  `define SET_JESD_TX_LANEn_ILAS0_Reserved(x) SetField(JESD_TX_LANEn_ILAS0,"Reserved",x)
  `define GET_JESD_TX_LANEn_ILAS0_Reserved(x) GetField(JESD_TX_LANEn_ILAS0,"Reserved",x)
  `define SET_JESD_TX_LANEn_ILAS0_BID(x) SetField(JESD_TX_LANEn_ILAS0,"BID",x)
  `define GET_JESD_TX_LANEn_ILAS0_BID(x) GetField(JESD_TX_LANEn_ILAS0,"BID",x)
  `define SET_JESD_TX_LANEn_ILAS0_DID(x) SetField(JESD_TX_LANEn_ILAS0,"DID",x)
  `define GET_JESD_TX_LANEn_ILAS0_DID(x) GetField(JESD_TX_LANEn_ILAS0,"DID",x)
  `define SET_JESD_TX_LANEn_ILAS0_Reserved(x) SetField(JESD_TX_LANEn_ILAS0,"Reserved",x)
  `define GET_JESD_TX_LANEn_ILAS0_Reserved(x) GetField(JESD_TX_LANEn_ILAS0,"Reserved",x)

  const reg_t JESD_TX_LANEn_ILAS1 = '{ 'h0314 + 'h20*n, "LANEn_ILAS1" , '{
    "Reserved": '{ 31, 29, RO, 'h00 },
    "K": '{ 28, 24, RW, 'h00 },
    "F": '{ 23, 16, RW, 'h00 },
    "SCR": '{ 15, 15, RW, 'h0 },
    "Reserved": '{ 14, 13, RO, 'h0 },
    "L": '{ 12, 8, RW, 'h00 },
    "Reserved": '{ 7, 5, RO, 'h0 },
    "LID": '{ 4, 0, RW, 'h00 }}};
  `define SET_JESD_TX_LANEn_ILAS1_Reserved(x) SetField(JESD_TX_LANEn_ILAS1,"Reserved",x)
  `define GET_JESD_TX_LANEn_ILAS1_Reserved(x) GetField(JESD_TX_LANEn_ILAS1,"Reserved",x)
  `define SET_JESD_TX_LANEn_ILAS1_K(x) SetField(JESD_TX_LANEn_ILAS1,"K",x)
  `define GET_JESD_TX_LANEn_ILAS1_K(x) GetField(JESD_TX_LANEn_ILAS1,"K",x)
  `define SET_JESD_TX_LANEn_ILAS1_F(x) SetField(JESD_TX_LANEn_ILAS1,"F",x)
  `define GET_JESD_TX_LANEn_ILAS1_F(x) GetField(JESD_TX_LANEn_ILAS1,"F",x)
  `define SET_JESD_TX_LANEn_ILAS1_SCR(x) SetField(JESD_TX_LANEn_ILAS1,"SCR",x)
  `define GET_JESD_TX_LANEn_ILAS1_SCR(x) GetField(JESD_TX_LANEn_ILAS1,"SCR",x)
  `define SET_JESD_TX_LANEn_ILAS1_Reserved(x) SetField(JESD_TX_LANEn_ILAS1,"Reserved",x)
  `define GET_JESD_TX_LANEn_ILAS1_Reserved(x) GetField(JESD_TX_LANEn_ILAS1,"Reserved",x)
  `define SET_JESD_TX_LANEn_ILAS1_L(x) SetField(JESD_TX_LANEn_ILAS1,"L",x)
  `define GET_JESD_TX_LANEn_ILAS1_L(x) GetField(JESD_TX_LANEn_ILAS1,"L",x)
  `define SET_JESD_TX_LANEn_ILAS1_Reserved(x) SetField(JESD_TX_LANEn_ILAS1,"Reserved",x)
  `define GET_JESD_TX_LANEn_ILAS1_Reserved(x) GetField(JESD_TX_LANEn_ILAS1,"Reserved",x)
  `define SET_JESD_TX_LANEn_ILAS1_LID(x) SetField(JESD_TX_LANEn_ILAS1,"LID",x)
  `define GET_JESD_TX_LANEn_ILAS1_LID(x) GetField(JESD_TX_LANEn_ILAS1,"LID",x)

  const reg_t JESD_TX_LANEn_ILAS2 = '{ 'h0318 + 'h20*n, "LANEn_ILAS2" , '{
    "JESDV": '{ 31, 29, RW, 'h0 },
    "S": '{ 28, 24, RW, 'h00 },
    "SUBCLASSV": '{ 23, 21, RW, 'h0 },
    "NP": '{ 20, 16, RW, 'h00 },
    "CS": '{ 15, 14, RW, 'h0 },
    "Reserved": '{ 13, 13, RO, 'h0 },
    "N": '{ 12, 8, RW, 'h00 },
    "M": '{ 7, 0, RW, 'h00 }}};
  `define SET_JESD_TX_LANEn_ILAS2_JESDV(x) SetField(JESD_TX_LANEn_ILAS2,"JESDV",x)
  `define GET_JESD_TX_LANEn_ILAS2_JESDV(x) GetField(JESD_TX_LANEn_ILAS2,"JESDV",x)
  `define SET_JESD_TX_LANEn_ILAS2_S(x) SetField(JESD_TX_LANEn_ILAS2,"S",x)
  `define GET_JESD_TX_LANEn_ILAS2_S(x) GetField(JESD_TX_LANEn_ILAS2,"S",x)
  `define SET_JESD_TX_LANEn_ILAS2_SUBCLASSV(x) SetField(JESD_TX_LANEn_ILAS2,"SUBCLASSV",x)
  `define GET_JESD_TX_LANEn_ILAS2_SUBCLASSV(x) GetField(JESD_TX_LANEn_ILAS2,"SUBCLASSV",x)
  `define SET_JESD_TX_LANEn_ILAS2_NP(x) SetField(JESD_TX_LANEn_ILAS2,"NP",x)
  `define GET_JESD_TX_LANEn_ILAS2_NP(x) GetField(JESD_TX_LANEn_ILAS2,"NP",x)
  `define SET_JESD_TX_LANEn_ILAS2_CS(x) SetField(JESD_TX_LANEn_ILAS2,"CS",x)
  `define GET_JESD_TX_LANEn_ILAS2_CS(x) GetField(JESD_TX_LANEn_ILAS2,"CS",x)
  `define SET_JESD_TX_LANEn_ILAS2_Reserved(x) SetField(JESD_TX_LANEn_ILAS2,"Reserved",x)
  `define GET_JESD_TX_LANEn_ILAS2_Reserved(x) GetField(JESD_TX_LANEn_ILAS2,"Reserved",x)
  `define SET_JESD_TX_LANEn_ILAS2_N(x) SetField(JESD_TX_LANEn_ILAS2,"N",x)
  `define GET_JESD_TX_LANEn_ILAS2_N(x) GetField(JESD_TX_LANEn_ILAS2,"N",x)
  `define SET_JESD_TX_LANEn_ILAS2_M(x) SetField(JESD_TX_LANEn_ILAS2,"M",x)
  `define GET_JESD_TX_LANEn_ILAS2_M(x) GetField(JESD_TX_LANEn_ILAS2,"M",x)

  const reg_t JESD_TX_LANEn_ILAS3 = '{ 'h031c + 'h20*n, "LANEn_ILAS3" , '{
    "FCHK": '{ 31, 24, RW, 'h00 },
    "Reserved": '{ 23, 8, RO, 'h0 },
    "HD": '{ 7, 7, RW, 'h0 },
    "Reserved": '{ 6, 5, RO, 'h0 },
    "CF": '{ 4, 0, RO, 'h00 }}};
  `define SET_JESD_TX_LANEn_ILAS3_FCHK(x) SetField(JESD_TX_LANEn_ILAS3,"FCHK",x)
  `define GET_JESD_TX_LANEn_ILAS3_FCHK(x) GetField(JESD_TX_LANEn_ILAS3,"FCHK",x)
  `define SET_JESD_TX_LANEn_ILAS3_Reserved(x) SetField(JESD_TX_LANEn_ILAS3,"Reserved",x)
  `define GET_JESD_TX_LANEn_ILAS3_Reserved(x) GetField(JESD_TX_LANEn_ILAS3,"Reserved",x)
  `define SET_JESD_TX_LANEn_ILAS3_HD(x) SetField(JESD_TX_LANEn_ILAS3,"HD",x)
  `define GET_JESD_TX_LANEn_ILAS3_HD(x) GetField(JESD_TX_LANEn_ILAS3,"HD",x)
  `define SET_JESD_TX_LANEn_ILAS3_Reserved(x) SetField(JESD_TX_LANEn_ILAS3,"Reserved",x)
  `define GET_JESD_TX_LANEn_ILAS3_Reserved(x) GetField(JESD_TX_LANEn_ILAS3,"Reserved",x)
  `define SET_JESD_TX_LANEn_ILAS3_CF(x) SetField(JESD_TX_LANEn_ILAS3,"CF",x)
  `define GET_JESD_TX_LANEn_ILAS3_CF(x) GetField(JESD_TX_LANEn_ILAS3,"CF",x)


endpackage
