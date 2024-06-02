library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Logic_Unit is
-- This testbench has no ports
end tb_Logic_Unit;

architecture behavior of tb_Logic_Unit is
    -- Component Declaration
    component Logic_Unit
        Port ( X : in STD_LOGIC_VECTOR(31 downto 0);
               Y : in STD_LOGIC_VECTOR(31 downto 0);
               Op : in STD_LOGIC_VECTOR(2 downto 0);
               Result : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

    -- Inputs
    signal X : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal Y : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal Op : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

    -- Output
    signal Result : STD_LOGIC_VECTOR(31 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Logic_Unit Port Map (X => X, Y => Y, Op => Op, Result => Result);

    -- Stimulus process
    stim_proc: process
    begin        
        -- Test case 1: AND
        X <= (others => '1');
        Y <= (others => '0');
        Op <= "101"; -- AND
        wait for 10 ns;

        -- Test case 2: OR
        X <= (others => '1');
        Y <= (others => '0');
        Op <= "110"; -- OR
        wait for 10 ns;

        -- Test case 3: NOT
        X <= (others => '1');
        Op <= "111"; -- NOT
        wait for 10 ns;

        -- Test complete
        wait;
    end process;
end behavior;
