# ***************************************************************************
# ***************************************************************************
# Copyright 2022 (c) Analog Devices, Inc. All rights reserved.
#
# In this HDL repository, there are many different and unique modules, consisting
# of various HDL (Verilog or VHDL) components. The individual modules are
# developed independently, and may be accompanied by separate and unique license
# terms.
#
# The user should read each of these license terms, and understand the
# freedoms and responsibilities that he or she has by using this source/core.
#
# This core is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.
#
# Redistribution and use of source or resulting binaries, with or without modification
# of this file, are permitted under one of the following two license terms:
#
#   1. The GNU General Public License version 2 as published by the
#      Free Software Foundation, which can be found in the top level directory
#      of this repository (LICENSE_GPL2), and also online at:
#      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
#
# OR
#
#   2. An ADI specific BSD license, which can be found in the top level directory
#      of this repository (LICENSE_ADIBSD), and also on-line at:
#      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
#      This will allow to generate bit files and not release the source code,
#      as long as it attaches to an ADI device.
#
# ***************************************************************************
# ***************************************************************************

source ../../scripts/adi_env.tcl

#  ------------------
#
# Blocks under test 
#
#  ------------------

# Create AXI FFT Core
global axi_fft
ad_ip_instance axi_fft dut_axi_fft $axi_fft

# Create AXIS Periherals
ad_ip_instance axi4stream_vip s_axis_input
adi_sim_add_define "S_AXIS_INPUT=s_axis_input"
ad_ip_parameter s_axis_input CONFIG.INTERFACE_MODE {SLAVE}
ad_ip_parameter s_axis_input CONFIG.HAS_TREADY {1}
ad_ip_parameter s_axis_input CONFIG.HAS_TLAST {1}
ad_ip_parameter s_axis_input CONFIG.TDATA_NUM_BYTES 8

ad_ip_instance axi4stream_vip m_axis_output
adi_sim_add_define "M_AXIS_OUTPUT=m_axis_output"
ad_ip_parameter m_axis_output CONFIG.INTERFACE_MODE {MASTER}
ad_ip_parameter m_axis_output CONFIG.HAS_TREADY {1}
ad_ip_parameter m_axis_output CONFIG.HAS_TLAST {1}
ad_ip_parameter m_axis_output CONFIG.TDATA_NUM_BYTES 8

ad_ip_instance axi4stream_vip s_axis_config
adi_sim_add_define "S_AXIS_CONFIG=s_axis_config"
ad_ip_parameter s_axis_config CONFIG.INTERFACE_MODE {SLAVE}
ad_ip_parameter s_axis_config CONFIG.HAS_TREADY {1}
ad_ip_parameter s_axis_config CONFIG.HAS_TLAST {1}
ad_ip_parameter s_axis_config CONFIG.TDATA_NUM_BYTES $ad_project_params(CONFIG_NUM_BYTES)

# Connect clock and reset
ad_connect $sys_cpu_clk dut_axi_fft/s_axi_aclk
ad_connect $sys_cpu_resetn dut_axi_fft/s_axi_aresetn
ad_connect $sys_cpu_clk s_axis_input/aclk
ad_connect $sys_cpu_resetn s_axis_input/aresetn
ad_connect $sys_cpu_clk m_axis_output/aclk
ad_connect $sys_cpu_resetn m_axis_output/aresetn
ad_connect $sys_cpu_clk s_axis_config/aclk
ad_connect $sys_cpu_resetn s_axis_config/aresetn

# Connect S_AXI to CPU
ad_cpu_interconnect 0x7c420000 dut_axi_fft

# Connect AXIS to FFT core
ad_connect dut_axi_fft/m_axis_i s_axis_input/s_axis
ad_connect m_axis_output/m_axis dut_axi_fft/s_axis_o
ad_connect dut_axi_fft/m_axis_c s_axis_config/s_axis
