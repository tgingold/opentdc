-- Fine Delay with osu 18T hs tech
--
-- SPDX-FileCopyrightText: (c) 2020 Tristan Gingold <tgingold@free.fr>
-- SPDX-License-Identifier: Apache-2.0

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.opentdc_pkg.all;
use work.opendelay_comps.all;

entity fd_18hs is
  port (
    --  Control
    clk_i : std_logic;
    rst_n_i : std_logic;

    bus_in : dev_bus_in;
    bus_out : out dev_bus_out;

    out_o : out std_logic);
end fd_18hs;

architecture behav of fd_18hs is
  constant length : natural := 9;
  signal delay : std_logic_vector(length - 1 downto 0);
  signal pulse : std_logic;
begin
  inst_delay_line: delayline_9_osu_18hs
    port map (
      inp_i => pulse, out_o => out_o, en_i => delay);

  inst_core: entity work.openfd_core2
    generic map (
      g_with_ref => false,
      plen => length)
    port map (
      clk_i => clk_i,
      rst_n_i => rst_n_i,
      idelay_o => delay,
      ipulse_o => pulse,
      bin => bus_in,
      bout => bus_out);
end behav;
