library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sign_ext is
    port (
        e: in std_logic_vector (3 downto 0);
        s : out std_logic_vector (7 downto 0)
    );
end entity;

architecture sign_ext_arch of sign_ext is
begin

    s(7 downto 4) <= (others => e(3));
    s(3 downto 0) <= e;

end architecture;
