library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register is
    generic (
        WIDTH : integer := 32  -- Specify the width of the register, default is 32 bits
    );
    port (
        DataIn : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
        Reset : in  STD_LOGIC;
        Enable : in  STD_LOGIC;
        Clock : in  STD_LOGIC;
        DataOut : out  STD_LOGIC_VECTOR (WIDTH-1 downto 0)
    );
end entity;

architecture Behavioral of Register is
begin

    process (Clock, Reset)
    begin

        if Reset = '1' then
            DataOut <= (others => '0');  -- Clear the register on reset
        elsif rising_edge(Clock) then
            if Enable = '1' then
                DataOut <= DataIn;  -- Load the input into the register if enabled
            end if;
        end if;

    end process;

end architecture;
