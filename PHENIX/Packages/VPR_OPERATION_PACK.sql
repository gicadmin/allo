CREATE OR REPLACE PACKAGE phenix.VPR_OPERATION_PACK IS

FUNCTION COUNT_VPR_NOT_FINISHED_FUNC( --BER286
	p_ven_code 	IN NUMBER,
	p_prd_code 	IN VARCHAR2
)
RETURN NUMBER;

PROCEDURE GET_CUMULATIVE_PROMO_PROC(
  p_ven_code          IN NUMBER,
  p_prd_code          IN VARCHAR2,
  p_fmt_code          IN VARCHAR2,
  p_start_date        IN DATE,
  p_end_date          IN DATE,
  p_allocation_amount OUT NUMBER,
  p_reclaim_ven_code  OUT NUMBER,
  p_reclaim_reference OUT VARCHAR2,
  p_reclaim_message   OUT VARCHAR2
);

PROCEDURE PURGE_PROC(
  p_vpr_prf_prd_code IN vendor_promotions.vpr_prf_prd_code%TYPE,
  p_vpr_prf_fmt_code IN vendor_promotions.vpr_prf_fmt_code%TYPE
);

FUNCTION LOCK_PROMOTION_FUNC(
  p_vpr_ven_code     IN vendor_promotions.vpr_ven_code%TYPE,
  p_vpr_prf_prd_code IN vendor_promotions.vpr_prf_prd_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE PURGE_PROC(
  p_vpr_prf_prd_code IN vendor_promotions.vpr_prf_prd_code%TYPE,
  p_vpr_ven_code     IN vendor_promotions.vpr_ven_code%TYPE
);

END VPR_OPERATION_PACK;
/