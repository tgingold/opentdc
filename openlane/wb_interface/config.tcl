# SPDX-FileCopyrightText: (c) 2020 Tristan Gingold <tgingold@free.fr>
# SPDX-License-Identifier: Apache-2.0

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) wb_interface
set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::env(VERILOG_FILES) "$script_dir/../../src/wb_interface.v"
set ::env(VERILOG_FILES_BLACKBOX) "$script_dir/../../src/wb_interface_bb.v"

#set ::env(CLOCK_PORT) "user_clock2"
set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "wb_clk_i"

set ::env(BASE_SDC_FILE) "$script_dir/wb_interface.sdc"

set ::env(SYNTH_NO_FLAT) 1

# mgmt core uses 50, so we have a margin
set ::env(CLOCK_PERIOD) "20"

set ::env(FP_SIZING) absolute
#set ::env(DIE_AREA) "0 0 2920 3520"

# .46 2.72
set ::env(DIE_AREA) "0 0 460 1360"
set ::env(PL_TARGET_DENSITY) 0.4
set ::env(GLB_RT_OVERFLOW_ITERS) 20

set ::env(DIODE_INSERTION_STRATEGY) 3
#set ::env(GLB_RT_MAX_DIODE_INS_ITERS) 3

# Avoid weird optims
set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 1