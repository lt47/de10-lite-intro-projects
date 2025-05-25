LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY C4M1P4 IS PORT (
    SW : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    HEX0, HEX1, HEX5, HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    LEDR : OUT STD_LOGIC
);
END ENTITY C4M1P4;
ARCHITECTURE behavioral OF C4M1P4 IS
    SIGNAL b0 : STD_LOGIC;
    SIGNAL a0 : STD_LOGIC;
    SIGNAL cin : STD_LOGIC;
    SIGNAL c0 : STD_LOGIC;
    SIGNAL s0 : STD_LOGIC;
    SIGNAL b1 : STD_LOGIC;
    SIGNAL a1 : STD_LOGIC;
    SIGNAL c1 : STD_LOGIC;
    SIGNAL s1 : STD_LOGIC;
    SIGNAL b2 : STD_LOGIC;
    SIGNAL a2 : STD_LOGIC;
    SIGNAL c2 : STD_LOGIC;
    SIGNAL s2 : STD_LOGIC;
    SIGNAL b3 : STD_LOGIC;
    SIGNAL a3 : STD_LOGIC;
    SIGNAL c3 : STD_LOGIC;
    SIGNAL s3 : STD_LOGIC;
    SIGNAL cout : STD_LOGIC;

    SIGNAL bcd : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL d0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL d1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL z : STD_LOGIC;
    SIGNAL ten : STD_LOGIC_VECTOR(4 DOWNTO 0) := "01010";
    SIGNAL x : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL y : STD_LOGIC_VECTOR(3 DOWNTO 0);

    --SIGNAL carry : INTEGER;

BEGIN
    b0 <= SW(0);
    b1 <= SW(1);
    b2 <= SW(2);
    b3 <= SW(3);

    a0 <= SW(4);
    a1 <= SW(5);
    a2 <= SW(6);
    a3 <= SW(7);

    cin <= SW(8);

    s0 <= ((NOT b0) AND (NOT a0) AND (cin)) OR ((NOT b0) AND (a0) AND (NOT cin)) OR ((b0) AND (NOT a0) AND (cin)) OR ((b0) AND (a0) AND (cin));
    c0 <= ((NOT b0) AND (a0) AND (cin)) OR ((b0) AND (NOT a0) AND (cin)) OR ((b0) AND (a0) AND (NOT cin)) OR ((b0) AND (a0) AND (cin));

    s1 <= ((NOT b1) AND (NOT a1) AND (c0)) OR ((NOT b1) AND (a1) AND (NOT c0)) OR ((b1) AND (NOT a1) AND (NOT c0)) OR ((b1) AND (a1) AND (c0));
    c1 <= ((NOT b1) AND (a1) AND (c0)) OR ((b1) AND (NOT a1) AND (c0)) OR ((b1) AND (a1) AND (NOT c0)) OR ((b1) AND (a1) AND (c0));

    s2 <= ((NOT b2) AND (NOT a2) AND (c1)) OR ((NOT b2) AND (a2) AND (NOT c1)) OR ((b2) AND (NOT a2) AND (NOT c1)) OR ((b2) AND (a2) AND (c1));
    c2 <= ((NOT b2) AND (a2) AND (c1)) OR ((b2) AND (NOT a2) AND (c1)) OR ((b2) AND (a2) AND (NOT c1)) OR ((b2) AND (a2) AND (c1));

    s3 <= ((NOT b3) AND (NOT a3) AND (c2)) OR ((NOT b3) AND (a3) AND (NOT c2)) OR ((b3) AND (NOT a3) AND (NOT c2)) OR ((b3) AND (a3) AND (c2));
    cout <= ((NOT b3) AND (a3) AND (c2)) OR ((b3) AND (NOT a3) AND (c2)) OR ((b3) AND (a3) AND (NOT c2)) OR ((b3) AND (a3) AND (c2));

    x <= b3 & b2 & b1 & b0;
    y <= a3 & a2 & a1 & a0;

    bcd <= cout & s3 & s2 & s1 & s0;
    
    z <= '1' WHEN bcd > "01001" ELSE '0';

    d0 <= bcd WHEN z = '0' ELSE std_logic_vector(unsigned(bcd) - unsigned(ten));

    HEX0 <= "1000000" WHEN d0 = "00000" ELSE
        "1111001" WHEN d0 = "00001" ELSE
        "0100100" WHEN d0 = "00010" ELSE
        "0110000" WHEN d0 = "00011" ELSE
        "0011001" WHEN d0 = "00100" ELSE
        "0010010" WHEN d0 = "00101" ELSE
        "0000010" WHEN d0 = "00110" ELSE
        "1111000" WHEN d0 = "00111" ELSE
        "0000000" WHEN d0 = "01000" ELSE
        "0011000" WHEN d0 = "01001" ELSE "1000000";

    d1 <= "1111001" WHEN z = '1' ELSE "1000000";

    HEX1 <= d1;

    HEX5 <= "1000000" WHEN x = "0000" ELSE
        "1111001" WHEN x = "0001" ELSE
        "0100100" WHEN x = "0010" ELSE
        "0110000" WHEN x = "0011" ELSE
        "0011001" WHEN x = "0100" ELSE
        "0010010" WHEN x = "0101" ELSE
        "0000010" WHEN x = "0110" ELSE
        "1111000" WHEN x = "0111" ELSE
        "0000000" WHEN x = "1000" ELSE
        "0011000" WHEN x = "1001" ELSE "1000000";
    
    HEX3 <= "1000000" WHEN y = "0000" ELSE
        "1111001" WHEN y = "0001" ELSE
        "0100100" WHEN y = "0010" ELSE
        "0110000" WHEN y = "0011" ELSE
        "0011001" WHEN y = "0100" ELSE
        "0010010" WHEN y = "0101" ELSE
        "0000010" WHEN y = "0110" ELSE
        "1111000" WHEN y = "0111" ELSE
        "0000000" WHEN y = "1000" ELSE
        "0011000" WHEN y = "1001" ELSE "1000000";

    LEDR <= '1' WHEN (x > "1001") OR (y > "1001") ELSE '0';

END behavioral;