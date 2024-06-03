library ieee;
use ieee.std_logic_1164.all;

entity reg8 is
    port (
        in_1 : in std_logic_vector (7 downto 0);
        clock : in std_logic;
        out_1 : out std_logic_vector (7 downto 0)
    );
end entity;

architecture reg8_arch of reg8 is
begin

    process (clock)
    begin

        if rising_edge(clock) then
            out_1 <= in_1;
        end if;

    end process;

end architecture;
