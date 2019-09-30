-- (C) 2001-2018 Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files from any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License Subscription 
-- Agreement, Intel FPGA IP License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Intel and sold by 
-- Intel or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-- $Id: //acds/main/ip/sopc/components/verification/altera_tristate_conduit_bfm/altera_tristate_conduit_bfm.sv.terp#7 $
-- $Revision: #7 $
-- $Date: 2010/08/05 $
-- $Author: klong $
-------------------------------------------------------------------------------
-- =head1 NAME
-- altera_conduit_bfm
-- =head1 SYNOPSIS
-- Bus Functional Model (BFM) for a Standard Conduit BFM
-------------------------------------------------------------------------------
-- =head1 DESCRIPTION
-- This is a Bus Functional Model (BFM) VHDL package for a Standard Conduit Master.
-- This package provides the API that will be used to get the value of the sampled
-- input/bidirection port or set the value to be driven to the output ports.
-- This BFM's HDL is been generated through terp file in Qsys/SOPC Builder.
-- Generation parameters:
-- output_name:                  altera_conduit_bfm_0002
-- role:width:direction:         writeresponsevalid_n:4:input
-- clocked                       1
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;


package altera_conduit_bfm_0002_vhdl_pkg is


   -- input signal register
   signal reset_in                         : std_logic;
   signal sig_writeresponsevalid_n_in      : std_logic_vector(3 downto 0);

   -- VHDL Procedure API
   
   -- get writeresponsevalid_n value
   procedure get_writeresponsevalid_n             (signal_value : out std_logic_vector(3 downto 0));
   
   -- VHDL Event API
   procedure event_reset_asserted;

   procedure event_writeresponsevalid_n_change;   

end altera_conduit_bfm_0002_vhdl_pkg;

package body altera_conduit_bfm_0002_vhdl_pkg is
   
   procedure get_writeresponsevalid_n             (signal_value : out std_logic_vector(3 downto 0)) is
   begin

      signal_value := sig_writeresponsevalid_n_in;
   
   end procedure get_writeresponsevalid_n;
   
   procedure event_reset_asserted is
   begin
   
      wait until (reset_in'event and reset_in = '1');
      
   end event_reset_asserted;
   procedure event_writeresponsevalid_n_change is
   begin

      wait until (sig_writeresponsevalid_n_in'event);

   end event_writeresponsevalid_n_change;

end altera_conduit_bfm_0002_vhdl_pkg;

