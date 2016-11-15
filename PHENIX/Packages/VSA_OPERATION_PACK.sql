CREATE OR REPLACE PACKAGE phenix.VSA_OPERATION_PACK IS

FUNCTION EXISTS_VSA_BY_PRD_FUNC(
  p_vsa_ven_code     IN vendor_sales_agreements.vsa_ven_code%TYPE,
  p_ved_prf_prd_code IN vendor_agreement_details.ved_prf_prd_code%TYPE
)
RETURN BOOLEAN;

FUNCTION EXISTS_VSA_BY_PGR_FUNC(
  p_vsa_ven_code     IN vendor_sales_agreements.vsa_ven_code%TYPE,
  p_ved_prf_prd_code IN vendor_agreement_details.ved_prf_prd_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE PURGE_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

PROCEDURE PURGE_PROC(
  p_vsa_code IN vendor_sales_agreements.vsa_code%TYPE,
  p_raise    IN BOOLEAN
);

END VSA_OPERATION_PACK;
/