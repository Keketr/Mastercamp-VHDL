library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Mux2to1 is
end tb_Mux2to1;

architecture behavior of tb_Mux2to1 is
    component Mux2to1
        Port ( I0 : in STD_LOGIC_VECTOR(31 downto 0);
               I1 : in STD_LOGIC_VECTOR(31 downto 0);
               Sel : in STD_LOGIC;
               Out : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

    signal I0, I1, Out : STD_LOGIC_VECTOR(31 downto 0);
    signal Sel : STD_LOGIC;

begin
    uut: Mux2to1 Port Map (I0 => I0, I1 => I1, Sel => Sel, Out => Out);

    -- Test stimulus
    process
    begin
        I0 <= (others => '0');
        I1 <= (others => '1');
        Sel <= '0';  -- Select I0
        wait for 10 ns;
        Sel <= '1';  -- Switch to I1
        wait for 10 ns;

        wait;
    end process;
end behavior;
