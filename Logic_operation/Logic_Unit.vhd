library ieee;
use ieee.std_logic_1164.all;

entity logic_unit is
    generic (n : integer := 4);
    port (
        in_1, in_2 : in std_logic_vector (n-1 downto 0);
        selector : in std_logic_vector (1 downto 0);
        out_1 : out std_logic_vector (n-1 downto 0)
    );
end entity;

architecture logic_unit_arch of logic_unit is
begin

    with selector select
        out_1 <= in_1 and in_2 when "01",
                in_1 or in_2 when "10",
                not in_1 when "11",
                (others => 'X') when others;

end architecture;

