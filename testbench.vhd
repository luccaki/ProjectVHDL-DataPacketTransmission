-- Projeto Sistemas Digitais - Testbench
library ieee;
use ieee.std_logic_1164.all;

entity testbench is
	constant PERIOD : time := 100 ns;
end testbench;

architecture tb_arch of testbench is
   	signal test_out: std_logic;
	signal clk: std_logic;
	signal resetn: std_logic;
begin
   	-- instancia o circuito sob test (uut - unit under test)
   	uut: entity work.gerador(arqger)
   	   port map(clk, resetn, inputger=>test_out);
   	-- gerador dos vetores de teste
	   
   	process
	   variable test1, test2, test3, test4, test5: std_logic_vector(0 to 8);
   	begin
		
		test1 := "101011100";
		test2 := "101001110";
		test3 := "001011100";
		test4 := "001001110";
		test5 := "001101100";

		for i in 0 to 8 loop
			test_out <= test1(i);
			wait for PERIOD;
		end loop;

		for i in 0 to 8 loop
			test_out <= test2(i);
			wait for PERIOD;
		end loop;

		for i in 0 to 8 loop
			test_out <= test3(i);
			wait for PERIOD;
		end loop;

		for i in 0 to 8 loop
			test_out <= test4(i);
			wait for PERIOD;
		end loop;

		for i in 0 to 8 loop
			test_out <= test5(i);
			wait for PERIOD;
		end loop;
      	wait;
	end process;

	generate_clock: process
	begin
		clk <= '1';
		wait for PERIOD/2;
		clk <= '0';
		wait for PERIOD/2;
	end process;
end tb_arch;
