library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder4b is
    port (
        x, y : in std_logic_vector (3 downto 0);
        c_in :in std_logic;
        c_out : out std_logic;
        result : out std_logic_vector (3 downto 0)
    );
end entity;

architecture adder4b_arch of adder4b is
    signal c0, c1, c2 : std_logic;


    component full_adder is
        port (
            a, b, c_in : in std_logic;
            res, c_out : out std_logic
        );
    end component;


begin
    fa_1: full_adder
    port map(
        a => x(0),
        b => y(0),
        c_in => c_in,
        res => result(0),
        c_out => c0
    );

    fa_2: full_adder
    port map(
        a => x(1),
        b => y(1),
        c_in => c0,
        res => result(1),
        c_out => c1
    );

    fa_3: full_adder
    port map(
        a => x(2),
        b => y(2),
        c_in => c1,
        res => result(2),
        c_out => c2
    );

    fa_4: full_adder
    port map(
        a => x(3),
        b => y(3),
        c_in => c2,
        res => result(3),
        c_out => c_out
    );
end architecture;



