library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.all;

entity clk_management is
    port (
        reset : in std_logic;
        clk : in std_logic;
        CE_debounce : out std_logic
    );
end clk_management;

architecture Structure of clk_management is

    signal counter : unsigned (25 downto 0) := (others => '0');
    signal pulse : std_logic := '0';

begin
    process (clk, reset) is
    begin
        if reset = '1' then
            counter <= (others => '0');
            pulse <= '0';
        elsif rising_edge(clk) then 
            counter <= counter + 1;
            if counter = 100000000 - 1 then
                counter <= (others => '0');
                pulse <= '1';
            else
                pulse <= '0';
            end if;
        end if;
    end process;

    CE_debounce <= pulse;

end Structure;