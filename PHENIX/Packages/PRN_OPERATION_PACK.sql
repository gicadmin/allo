CREATE OR REPLACE PACKAGE phenix.PRN_OPERATION_PACK IS

FUNCTION GET_PROGRAM_PRINTER_FUNC(
  p_pro_name  IN  programs.pro_name%TYPE,
  p_whs_code  IN  warehouses.whs_code%TYPE
)
RETURN NUMBER;

END PRN_OPERATION_PACK;
/