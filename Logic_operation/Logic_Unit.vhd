library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- For using unsigned data types

entity Logic_Unit is
    Port (
        X : in STD_LOGIC_VECTOR(31 downto 0);    -- First operand
        Y : in STD_LOGIC_VECTOR(31 downto 0);    -- Second operand (not used for NOT operation)
        Op : in STD_LOGIC_VECTOR(2 downto 0);    -- Operation selector, 3-bit to select logic function
        Result : out STD_LOGIC_VECTOR(31 downto 0) -- Result of the logic operation
    );
end Logic_Unit;

architecture Behavioral of Logic_Unit is
begin
    process(X, Y, Op)
    begin
        case Op is
            when "101" =>  -- AND operation
                Result <= X and Y;
            when "110" =>  -- OR operation
                Result <= X or Y;
            when "111" =>  -- NOT operation (only X is used)
                Result <= not X;
            when others => 
                Result <= (others => '0');  -- Default case to handle undefined operations
        end case;
    end process;
end Behavioral;
