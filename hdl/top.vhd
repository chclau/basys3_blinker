----------------------------------------------------------------------------------
-- Company:  FPGA'er
-- Engineer: Claudio Avi Chami - FPGA'er Website
--           http://fpgaer.tech
-- Create Date: 08.09.2022 
-- Module Name: top.vhd
-- Description: Top level of simple design which lits four LEDs usign counter
--              LEDs speed changed by SW0
-- Dependencies: None
-- 
-- Revision: 1
-- Revision  1 - File Created
-- 
----------------------------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity top is
	
  port (
		CLK: 		  in std_logic;
		
		-- inputs
		SW: 		  in std_logic_vector(0 downto 0);
		
		-- outputs
		LED:      out std_logic_vector (3 downto 0)
	);
end top;


architecture rtl of top is
	signal counter_reg : std_logic_vector (28 downto 0);

begin 

  counter_pr: process (CLK) 
  begin 
    if (rising_edge(CLK)) then
      counter_reg <= counter_reg - 1;	-- decrement counter
    end if;
  end process counter_pr;

  LED <= counter_reg(28 downto 25) when SW(0) = '0' else
         counter_reg(26 downto 23);

end rtl;