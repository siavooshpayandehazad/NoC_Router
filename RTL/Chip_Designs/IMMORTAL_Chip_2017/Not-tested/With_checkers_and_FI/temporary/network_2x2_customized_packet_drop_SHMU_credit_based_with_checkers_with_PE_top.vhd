--Copyright (C) 2016 Siavoosh Payandeh Azad
------------------------------------------------------------
-- This file is automatically generated!
-- Here are the parameters:
-- 	 network size x: 2
-- 	 network size y: 2
-- 	 Data width: 32
-- 	 Parity: False
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL; 

entity network_2x2_with_PE is
 generic (DATA_WIDTH: integer := 32; DATA_WIDTH_LV: integer := 11);
    ); 
port (reset: in  std_logic;
      clk: in  std_logic;

      -- IJTAG network for fault injection and checker status monitoring
      TCK         : in std_logic;
      RST         : in std_logic;
      SEL         : in std_logic;
      SI          : in std_logic;
      SE          : in std_logic;
      UE          : in std_logic;
      CE          : in std_logic;
      SO          : out std_logic;
      toF         : out std_logic;
      toC         : out std_logic; 
 
      -- GPIO for Node 0
      GPIO_out: out  std_logic_vector(15 downto 0);
      GPIO_in: in  std_logic_vector(21 downto 0)
    );

end network_2x2_with_PE; 


architecture behavior of network_2x2_with_PE is

-- Declaring network component
component network_2x2 is
 generic (DATA_WIDTH: integer := 32; DATA_WIDTH_LV: integer := 11);
port (reset: in  std_logic;
    clk: in  std_logic;
    --------------
    --------------
    RX_L_0: in std_logic_vector (DATA_WIDTH-1 downto 0);
    credit_out_L_0, valid_out_L_0: out std_logic;
    credit_in_L_0, valid_in_L_0: in std_logic;
    TX_L_0: out std_logic_vector (DATA_WIDTH-1 downto 0);
    --------------
    RX_L_1: in std_logic_vector (DATA_WIDTH-1 downto 0);
    credit_out_L_1, valid_out_L_1: out std_logic;
    credit_in_L_1, valid_in_L_1: in std_logic;
    TX_L_1: out std_logic_vector (DATA_WIDTH-1 downto 0);
    --------------
    RX_L_2: in std_logic_vector (DATA_WIDTH-1 downto 0);
    credit_out_L_2, valid_out_L_2: out std_logic;
    credit_in_L_2, valid_in_L_2: in std_logic;
    TX_L_2: out std_logic_vector (DATA_WIDTH-1 downto 0);
    --------------
    RX_L_3: in std_logic_vector (DATA_WIDTH-1 downto 0);
    credit_out_L_3, valid_out_L_3: out std_logic;
    credit_in_L_3, valid_in_L_3: in std_logic;
    TX_L_3: out std_logic_vector (DATA_WIDTH-1 downto 0);
    --------------
    link_faults_0: out std_logic_vector(4 downto 0);
    turn_faults_0: out std_logic_vector(19 downto 0);
    Rxy_reconf_PE_0: in  std_logic_vector(7 downto 0);
    Cx_reconf_PE_0: in  std_logic_vector(3 downto 0);
    Reconfig_command_0 : in std_logic;

    --------------
    link_faults_1: out std_logic_vector(4 downto 0);
    turn_faults_1: out std_logic_vector(19 downto 0);
    Rxy_reconf_PE_1: in  std_logic_vector(7 downto 0);
    Cx_reconf_PE_1: in  std_logic_vector(3 downto 0);
    Reconfig_command_1 : in std_logic;

    --------------
    link_faults_2: out std_logic_vector(4 downto 0);
    turn_faults_2: out std_logic_vector(19 downto 0);
    Rxy_reconf_PE_2: in  std_logic_vector(7 downto 0);
    Cx_reconf_PE_2: in  std_logic_vector(3 downto 0);
    Reconfig_command_2 : in std_logic;

    --------------
    link_faults_3: out std_logic_vector(4 downto 0);
    turn_faults_3: out std_logic_vector(19 downto 0);
    Rxy_reconf_PE_3: in  std_logic_vector(7 downto 0);
    Cx_reconf_PE_3: in  std_logic_vector(3 downto 0);
    Reconfig_command_3 : in std_logic;

    -- IJTAG network for fault injection and checker status monitoring
    TCK         : in std_logic;
    RST         : in std_logic;
    SEL         : in std_logic;
    SI          : in std_logic;
    SE          : in std_logic;
    UE          : in std_logic;
    CE          : in std_logic;
    SO          : out std_logic;
    toF         : out std_logic;
    toC         : out std_logic
    );
