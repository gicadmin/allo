CREATE OR REPLACE PACKAGE phenix.PFQ_OPERATION_PACK IS

FUNCTION IS_THERE_PFQ_FOR_PRD_FUNC(
  p_prd_code                IN products.prd_code%TYPE,
  p_exclude_purchase_format BOOLEAN DEFAULT FALSE
) RETURN BOOLEAN;

PROCEDURE PURGE_PROC(
  p_pfq_prf_prd_code IN product_format_qty_timeline.pfq_prf_prd_code%TYPE,
  p_pfq_prf_fmt_code IN product_format_qty_timeline.pfq_prf_fmt_code%TYPE
);

END PFQ_OPERATION_PACK;
/