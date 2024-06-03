library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.all;

entity AdderSub is
    port ( X,Y : in std_logic_vector(3 downto 0);
           sel : in std_logic;
           cout : out std_logic;
           Res : out std_logic_vector(3 downto 0)
           );
end AdderSub;

architecture Structure of AdderSub is
component mux2to1
Port( m0, m1 : in std_logic_vector(3 downto 0);
      sel : in std_logic;
      mout : out std_logic_vector(3 downto 0)
      );
end component;
component Adder_4bits
Port ( X, Y : in std_logic_vector(3 downto 0);
      cin : in std_logic;
      cout : out std_logic;
      s : out std_logic_vector(3 downto 0)
      );
end component;

signal M : std_logic_vector(3 downto 0);
begin

U0 : mux2to1 port map (m0 => Y, m1 => not Y, sel => sel, mout => M);
U1 : Adder_4bits port map (X=>X, Y=>M, cin=>sel, S => Res, cout => cout);
end architecture Structure;