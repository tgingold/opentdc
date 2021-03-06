# SPDX-FileCopyrightText: (c) 2020 Tristan Gingold <tgingold@free.fr>
# SPDX-License-Identifier: Apache-2.0

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) wb_extender
set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::env(VERILOG_FILES) "$script_dir/../../src/wb_extender.v"

set ::env(CLOCK_PORT) "clk_i"
set ::env(CLOCK_NET) "clk_i"

set ::env(DESIGN_IS_CORE) 0

# mgmt core uses 50, so we have a margin
set ::env(CLOCK_PERIOD) "20"

set ::env(FP_SIZING) absolute

# .46*2800  2.72*50
set ::env(DIE_AREA) "0 0 1288.0 130.56"
set ::env(PL_TARGET_DENSITY) 0.25

# Do not zeroize
set ::env(MAGIC_ZEROIZE_ORIGIN) 0

#set ::env(PL_TARGET_DENSITY_CELLS) 0.2
#set ::env(CELL_PAD) 12

set ::env(DIODE_INSERTION_STRATEGY) 3
#set ::env(GLB_RT_MAX_DIODE_INS_ITERS) 3
#set ::env(PL_RESIZER_OVERBUFFER) 1

# Avoid weird optims
#set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 1

# Too much memory
set ::env(RUN_SPEF_EXTRACTION) 1
