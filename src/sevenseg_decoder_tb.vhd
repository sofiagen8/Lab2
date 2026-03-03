----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2026 10:18:01 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is
        component sevenseg_decoder is 
        port ( i_Hex : in std_logic_vector(3 downto 0);
            o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
        end component sevenseg_decoder;
        
        signal sw : std_logic_vector(3 downto 0);
        signal seg : std_logic_vector(6 downto 0);
begin
    sevenseg_decoder_inst : sevenseg_decoder port map (
	    i_Hex => sw,
        o_seg_n => seg
	   );
    test_process : process
    begin 
    sw <= x"0"; wait for 10 ns;
	       assert (seg(0) = '0' and seg(6) = '1') report "no worky" severity failure;
    sw <= x"A"; wait for 10 ns;
	       assert (seg(0) = '0' and seg(3) = '1') report "no worky" severity failure;
	sw <= x"E"; wait for 10 ns;
	       assert (seg(3) = '0' and seg(1) = '1') report "no worky" severity failure;  
    wait;
    end process;
end Behavioral;
