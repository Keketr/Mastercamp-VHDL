library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2to1 is
    Port (
        R : in STD_LOGIC_VECTOR(31 downto 0);  -- Input from register R
        Y : in STD_LOGIC_VECTOR(31 downto 0);  -- Input Y
        Sel : in STD_LOGIC;                    -- Selector bit
        Out : out STD_LOGIC_VECTOR(31 downto 0) -- Output either R or Y
    );
end Mux2to1;

architecture Behavioral of Mux2to1 is
begin
    -- Output selection based on the Sel input
    Out <= R when Sel = '0' else
           Y;
end Behavioral;
