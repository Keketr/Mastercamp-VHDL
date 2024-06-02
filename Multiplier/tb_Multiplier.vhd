library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Multiplier is
-- This testbench has no ports
end tb_Multiplier;

architecture behavior of tb_Multiplier is
    -- Component Declaration
    component Multiplier
        Port ( X : in STD_LOGIC_VECTOR(31 downto 0);
               Y : in STD_LOGIC_VECTOR(31 downto 0);
               Clk : in STD_LOGIC;
               Result : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

    -- Inputs
    signal X : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal Y : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal Clk : STD_LOGIC := '0';

    -- Output
    signal Result : STD_LOGIC_VECTOR(31 downto 0);

    -- Clock process definitions
    constant Clk_period : time := 10 ns;
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Multiplier Port Map (X => X, Y => Y, Clk => Clk, Result => Result);

    -- Clock process
    Clk_process :process
    begin
        Clk <= '0';
        wait for Clk_period/2;
        Clk <= '1';
        wait for Clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin        
        -- Test case 1: Multiplication
        X <= "00000000000000000000000000000010";
        Y <= "00000000000000000000000000000011";
        wait for Clk_period*10;

        -- Test complete
        wait;
    end process;
end behavior;
