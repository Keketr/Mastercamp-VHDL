library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux3to1 is
  Port (m2, m3, m4 : in std_logic_vector(7 downto 0);
        sel2 : in std_logic_vector(1 downto 0);
        result : out std_logic_vector(7 downto 0)
         );
end mux3to1;

architecture Structure of mux3to1 is

begin
    process(m2, m3, m4, sel2)
    begin   
        if sel2 = "00" then
            result <= m2;
        elsif sel2 = "01" then
            result <= m3;
        elsif sel2 = "10" then
            result <= m4;
        end if;
    end process;
        
end Structure;