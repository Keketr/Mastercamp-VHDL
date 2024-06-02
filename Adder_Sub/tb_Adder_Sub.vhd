library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Adder_Sub is
-- This testbench has no ports
end tb_Adder_Sub;

architecture behavior of tb_Adder_Sub is
    -- Component Declaration for the Adder/Subtractor
    component Adder_Sub
        Port ( X : in STD_LOGIC_VECTOR(31 downto 0);
               Y : in STD_LOGIC_VECTOR(31 downto 0);
               Op : in STD_LOGIC_VECTOR(2 downto 0);
               Clk : in STD_LOGIC;
               Result : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

    -- Inputs
    signal X : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal Y : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal Op : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal Clk : STD_LOGIC := '0';

    -- Output
    signal Result : STD_LOGIC_VECTOR(31 downto 0);

    -- Clock process definitions
    constant Clk_period : time := 10 ns;
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Adder_Sub Port Map (X => X, Y => Y, Op => Op, Clk => Clk, Result => Result);

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
        -- Test case 1: Addition
        X <= "00000000000000000000000000000010";
        Y <= "00000000000000000000000000000011";
        Op <= "000"; -- Addition
        wait for Clk_period*10;

        -- Test case 2: Subtraction
        X <= "00000000000000000000000000000100";
        Y <= "00000000000000000000000000000001";
        Op <= "001"; -- Subtraction
        wait for Clk_period*10;

        -- Test complete
        wait;
    end process;
end behavior;
