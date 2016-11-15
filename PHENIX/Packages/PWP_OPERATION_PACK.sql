CREATE OR REPLACE PACKAGE phenix.PWP_OPERATION_PACK IS


FUNCTION GET_PRN_BY_PRO_NAME_FUNC(
  p_src_whs_code  IN program_warehouse_printers.pwp_whs_code%TYPE,
  p_pro_name      IN programs.pro_name%TYPE
) RETURN NUMBER;


END PWP_OPERATION_PACK;
/