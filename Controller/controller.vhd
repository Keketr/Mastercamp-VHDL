library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Operateur is
  Port ( op : in std_logic_vector(2 downto 0);
         SAS : out std_logic;
         SM2, SLU : out std_logic_vector(1 downto 0);
         SM1 : out std_logic
         );
end Operateur;

architecture Structure of Operateur is

begin
    process(op, SAS, SM2, SLU, SM1)
    begin
        if op ="000" then
            SAS <= '0';
            SM1 <= '0';
            SM2 <= "00";
            SLU <= NULL;
        elsif op = "001" then
            SAS <= '1';
            SM1 <= '0';
            SM2 <= "00";
            SLU <= NULL;
        elsif op = "010" then
            SAS <= '0';
            SM1 <= '1';
            SM2 <= "00";
            SLU <= NULL;
        elsif op = "011" then
            SAS <= '1';
            SM1 <= '1';
            SM2 <= "00";
            SLU <= NULL;
        elsif op = "100" then
            SAS <= NULL;
            SM1 <= NULL;
            SM2 <= "01";
            SLU <= NULL;
        elsif op = "101" then
            SAS <= NULL;
            SM1 <= NULL;
            SM2 <= "10";
            SLU <= "01";
        elsif op = "110" then
            SAS <= NULL;
            SM1 <= NULL;
            SM2 <= "10";
            SLU <= "10";
        elsif op = "110" then
            SAS <= NULL;
            SM1 <= NULL;
            SM2 <= "10";
            SLU <= "11";
    end process;

end Structure;