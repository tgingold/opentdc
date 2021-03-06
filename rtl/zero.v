// Time to Digital Conversion (TDC) core
// SPDX-FileCopyrightText: (c) 2020 Tristan Gingold <tgingold@free.fr>
// SPDX-License-Identifier: Apache-2.0

// Stupid macro that just outputs '0'.
// The purpose is to avoid standard cells at the top-level in order to not have
// to fill with taps (and thus make DRC much faster).

//  Those modules are filtered out so not visible to Yosys!
//  We need to declare them

//  Declare cells here, unless in testbench
`ifndef FUNCTIONAL
(* blackbox *)
module  sky130_fd_sc_hd__fill_4 ();
endmodule

(* blackbox *)
module  sky130_fd_sc_hd__or2_4(A, B, X);
   input A;
   input B;
   output X;
endmodule // sky130_fd_sc_hd__or2_4

(* blackbox *)
module  sky130_fd_sc_hd__buf_2(A, X);
   input A;
   output X;
endmodule

(* blackbox *)
module sky130_fd_sc_hd__conb_1 (HI, LO);
   input HI;
   input LO;
endmodule

(* blackbox *)
module sky130_fd_sc_hd__clkbuf_16 (A, X);
   input A;
   output X;
endmodule

(* blackbox *)
module sky130_fd_sc_hd__clkbuf_1 (A, X);
   input A;
   output X;
endmodule
`endif //  `ifndef FUNCTIONAL

module zero(n_o, s_o, w_o, e_o, n1_o, clk_i, clk_o);
   output [11:0] e_o;
   output n_o;
   output n1_o;
   output s_o;
   output w_o;
   input clk_i;
   output [3:0] clk_o;
   wire  w;
   wire  clk;

`ifdef FUNCTIONAL
   assign n_o = 0;
   assign n1_o = 1;
   assign s_o = 0;
   assign w_o = 0;
   assign e_o = 0;
   assign clk = clk_i;
   assign clk_o = {4{clk}};
`else

   sky130_fd_sc_hd__buf_2 LEFT1a (.A(w), .X(w_o));
   sky130_fd_sc_hd__buf_2 LEFT2a (.A(w), .X(n_o));
   (* keep *)
   sky130_fd_sc_hd__fill_4 LEFT1 ();
   (* keep *)
   sky130_fd_sc_hd__fill_4 LEFT2 ();
   (* keep *)
   sky130_fd_sc_hd__conb_1 ZEROA (.LO(w), .HI(n1_o));
   (* keep *)
   sky130_fd_sc_hd__fill_4 RIGHT1 ();
   (* keep *)
   sky130_fd_sc_hd__fill_4 RIGHT2 ();
   sky130_fd_sc_hd__buf_2 RIGHT1a (.A(w), .X(s_o));
   sky130_fd_sc_hd__buf_2 RIGHT2a[11:0] (.A(w), .X(e_o));

   sky130_fd_sc_hd__clkbuf_1 CLKBUF (.A(clk_i), .X(clk));
   sky130_fd_sc_hd__clkbuf_16 CLKBUF_0 (.A(clk_i), .X(clk_o[0]));
   sky130_fd_sc_hd__clkbuf_16 CLKBUF_1 (.A(clk_i), .X(clk_o[1]));
   sky130_fd_sc_hd__clkbuf_16 CLKBUF_2 (.A(clk_i), .X(clk_o[2]));
   sky130_fd_sc_hd__clkbuf_16 CLKBUF_3 (.A(clk_i), .X(clk_o[3]));
`endif

endmodule
