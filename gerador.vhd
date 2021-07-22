-- Projeto Sistemas Digitais - Gerador
library ieee;
use ieee.std_logic_1164.all;

entity gerador
is port(clk : in std_logic;
 		resetn : in std_logic;
		inputger : in std_logic;
 		seq : out std_logic
);
end entity gerador;

architecture arqger of gerador is
begin
	--state_register: process (clk)
	--begin
	--	if (clk'event and clk = '1') then
	--		seq <= inputger;
	--	end if;
	--end process;
	process
	begin
		for i in 0 to 8 loop
			if i=0 then
				if inputger='0' then
					WAIT UNTIL (clk'EVENT AND clk = '1') ;
					seq <= '1';
					WAIT UNTIL (clk'EVENT AND clk = '1') ;
					seq <= '1';
					WAIT UNTIL (clk'EVENT AND clk = '1') ;
					seq <= '0';
					WAIT UNTIL (clk'EVENT AND clk = '1') ;
					seq <= '1';
					WAIT UNTIL (clk'EVENT AND clk = '1') ;
					seq <= '1';
				else
					WAIT UNTIL (clk'EVENT AND clk = '1') ;
					seq <= '0';
					WAIT UNTIL (clk'EVENT AND clk = '1') ;
					seq <= '0';
					WAIT UNTIL (clk'EVENT AND clk = '1') ;
					seq <= '1';
					WAIT UNTIL (clk'EVENT AND clk = '1') ;
					seq <= '1';
					WAIT UNTIL (clk'EVENT AND clk = '1') ;
					seq <= '0';
				end if;
			else
				wait until (clk'event and clk = '1') ;
				seq <= inputger;
			end if;

		end loop;
	end process;
end arqger;