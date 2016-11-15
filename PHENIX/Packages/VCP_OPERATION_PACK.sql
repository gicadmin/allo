CREATE OR REPLACE PACKAGE phenix.VCP_OPERATION_PACK IS

FUNCTION DELETE_VCT_CODE_FUNC(
  p_vct_code  IN vendor_credit_types.vct_code%TYPE
) RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_vcp_ven_code IN vendor_charge_posting_types.vcp_ven_code%TYPE
);

END VCP_OPERATION_PACK ;
/