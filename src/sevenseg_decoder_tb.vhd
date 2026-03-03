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
        
        signal sw : std_logic_vector(3 downto 0) := x"0";
        signal seg : std_logic_vector(6 downto 0) := x"00";
begin
    sevenseg_decoder_inst : sevenseg_decoder port map (
	    i_Hex(0) => sw(0),
        i_Hex(1) => sw(1),
        i_Hex(2) => sw(2),
        i_Hex(3) => sw(3),
        o_seg_n(6) => seg(6),
        o_seg_n(5) => seg(5),
        o_seg_n(4) => seg(4),
        o_seg_n(3) => seg(3),
        o_seg_n(2) => seg(2),
        o_seg_n(1) => seg(1),
        o_seg_n(0) => seg(0)
	   );
    test_process : process
    begin 
    sw <= x"0"; wait for 10 ns;
	       assert (seg(0) = '1' and seg(6) = '0') report "no worky" severity failure;
    sw <= x"A"; wait for 10 ns;
	       assert (seg(0) = '1' and seg(3) = '0') report "no worky" severity failure;
	sw <= x"E"; wait for 10 ns;
	       assert (seg(3) = '1' and seg(1) = '0') report "no worky" severity failure;  
    end process;
end Behavioral;
