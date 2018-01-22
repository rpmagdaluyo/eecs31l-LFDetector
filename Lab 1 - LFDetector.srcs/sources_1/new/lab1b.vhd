----------------------------------------------------------------------
-- Digital Design 101 Lab Assignment 1
-- LFDetector Behavioral Model
----------------------------------------------------------------------
-- Student First Name : Richard
-- Student Last Name : Magdaluyo
-- Student ID : 45993793
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY LFDetector_behav IS
   PORT (Fuel3, Fuel2, Fuel1, Fuel0: IN std_logic;
         FuelWarningLight: OUT std_logic);
END LFDetector_behav;
    
-- DO NOT modify any signals, ports, or entities above this line
-- add your code below this line
-- put your code in a PROCESS
-- use AND/OR/NOT keywords for behavioral function
ARCHITECTURE Behavior OF LFDetector_behav IS
BEGIN
    PROCESS(Fuel0, Fuel1, Fuel2, Fuel3)
    BEGIN
        FuelWarningLight <= (not Fuel3) OR ((not Fuel2) and (not Fuel1) and (not Fuel0)) after 6.2ns;
    END process;
END Behavior;