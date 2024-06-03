----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.06.2024 11:43:50
-- Design Name: 
-- Module Name: mux2to1 - Structure
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2to1 is
  Port (m0, m1 : in std_logic_vector(3 downto 0 );
        sel : in std_logic;
        mout : out std_logic_vector(3 downto 0)
        );
end entity mux2to1;

architecture Structure of mux2to1 is
begin
process(m0, m1, sel) is
begin
    if sel = '0' then
        mout <= m0;
    else
        mout<=m1;
    end if;
end process;
end Structure;