library ieee;
use ieee.std_logic_1164.all;


entity controller is
    port (
        op : in std_logic_vector (2 downto 0);
        logic_unit_sel : out std_logic_vector (1 downto 0);
        mux3_sel : out std_logic_vector (1 downto 0);
        add_sub_sel : out std_logic;
        mux2_sel : out std_logic
    );
end entity;

architecture controller_arch of controller is
begin

    with op select
        mux2_sel <= '0' when "000" | "001",
                    '1' when "010" | "011",
                    'X' when others;
    
    with op select
        add_sub_sel <= '0' when "000" | "010",
                    '1' when "001" | "011",
                    'X' when others;
                    
    with op select
        logic_unit_sel <= "01" when "101",
                        "10" when "110",
                        "11" when "111",
                        "XX" when others;

    with op select
        mux3_sel <= "01" when "100",
                    "10" when "110" | "111" | "101",
                    "00" when "000" | "001" | "010" | "011",
                    "XX" when others;

end architecture;