end component;

-- Declaring NoC_Node component (with Plasma, RAM, NI and UART)
component NoC_Node is
generic( current_address : integer := 0;
         stim_file: string :="code.txt";
         log_file  : string := "output.txt");

port( reset        : in std_logic;
      clk          : in std_logic;

        credit_in : in std_logic;
        valid_out: out std_logic;
        TX: out std_logic_vector(31 downto 0);

        credit_out : out std_logic;
        valid_in: in std_logic;
        RX: in std_logic_vector(31 downto 0);
        link_faults: in std_logic_vector(4 downto 0);
        turn_faults: in std_logic_vector(19 downto 0);

        Rxy_reconf_PE: out  std_logic_vector(7 downto 0);
        Cx_reconf_PE: out  std_logic_vector(3 downto 0);    -- if you are not going to update Cx you should write all ones! (it will be and will the current Cx bits)
        Reconfig_command : out std_logic;

        GPIO_out: out  std_logic_vector(15 downto 0);
        GPIO_in: in  std_logic_vector(21 downto 0)
   );
end component; --entity NoC_Node

-- generating bulk signals...
    signal RX_L_0, TX_L_0:  std_logic_vector (31 downto 0);
    signal credit_counter_out_0:  std_logic_vector (1 downto 0);
    signal credit_out_L_0, credit_in_L_0, valid_in_L_0, valid_out_L_0: std_logic;
    signal RX_L_1, TX_L_1:  std_logic_vector (31 downto 0);
    signal credit_counter_out_1:  std_logic_vector (1 downto 0);
    signal credit_out_L_1, credit_in_L_1, valid_in_L_1, valid_out_L_1: std_logic;
    signal RX_L_2, TX_L_2:  std_logic_vector (31 downto 0);
    signal credit_counter_out_2:  std_logic_vector (1 downto 0);
    signal credit_out_L_2, credit_in_L_2, valid_in_L_2, valid_out_L_2: std_logic;
    signal RX_L_3, TX_L_3:  std_logic_vector (31 downto 0);
    signal credit_counter_out_3:  std_logic_vector (1 downto 0);
    signal credit_out_L_3, credit_in_L_3, valid_in_L_3, valid_out_L_3: std_logic;

    -- NI testing signals
    --------------
    signal Rxy_reconf: std_logic_vector (7 downto 0) := "01111101";
    signal Reconfig: std_logic := '0';
    --------------
    constant clk_period : time := 1 ns;
    constant tck_period : time := 10 ns;
    constant HALF_SEPARATOR : time := 2*tck_period;
    constant FULL_SEPARATOR : time := 8*tck_period;

    signal reset, not_reset, clk: std_logic :='0';

    signal link_faults_0, link_faults_1, link_faults_2, link_faults_3   : std_logic_vector(4 downto 0);
    signal turn_faults_0, turn_faults_1, turn_faults_2, turn_faults_3   : std_logic_vector(19 downto 0);
    signal Rxy_reconf_PE_0, Rxy_reconf_PE_1,Rxy_reconf_PE_2, Rxy_reconf_PE_3   : std_logic_vector(7 downto 0);
    signal Cx_reconf_PE_0, Cx_reconf_PE_1, Cx_reconf_PE_2, Cx_reconf_PE_3 : std_logic_vector(3 downto 0);
    signal Reconfig_command_0, Reconfig_command_1, Reconfig_command_2, Reconfig_command_3 : std_logic;

    signal TCK, RST, SEL, SI, SE, UE, CE, SO, toF, toC : std_logic := '0';

    -- GPIO
    signal PE_0_GPIO_out : std_logic_vector(15 downto 0);
    signal PE_0_GPIO_in : std_logic_vector(21 downto 0) := (others => '1');

begin

