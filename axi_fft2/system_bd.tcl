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

# Create FFT Core
global xfft
ad_ip_instance xfft dut_fft $xfft

# Connect clock and reset
ad_connect $sys_cpu_clk dut_axi_fft/s_axi_aclk
ad_connect $sys_cpu_resetn dut_axi_fft/s_axi_aresetn
ad_connect $sys_cpu_clk dut_fft/aclk
ad_connect $sys_cpu_resetn dut_fft/aresetn

# Connect S_AXI to CPU
ad_cpu_interconnect 0x7c420000 dut_axi_fft

# Connect AXI Core to FFT Core
ad_connect dut_axi_fft/m_axis_i dut_fft/s_axis_data
ad_connect dut_fft/m_axis_data dut_axi_fft/s_axis_o
ad_connect dut_axi_fft/m_axis_c dut_fft/s_axis_config