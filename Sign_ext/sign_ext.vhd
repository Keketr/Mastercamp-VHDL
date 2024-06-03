library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity sign is 
    Port (
        Din : in STD_LOGIC_VECTOR(3 downto 0) -- Sortie de l'adder/sub
        Dout : out STD_LOGIC_VECTOR(7 downto 0) -- Output add sign bit


    );
end sign;

architecture Behavioral of sign is 
begin

    
    Dout(0) <= Din(3) & Din(3) & Din(3) & Din(3) & Din ; -- Sign bit

end architecture sign;