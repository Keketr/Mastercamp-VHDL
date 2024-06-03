library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity add_sub is
    port (
        x, y : in std_logic_vector (3 downto 0);
        -- c_in :in std_logic;
        selector : in std_logic;
        c_out : out std_logic;
        result : out std_logic_vector (3 downto 0)
    );
end entity;

architecture add_sub_arch of add_sub is
    signal m : std_logic_vector (3 downto 0);

    component adder4b is
        port (
            x, y : in std_logic_vector (3 downto 0);
            c_in :in std_logic;
            c_out : out std_logic;
            result : out std_logic_vector (3 downto 0)
        );
    end component;

    component mux2to1 is
        generic (n : integer := 4);
        port (
            in_1 : in std_logic_vector (n-1 downto 0);
            in_2 : in std_logic_vector (n-1 downto 0);
            selector : in std_logic;
            out_1 : out std_logic_vector (n-1 downto 0)
        );
    end component;

    signal not_y : std_logic_vector (3 downto 0) := not y;
begin
    not_y <= not y;

    mux2to1_inst: mux2to1
    port map(
        in_1 => y,
        in_2 => not_y,
        selector => selector,
        out_1 => m
    );

    fa: adder4b
    port map(
        x => x,
        y => m,
        c_in => selector,
        c_out => c_out,
        result => result
    );

end architecture;