-- instantiating the network
NoC: network_2x2 generic map (DATA_WIDTH  => 32, DATA_WIDTH_LV => 11)
port map (reset, clk,
    RX_L_0, credit_out_L_0, valid_out_L_0, credit_in_L_0, valid_in_L_0,  TX_L_0,
    RX_L_1, credit_out_L_1, valid_out_L_1, credit_in_L_1, valid_in_L_1,  TX_L_1,
    RX_L_2, credit_out_L_2, valid_out_L_2, credit_in_L_2, valid_in_L_2,  TX_L_2,
    RX_L_3, credit_out_L_3, valid_out_L_3, credit_in_L_3, valid_in_L_3,  TX_L_3,
    link_faults_0, turn_faults_0, Rxy_reconf_PE_0, Cx_reconf_PE_0, Reconfig_command_0,
    link_faults_1, turn_faults_1, Rxy_reconf_PE_1, Cx_reconf_PE_1, Reconfig_command_1,
    link_faults_2, turn_faults_2, Rxy_reconf_PE_2, Cx_reconf_PE_2, Reconfig_command_2,
    link_faults_3, turn_faults_3, Rxy_reconf_PE_3, Cx_reconf_PE_3, Reconfig_command_3,
    TCK, RST, SEL, SI, SE, UE, CE, SO, toF, toC
    );

-- instantiating and connecting the PEs
PE_0: NoC_Node
generic map( current_address => 0,
    stim_file => "code_0.txt",
    log_file  => "output_0.txt")

port map( not_reset, clk,

        credit_in => credit_out_L_0,
        valid_out => valid_in_L_0,
        TX => RX_L_0,

        credit_out => credit_in_L_0,
        valid_in => valid_out_L_0,
        RX => TX_L_0,
        link_faults         => link_faults_0,
        turn_faults         => turn_faults_0,
        Rxy_reconf_PE       => Rxy_reconf_PE_0,
        Cx_reconf_PE        => Cx_reconf_PE_0,
        Reconfig_command    => Reconfig_command_0,

        GPIO_out            => GPIO_out,
        GPIO_in             => GPIO_in
   );

PE_1: NoC_Node
generic map( current_address => 1,
    stim_file => "code_1.txt",
    log_file  => "output_1.txt")

port map( not_reset, clk,

        credit_in => credit_out_L_1,
        valid_out => valid_in_L_1,
        TX => RX_L_1,

        credit_out => credit_in_L_1,
        valid_in => valid_out_L_1,
        RX => TX_L_1,
        link_faults         => link_faults_1,
        turn_faults         => turn_faults_1,
        Rxy_reconf_PE       => Rxy_reconf_PE_1,
        Cx_reconf_PE        => Cx_reconf_PE_1,
        Reconfig_command    => Reconfig_command_1,

        GPIO_out            => open,
        GPIO_in             => (others => '0')
   );

PE_2: NoC_Node
generic map( current_address => 2,
    stim_file => "code_2.txt",
    log_file  => "output_2.txt")

port map( not_reset, clk,

        credit_in => credit_out_L_2,
        valid_out => valid_in_L_2,
        TX => RX_L_2,

        credit_out => credit_in_L_2,
        valid_in => valid_out_L_2,
        RX => TX_L_2,
        link_faults         => link_faults_2,
        turn_faults         => turn_faults_2,
        Rxy_reconf_PE       => Rxy_reconf_PE_2,
        Cx_reconf_PE        => Cx_reconf_PE_2,
        Reconfig_command    => Reconfig_command_2,

        GPIO_out            => open,
        GPIO_in             => (others => '0')
   );

PE_3: NoC_Node
generic map( current_address => 3,
    stim_file => "code_3.txt",
    log_file  => "output_3.txt")

port map( not_reset, clk,

        credit_in => credit_out_L_3,
        valid_out => valid_in_L_3,
        TX => RX_L_3,

        credit_out => credit_in_L_3,
        valid_in => valid_out_L_3,
        RX => TX_L_3,
        link_faults         => link_faults_3,
        turn_faults         => turn_faults_3,
        Rxy_reconf_PE       => Rxy_reconf_PE_3,
        Cx_reconf_PE        => Cx_reconf_PE_3,
        Reconfig_command    => Reconfig_command_3,

        GPIO_out            => open,
        GPIO_in             => (others => '0')
   );



end;