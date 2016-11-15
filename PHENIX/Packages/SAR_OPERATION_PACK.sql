CREATE OR REPLACE PACKAGE phenix.SAR_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
    p_cad_id                    IN customer_adjustment_details.cad_id%type
);

PROCEDURE PURGE_PROC(
    p_cod_coh_id                IN customer_order_details.cod_coh_id%type,
    p_cod_line_number           IN customer_order_details.cod_line_number%type
);

FUNCTION GET_COUNT_ID_BY_VED_FUNC(
  p_sar_ved_id sales_agreement_reclaims.sar_vbd_id%TYPE
)
RETURN NUMBER;

PROCEDURE UPDATE_VED_ID_PROC(
  p_sar_ved_id sales_agreement_reclaims.sar_vbd_id%TYPE
);

FUNCTION GET_COUNT_ID_BY_VSA_FUNC(
  p_ved_vsa_code  IN vendor_agreement_details.ved_vsa_code%TYPE
) RETURN NUMBER;

PROCEDURE UPDATE_ID_BY_VSA_PROC(
  p_sar_ved_id sales_agreement_reclaims.sar_vbd_id%TYPE
);

PROCEDURE PURGE_PROC(
  p_sar_ved_id IN sales_agreement_reclaims.sar_ved_id%TYPE
);

END SAR_OPERATION_PACK;
/