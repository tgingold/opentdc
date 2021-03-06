# SPDX-FileCopyrightText: (c) 2020 Tristan Gingold <tgingold@free.fr>
# SPDX-License-Identifier: Apache-2.0

package require openlane
set script_dir [file dirname [file normalize [info script]]]

prep -design $script_dir -tag user -overwrite
set save_path $script_dir/../..

verilog_elaborate
#run_synthesis

run_floorplan

run_placement

set y 57.120

set x [expr 44 * 0.46]
add_macro_placement LEFT1 $x $y N
set x [expr $x + 4 * 0.46]
add_macro_placement LEFT2 $x $y N
set x [expr $x + 4 * 0.46]
add_macro_placement ZEROA $x $y N
set x [expr $x + 3 * 0.46]
add_macro_placement RIGHT1 $x $y N
set x [expr $x + 4 * 0.46]
add_macro_placement RIGHT2 $x $y N

manual_macro_placement f

run_routing
write_powered_verilog
set_netlist $::env(lvs_result_file_tag).powered.v

run_magic
run_magic_spice_export

run_magic_drc

run_lvs; # requires run_magic_spice_export

run_antenna_check
