LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY C4M1P3 IS PORT (
    SW : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    LEDR : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
);
END C4M1P3;

ARCHITECTURE BOOLEAN OF C4M1P3 IS
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

    s0 <= ((NOT b0) AND (NOT a0) AND (cin)) OR ((NOT b0) AND (a0) AND (NOT cin)) OR (b0);
    c0 <= ((NOT b0) AND (a0) AND (cin)) OR ((b0) AND (cin));

    s1 <= ((NOT b1) AND (NOT a1) AND (c0)) OR ((NOT b1) AND (a1) AND (NOT c0)) OR (b1);
    c1 <= ((NOT b1) AND (a1) AND (c0)) OR ((b1) AND (c0));

    s2 <= ((NOT b2) AND (NOT a2) AND (c1)) OR ((NOT b2) AND (a2) AND (NOT c1)) OR (b2);
    c2 <= ((NOT b2) AND (a2) AND (c1)) OR ((b2) AND (c1));

    s3 <= ((NOT b3) AND (NOT a3) AND (c2)) OR ((NOT b3) AND (a3) AND (NOT c2)) OR (b3);
    cout <= ((NOT b3) AND (a3) AND (c2)) OR ((b3) AND (c2));

    LEDR(4) <= cout;
    LEDR(3) <= s3;
    LEDR(2) <= s2;
    LEDR(1) <= s1;
    LEDR(0) <= s0;

END BOOLEAN;