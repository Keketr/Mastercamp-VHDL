library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Operateur is
  Port ( op : in std_logic_vector(3 downto 0);
         SAS : out std_logic;
         SM2, SLU : out std_logic_vector(1 downto 0);
         SM1 : out std_logic;
         output : out std_logic
end Operateur;

architecture Structure of Operateur is

begin
    process(op, SAS, SM2, SLU, SM1)
    begin
        if op ="000" then
            
            

end Structure;