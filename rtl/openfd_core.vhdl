-- Fine Delay (FD) core
-- SPDX-FileCopyrightText: (c) 2020 Tristan Gingold <tgingold@free.fr>
-- SPDX-License-Identifier: Apache-2.0

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity openfd_core is
  generic (
    --  log2(nbr_taps).  This is also the number of significant bits of
    --  fine_i
    plen : natural := 7);
  port (
    clk_i : std_logic;
    rst_n_i : std_logic;

    --  Current time (in cycles).
    cur_cycles_i : std_logic_vector(31 downto 0);

    --  Parameters for the next pulse.
    coarse_i  : std_logic_vector(31 downto 0);
    fine_i    : std_logic_vector(15 downto 0);
    valid_i   : std_logic;

    --  Set on valid, cleared on the pulse.
    busy_o    : out std_logic;

    --  Pulse (of clk_i width), delayed by coarse + fine
    out_o     : out std_logic);
end openfd_core;

architecture behav of openfd_core is
  signal coarse  : std_logic_vector(31 downto 0);
  signal fine    : std_logic_vector(plen - 1 downto 0);
  signal valid   : std_logic;

  signal pulse : std_logic;

  signal taps : std_logic_vector (plen downto 0);
begin
  process (clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_n_i = '0' then
        coarse <= (others => '0');
        fine <= (others => '0');
        valid <= '0';
      elsif valid_i = '1' then
        coarse <= std_logic_vector (unsigned(coarse_i) - 1);
        fine <= fine_i(fine'range);
        valid <= '1';
      elsif pulse = '1' then
        valid <= '0';
      end if;
    end if;
  end process;

  busy_o <= valid;

  process (clk_i)
  begin
    if rising_edge (clk_i) then
      if rst_n_i = '0' then
        pulse <= '0';
      elsif valid = '1' and coarse = cur_cycles_i then
        pulse <= '1';
      else
        pulse <= '0';
      end if;
    end if;
  end process;

  inst_delay: entity work.openfd_delayline
    generic map (
      plen => plen)
    port map (
      inp_i => pulse,
      out_o => out_o,
      delay_i => fine);
end behav;
