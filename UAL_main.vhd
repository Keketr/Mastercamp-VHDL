library ieee;
use ieee.std_logic_1164.all;


entity ual is
    port (
        op : in std_logic_vector (2 downto 0);
        clock : in std_logic;
        x, y : in std_logic_vector (3 downto 0);
        r : buffer std_logic_vector (7 downto 0)
    );
end entity;

architecture ual_arch of ual is

    constant n : integer := 4;
    
    component add_sub is
        generic (n : integer);
        port (
            x, y : in std_logic_vector (n-1 downto 0);
            selector : in std_logic;
            result : out std_logic_vector (n-1 downto 0)
        );
    end component;

    component logic_unit is
        generic (n : integer);
        port (
            in_1, in_2 : in std_logic_vector (n-1 downto 0);
            selector : in std_logic_vector (1 downto 0);
            out_1 : out std_logic_vector (n-1 downto 0)
        );
    end component;

    component multiplier is
        generic (n : integer);
        port (
            x, y : in std_logic_vector (n-1 downto 0);
            result : out std_logic_vector ((2*n)-1 downto 0)
        );
    end component;

    component mux2to1 is
        generic (n : integer);
        port (
            in_1 : in std_logic_vector (n-1 downto 0);
            in_2 : in std_logic_vector (n-1 downto 0);
            selector : in std_logic;
            out_1 : out std_logic_vector (n-1 downto 0)
        );
    end component;

    component mux3to1 is
        port (
            in_1, in_2 : in std_logic_vector (7 downto 0);
            in_3 : in std_logic_vector (3 downto 0);
            selector : in std_logic_vector (1 downto 0);
            out_1 : out std_logic_vector (7 downto 0)
        );
    end component;

    component reg8 is
        port (
            in_1 : in std_logic_vector (7 downto 0);
            clock : in std_logic;
            out_1 : out std_logic_vector (7 downto 0)
        );
    end component;

    component controller is
        port (
            op : in std_logic_vector (2 downto 0);
            logic_unit_sel : out std_logic_vector (1 downto 0);
            mux3_sel : out std_logic_vector (1 downto 0);
            add_sub_sel : out std_logic;
            mux2_sel : out std_logic
        );
    end component;

    component clk_man is
        port(
            clkin : in std_logic;
            clkout : out std_logic
        );
    end component;

    component sign_ext is
        port (
            e: in std_logic_vector (3 downto 0);
            s : out std_logic_vector (7 downto 0)
        );
    end component;
         
    
    signal logic_sel_sim : std_logic_vector (1 downto 0);
    signal mux3_sel_sim : std_logic_vector (1 downto 0);
    signal add_sub_sel_sim : std_logic;
    signal mux2_sel_sim : std_logic;

    signal r_sim : std_logic_vector (3 downto 0) := "0000";

    signal 
    mux2_output,
    logic_output,
    add_sub_output : std_logic_vector (3 downto 0);
    
    signal 
    mux3_output,
    multiplier_output:  std_logic_vector (7 downto 0);

    signal extended_add_sub : std_logic_vector (7 downto 0);

    signal clock_1hz : std_logic;
    
begin
    r_sim <= r(3 downto 0);

    mux2 : mux2to1
    generic map(n => n)
    port map (
        in_1 => x,
        in_2 => r_sim,
        selector => mux2_sel_sim,
        out_1 => mux2_output
    );

    mux3 : mux3to1
    port map (
        in_1 => extended_add_sub,
        in_2 => multiplier_output,
        in_3 => logic_output,
        selector => mux3_sel_sim,
        out_1 => mux3_output
    );

    addsub : add_sub
    generic map(n => n)
    port map (
        x => mux2_output,
        y => y,
        selector => add_sub_sel_sim,
        result => add_sub_output
    );

    mul : multiplier
    generic map(n => n)
    port map (
        x => x,
        y => y,
        result => multiplier_output
    );

    logic : logic_unit
    generic map(n => n)
    port map (
        in_1 => x,
        in_2 => y,
        selector => logic_sel_sim,
        out_1 => logic_output
    );

    reg : reg8
    port map (
        in_1 => mux3_output,
        clock => clock_1hz,
        out_1 => r
    );

    control : controller
    port map (
        op => op,
        logic_unit_sel => logic_sel_sim,
        mux3_sel => mux3_sel_sim,
        add_sub_sel => add_sub_sel_sim,
        mux2_sel => mux2_sel_sim
    );

    clk_man_inst: clk_man
     port map(
        clkin => clock,
        clkout => clock_1hz
    );

    sign_ext_inst: sign_ext
     port map(
        e => add_sub_output,
        s => extended_add_sub
    );

end architecture;
