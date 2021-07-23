-- Projeto Sistemas Digitais - Gerador
library ieee;
use ieee.std_logic_1164.all;

entity gerador
is port(clk : in std_logic;
 		resetn : in std_logic;
 		seq : out std_logic
);
end entity gerador;

architecture arqger of gerador is
	signal package1, package2, package3 : std_logic_vector(0 to 8);
begin
	process
	begin
		package1 <= "101011100";
		package2 <= "101001110";
		package3 <= "001011100";
		
		--package1 <= "001001110";
		--package2 <= "001101100";
		--package2 <= "000000000";
		
		for i in 0 to 8 loop
			if i=0 then
				if package1(0)='0' then
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
				seq <= package1(i);
			end if;
		end loop;

		for i in 0 to 8 loop
			if i=0 then
				if package2(0)='0' then
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
				seq <= package2(i);
			end if;
		end loop;

		for i in 0 to 8 loop
			if i=0 then
				if package3(0)='0' then
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
				seq <= package3(i);
			end if;
		end loop;

		wait;
	end process;
end arqger;