-- Projeto Sistemas Digitais - Testbench
library ieee;
use ieee.std_logic_1164.all;

entity testbench is 
	constant PERIOD : time := 500 us;	
end testbench;

architecture tb_arch of testbench is
   	signal test_out: std_logic;
	signal clk: std_logic;
	signal resetn: std_logic;
	signal outputgerador: std_logic;
begin
   	-- instancia o circuito sob test (uut - unit under test)
   	utg: entity work.gerador(arqger)
   	   port map(clk, resetn, outputgerador);

	utd: entity work.detector(arqdet)
   	   port map(clk, resetn, input=>outputgerador);

	generate_clock: process
	begin
		clk <= '1';
		wait for PERIOD/2;
		clk <= '0';
		wait for PERIOD/2;
	end process;
	
end tb_arch;