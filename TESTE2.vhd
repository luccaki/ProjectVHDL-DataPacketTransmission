-- DETECTOR / DECODIFICADOR

library ieee;
use ieee.std_logic_1164.all;

entity detector is port(
		clk : in std_logic;									-- clock ativo em borda de subida
		resetn : in std_logic;								
 		input : in std_logic;								-- recebe os bits do gerador
 		seqdec : out std_logic_vector(0 to 7);			-- seqdec vetor sequencia decodificada
 		valid_out : out std_logic							-- valid_out quando for '1' seqdec exibe a sequencia
);
end entity detector;

architecture arqdet of detector is
	signal seqdecaux: std_logic_vector(0 to 7);				-- vetor auxiliar sequencia decodificada
	signal c: std_logic_vector(0 to 4);							-- variavel para o cabeçalho usado na decodificação
begin
	main_detector: process
		variable count : integer range 0 to 7 := 0;			-- inteiro como contador de 0 até 7 para cada um dos 8 bit de dados
		variable count_aux : integer range 2 to 4 := 4;		-- contador auxiliar para decodificar os 3 ultimos bits
		variable count_c_aux : integer range 0 to 2 := 0;	-- contador auxiliar para cabeçalho
		variable has_c: std_logic := '0';						-- variavel fica em '0' enquanto não é identificado cabeçalho, decodificação so começa quando has_c for '1'
		type A_State is (A1, A2, A3, A4, A5);
		type B_State is (B1, B2, B3, B4, B5);
		variable AState : A_State;									
		variable BState : B_State;									
		begin
		
--MAQUINA DE ESTADOS===========================			
			case AState is
				when A1 =>
					report "A1";
					if input = '1' then			-- "1"
						AState := A2;
					else
						AState := A1;
					end if;
					
				when A2 =>
					report "A2";
					if input = '1' then			-- "11"
						AState := A3;
					else
						AState := A1;
					end if;					
			
				when A3 =>
					report "A3";
					if input = '0' then			-- "110"
						AState := A4;
					else
						AState := A3;
					end if;		

				when A4 =>
					report "A4";
					if input = '1' then			-- "1101"
						AState := A5;
					else
						AState := A1;
					end if;

				when A5 =>
					report "A5";
					if input = '1' then				-- ENCONTROU CABECALHO "11011"
						count := 0;						-- Zera os contadores
						count_aux := 4;
						count_c_aux := 0;
						has_c := '1';					-- Pode começar decodificar os proximos bits
						c <= "11011";					-- Define cabeçalho para decodificar
						AState := A3;					
					else
						AState := A1;
					end if;
				end case;
--=============================================
			case BState is
				when B1 =>
					report "B1";
					if input = '0' then			-- "0"
						BState := B2;
					else
						BState := B1;
					end if;
					
				when B2 =>
					report "B2";
					if input = '0' then			-- "00"
						BState := B3;
					else
						BState := B1;
					end if;					
			
				when B3 =>
					report "";
					if input = '1' then			-- "001"
						BState := B4;
					else
						BState := B3;
					end if;		

				when B4 =>
					report "B4";
					if input = '1' then			-- "0011"
						BState := B5;
					else
						BState := B2;
					end if;

				when B5 =>
					report "B5";
					if input = '0' then				-- ENCONTROU CABECALHO "00110"
						count := 0;						-- Zera os contadores
						count_aux := 4;
						count_c_aux := 0;
						has_c := '1';					-- Pode começar decodificar os proximos bits
						c <= "11011";					-- Define cabeçalho para decodificar
						BState := B2;					
					else
						BState := B1;
					end if;
			end case;

--DECODIFICADOR================================				
			
			WAIT UNTIL (clk'EVENT AND clk = '1');	

			if has_c = '1' then
				-- Decodifica os bits 0 até 4
				if count < 5 then
					valid_out <= '0';
					seqdecaux(count) <= c(count) xor input;
					count := count + 1;
				-- Decodifica os bits 5 e 6
				elsif count < 7 then
					seqdecaux(count) <= c(count_c_aux) xor input xor seqdecaux(count_aux);
					count := count + 1;
					count_c_aux := count_c_aux + 1;
					count_aux := count_aux - 1;
				-- Decodifica o último bit
				else
					seqdecaux(count) <= c(count_c_aux) xor input xor seqdecaux(count_aux);
					-- Pensar em como mostrar "seqdec" e onde zerar novamente o "valid_out"
					valid_out <= '1';
					-- Zerar contadores
					count := 0;
					count_aux := 4;
					count_c_aux := 0;
				end if;
			end if;
				
	end process;

	--seqdec_process: process (seqdecaux) begin
	--	seqdec <= seqdecaux;
	--end process;
end arqdet;