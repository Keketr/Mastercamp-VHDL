library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Multiplier is
    Port (
        X : in STD_LOGIC_VECTOR(3 downto 0);  -- First multiplicand
        Y : in STD_LOGIC_VECTOR(3 downto 0);  -- Second multiplicand
        Clk : in STD_LOGIC;                    -- Clock signal
        Result : out STD_LOGIC_VECTOR(7 downto 0)  -- Output result, 64 bits
    );
end Multiplier;

architecture Behavioral of Multiplier is
begin
    process(Clk)
    begin
        if rising_edge(Clk) then
            -- Multiply the two inputs, typecast to signed to handle potential negative numbers
            Result <= std_logic_vector(signed(X) * signed(Y));
        end if;
    end process;
end Behavioral;
