library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myShiftRegEnable is
	 Generic(N:integer:=4);
    Port ( clk : in   STD_LOGIC;
           rst : in   STD_LOGIC;
			  ena : in   STD_LOGIC;
			  d   : in   STD_LOGIC;
           q   : out  STD_LOGIC
			);
end myShiftRegEnable;

architecture ARCH_myShiftRegEnable of myShiftRegEnable is

	signal qdSignal: STD_LOGIC_VECTOR(N downto 0);
	
begin

	qdSignal(0) <= d;
	q				<= qdSignal(N);
	
	SR: for i in 0 to N-1 generate
		FFD: entity WORK.myFFDRE(ARCH_myFFDRE)
		port MAP( clk => clk,
					 rst => rst,
					 ena => ena,
					 d   => qdSignal(i),
					 q   => qdSignal(i+1)
					);
	end generate;

end ARCH_myShiftRegEnable;

