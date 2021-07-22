-- DETECTOR / DECODIFICADOR

library ieee;
use ieee.std_logic_1164.all;

entity detector is port(
		clk : in std_logic;									-- clock ativo em borda de subida
		resetn : in std_logic;								-- resetn recebe '0' se é identificado cabeçalho dentro dos dados
 		input : in std_logic;								-- input recebe a sequencia enviada pelo gerador
 		seqdec : out std_logic_vector(0 to 7);			-- seqdec vetor sequencia decodificada
 		valid_out : out std_logic							-- valid_out quando for '1' seqdec exibe a sequencia
);
end entity detector;

architecture arqdet of detector is

begin
	-- declaração do cabeçalho
	c: in std_logic_vector(0 to 4);						
	
	-- valor do cabeçalho
	if input = 0 then
		c <= "11011";
	else
		c <= "00110";
		
	-- decodificação da sequencia
	for i in seqdec'left downto seqdec'right + 1 loop
		if seqdec(i <= 4) then
			seqdec <= c(i) xor seqdec(i);
		else
			seqdec(i) <= Slv6(i-1);
	end loop;




end arqdet;