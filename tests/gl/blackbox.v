//SPDX-FileCopyrightText: (c) 2020 Tristan Gingold <tgingold@free.fr>
//SPDX-License-Identifier: Apache-2.0
/* Generated by Yosys 0.9+2406 (git sha1 f7fdd99, gcc 4.8.5 -fPIC -Os) */

module fd_hd(clk_i, rst_n_i, bus_in, bus_out, out1_o, out2_o, VGND, VPWR);
   input VGND;
   input VPWR;
  input [41:0] bus_in;
  output [34:0] bus_out;
  input clk_i;
  output out1_o;
  output out2_o;
  input rst_n_i;
endmodule

module fd_hd_25_1(clk_i, rst_n_i, bus_in, bus_out, out_o, VGND, VPWR);
   input VGND;
   input VPWR;
  input [41:0] bus_in;
  output [34:0] bus_out;
  input clk_i;
  output out_o;
  input rst_n_i;
endmodule

module fd_hs(clk_i, rst_n_i, bus_in, bus_out, out1_o, out2_o, VGND, VPWR);
   input VGND;
   input VPWR;
  input [41:0] bus_in;
  output [34:0] bus_out;
  input clk_i;
  output out1_o;
  output out2_o;
  input rst_n_i;
endmodule

module fd_inline_1(clk_i, rst_n_i, bus_in, bus_out, out_o, VGND, VPWR);
   input VGND;
   input VPWR;
  input [41:0] bus_in;
  output [34:0] bus_out;
  input clk_i;
  output out_o;
  input rst_n_i;
endmodule

module fd_ms(clk_i, rst_n_i, bus_in, bus_out, out1_o, out2_o, VGND, VPWR);
   input VGND;
   input VPWR;
  input [41:0] bus_in;
  output [34:0] bus_out;
  input clk_i;
  output out1_o;
  output out2_o;
  input rst_n_i;
endmodule

module rescue_top(la_data_in, la_oen, clk_i, tdc_inp_i, la_data_out, fd_out_o, fd_oen_o, VGND, VPWR);
   input VGND;
   input VPWR;
  input clk_i;
  output fd_oen_o;
  output fd_out_o;
  input [127:0] la_data_in;
  output [127:0] la_data_out;
  input [127:0] la_oen;
  input tdc_inp_i;
endmodule

module tdc_inline_1(clk_i, rst_n_i, bus_in, inp_i, bus_out, VGND, VPWR);
   input VGND;
   input VPWR;
  input [41:0] bus_in;
  output [34:0] bus_out;
  input clk_i;
  input inp_i;
  input rst_n_i;
endmodule

module tdc_inline_2(clk_i, rst_n_i, bus_in, inp_i, bus_out, VGND, VPWR);
   input VGND;
   input VPWR;
  input [41:0] bus_in;
  output [34:0] bus_out;
  input clk_i;
  input inp_i;
  input rst_n_i;
endmodule

module tdc_inline_3(clk_i, rst_n_i, bus_in, inp_i, bus_out, VGND, VPWR);
   input VGND;
   input VPWR;
  input [41:0] bus_in;
  output [34:0] bus_out;
  input clk_i;
  input inp_i;
  input rst_n_i;
endmodule

module wb_extender(down_bus_out, down_rst_n_o, down_bus_in, down_adr_o, clk_i, up_rst_n_i, up_bus_in, up_adr_i, dev0_bus_out, dev1_bus_out, dev2_bus_out, dev3_bus_out, up_bus_out, dev0_rst_n, dev0_bus_in, dev1_rst_n, dev1_bus_in, dev2_rst_n, dev2_bus_in, dev3_rst_n, dev3_bus_in, VGND, VPWR);
   input VGND;
   input VPWR;
  input clk_i;
  output [41:0] dev0_bus_in;
  input [34:0] dev0_bus_out;
  output dev0_rst_n;
  output [41:0] dev1_bus_in;
  input [34:0] dev1_bus_out;
  output dev1_rst_n;
  output [41:0] dev2_bus_in;
  input [34:0] dev2_bus_out;
  output dev2_rst_n;
  output [41:0] dev3_bus_in;
  input [34:0] dev3_bus_out;
  output dev3_rst_n;
  output [4:0] down_adr_o;
  output [41:0] down_bus_in;
  input [34:0] down_bus_out;
  output down_rst_n_o;
  input [4:0] up_adr_i;
  input [41:0] up_bus_in;
  output [34:0] up_bus_out;
  input up_rst_n_i;
endmodule


