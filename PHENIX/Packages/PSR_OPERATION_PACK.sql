CREATE OR REPLACE PACKAGE phenix.PSR_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_psr_prf_prd_code IN product_srps.psr_prf_prd_code%TYPE,
  p_psr_prf_fmt_code IN product_srps.psr_prf_fmt_code%TYPE
);

FUNCTION GET_FULL_FUNC(
  p_psr_prf_prd_code IN product_srps.psr_prf_prd_code%TYPE,
  p_psr_srt_code     IN product_srps.psr_srt_code%TYPE,
  p_psr_rec          OUT NOCOPY product_srps%ROWTYPE
)
RETURN BOOLEAN;

END PSR_OPERATION_PACK;
/