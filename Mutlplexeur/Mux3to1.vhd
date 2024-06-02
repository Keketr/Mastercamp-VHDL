library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux3to1 is
    Port (
        AddSubOut : in STD_LOGIC_VECTOR(31 downto 0);  -- Output from Adder/Subtractor
        MultOut   : in STD_LOGIC_VECTOR(31 downto 0);  -- Output from Multiplier
        LogicOut  : in STD_LOGIC_VECTOR(31 downto 0);  -- Output from Logic Unit
        Sel       : in STD_LOGIC_VECTOR(1 downto 0);   -- Selector (2 bits)
        Out       : out STD_LOGIC_VECTOR(31 downto 0)  -- Output
    );
end Mux3to1;

architecture Behavioral of Mux3to1 is
begin
    -- Output selection based on the Sel input
    process(Sel, AddSubOut, MultOut, LogicOut)
    begin
        case Sel is
            when "00" =>
                Out <= AddSubOut;  -- Output from Adder/Subtractor
            when "01" =>
                Out <= MultOut;    -- Output from Multiplier
            when "10" =>
                Out <= LogicOut;   -- Output from Logic Unit
            when others =>
                Out <= (others => '0'); -- Default or safe state
        end case;
    end process;
end Behavioral;
