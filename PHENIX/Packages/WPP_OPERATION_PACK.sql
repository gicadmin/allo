CREATE OR REPLACE PACKAGE phenix.WPP_OPERATION_PACK AS

PROCEDURE SET_SEQUENCE_PROC(
  p_wpp_program_code IN warehouse_pallet_programs.wpp_program_code%TYPE,
  p_wpp_whs_code     IN warehouse_pallet_programs.wpp_whs_code%TYPE,
  p_wpp_sequence     IN warehouse_pallet_programs.wpp_sequence%TYPE
);

END WPP_OPERATION_PACK;
/