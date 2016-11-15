CREATE OR REPLACE PACKAGE phenix.VCL_OPERATION_PACK IS

FUNCTION GET_CORRESPONDING_CUS_FUNC(
  p_vcl_ven_code                   IN  vendor_customer_lists.vcl_ven_code%TYPE,
  p_vcl_customer_code_for_vendor   IN  vendor_customer_lists.vcl_customer_code_for_vendor%TYPE
  )
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_vcl_ven_code IN vendor_customer_lists.vcl_ven_code%TYPE
);

END VCL_OPERATION_PACK;
/