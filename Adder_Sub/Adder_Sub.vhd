library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder_Sub is
    Port (
        X : in STD_LOGIC_VECTOR(31 downto 0);  -- First input
        Y : in STD_LOGIC_VECTOR(31 downto 0);  -- Second input
        R : in STD_LOGIC_VECTOR(31 downto 0);  -- Result register, can be input as well
        Op : in STD_LOGIC_VECTOR(2 downto 0);  -- Operation code
        Clk : in STD_LOGIC;                    -- Clock signal
        Result : out STD_LOGIC_VECTOR(31 downto 0)  -- Output result
    );
end Adder_Sub;

architecture Behavioral of Adder_Sub is
begin
    process(Clk)
    begin
        if rising_edge(Clk) then
            case Op is
                when "000" =>  -- X + Y
                    Result <= std_logic_vector(signed(X) + signed(Y));
                when "001" =>  -- X - Y
                    Result <= std_logic_vector(signed(X) - signed(Y));
                when "010" =>  -- R + Y
                    Result <= std_logic_vector(signed(R) + signed(Y));
                when "011" =>  -- R - Y
                    Result <= std_logic_vector(signed(R) - signed(Y));
                when others =>
                    Result <= (others => '0');  
            end case;
        end if;
    end process;
end Behavioral;
