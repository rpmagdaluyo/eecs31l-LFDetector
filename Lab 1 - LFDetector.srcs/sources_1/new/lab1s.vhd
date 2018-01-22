----------------------------------------------------------------------
-- Digital Design 101 Lab Assignment 1
-- LFDetector Structural Model
----------------------------------------------------------------------
-- Student First Name : Your First Name
-- Student Last Name : Your Last Name
-- Student ID : Your Student ID
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY NAND2 IS
   PORT (x: IN std_logic;
         y: IN std_logic;
         F: OUT std_logic);
END NAND2;  

ARCHITECTURE struct OF NAND2 IS
BEGIN
   PROCESS(x, y)
   BEGIN
      F <= NOT (x AND y) AFTER 1.4 ns; 
   END PROCESS;
END struct;
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY LFDetector_struct IS
   PORT (Fuel3, Fuel2, Fuel1, Fuel0: IN std_logic;
         FuelWarningLight: OUT std_logic);
END LFDetector_struct;

ARCHITECTURE structure OF LFDetector_struct IS
    COMPONENT NAND2 IS
        PORT ( x: IN std_logic;
               y: IN std_logic;
               F: OUT std_logic);
    END COMPONENT;
    
SIGNAL f0, f1, f2, b1, b2, b3: std_logic; 
BEGIN
-- DO NOT modify any signals, ports, or entities above this line
-- add your code below this line
-- use the appropriate library component(s) specified in the lab handout
-- add the appropriate internal signals & wire your design below
        --Instantiates the first  signals (F0 through F2 are inverted).
        NAND2_1: NAND2 PORT MAP(Fuel0, Fuel0, f0);
        NAND2_2: NAND2 PORT MAP(Fuel1, Fuel1, f1);
        NAND2_3: NAND2 PORT MAP(Fuel2, Fuel2, f2);
        NAND2_4: NAND2 PORT MAP(f0, f1, b1);
        NAND2_5: NAND2 PORT MAP(b1, b1, b2);
        NAND2_6: NAND2 PORT MAP(b2, f2, b3);
        NAND2_7: NAND2 PORT MAP(b3, Fuel3, FuelWarningLight);         
END structure;