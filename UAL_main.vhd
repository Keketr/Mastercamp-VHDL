library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        X : in STD_LOGIC_VECTOR(31 downto 0);
        Y : in STD_LOGIC_VECTOR(31 downto 0);
        Op : in STD_LOGIC_VECTOR(2 downto 0);
        Clk : in STD_LOGIC;
        R : out STD_LOGIC_VECTOR(31 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
    -- Internal signals to connect components
    signal result_add_sub: STD_LOGIC_VECTOR(31 downto 0);
    signal result_mult: STD_LOGIC_VECTOR(31 downto 0);
    signal result_logic: STD_LOGIC_VECTOR(31 downto 0);
    signal result_final: STD_LOGIC_VECTOR(31 downto 0);

    -- Component Instances
    component Adder_Sub
        Port ( X : in STD_LOGIC_VECTOR(31 downto 0);
               Y : in STD_LOGIC_VECTOR(31 downto 0);
               Op : in STD_LOGIC_VECTOR(2 downto 0);
               Clk : in STD_LOGIC;
               Result : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

    component Multiplier
        Port ( X : in STD_LOGIC_VECTOR(31 downto 0);
               Y : in STD_LOGIC_VECTOR(31 downto 0);
               Clk : in STD_LOGIC;
               Result : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

    component Logic_Unit
        Port ( X : in STD_LOGIC_VECTOR(31 downto 0);
               Y : in STD_LOGIC_VECTOR(31 downto 0);
               Op : in STD_LOGIC_VECTOR(2 downto 0);
               Result : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

    component Mux3to1
        Port ( I0 : in STD_LOGIC_VECTOR(31 downto 0);
               I1 : in STD_LOGIC_VECTOR(31 downto 0);
               I2 : in STD_LOGIC_VECTOR(31 downto 0);
               Sel : in STD_LOGIC_VECTOR(1 downto 0);
               Out : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

begin
    -- Instantiations
    uAdder_Sub: Adder_Sub Port Map (X => X, Y => Y, Op => Op, Clk => Clk, Result => result_add_sub);
    uMultiplier: Multiplier Port Map (X => X, Y => Y, Clk => Clk, Result => result_mult);
    uLogic_Unit: Logic_Unit Port Map (X => X, Y => Y, Op => Op, Result => result_logic);
    uMux3to1: Mux3to1 Port Map (I0 => result_add_sub, I1 => result_mult, I2 => result_logic, Sel => Op(1 downto 0), Out => result_final);

    -- Output assignment
    R <= result_final;

end Behavioral;