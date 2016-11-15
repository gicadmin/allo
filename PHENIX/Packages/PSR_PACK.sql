CREATE OR REPLACE PACKAGE phenix.PSR_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  product_srps%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_psr_prf_prd_code               IN         product_srps.psr_prf_prd_code%TYPE,
  p_psr_prf_fmt_code               IN         product_srps.psr_prf_fmt_code%TYPE,
  p_psr_srt_code                   IN         product_srps.psr_srt_code%TYPE,
  p_psr_rec                        OUT NOCOPY product_srps%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_psr_prf_prd_code               IN         product_srps.psr_prf_prd_code%TYPE,
  p_psr_prf_fmt_code               IN         product_srps.psr_prf_fmt_code%TYPE,
  p_psr_srt_code                   IN         product_srps.psr_srt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_psr_prf_prd_code               IN         product_srps.psr_prf_prd_code%TYPE,
  p_psr_prf_fmt_code               IN         product_srps.psr_prf_fmt_code%TYPE,
  p_psr_srt_code                   IN         product_srps.psr_srt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_psr_prf_prd_code               IN         product_srps.psr_prf_prd_code%TYPE,
  p_psr_prf_fmt_code               IN         product_srps.psr_prf_fmt_code%TYPE,
  p_psr_srt_code                   IN         product_srps.psr_srt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_psr_prf_prd_code               IN         product_srps.psr_prf_prd_code%TYPE,
  p_psr_prf_fmt_code               IN         product_srps.psr_prf_fmt_code%TYPE,
  p_psr_srt_code                   IN         product_srps.psr_srt_code%TYPE);


PROCEDURE INSERT_PROC(
  p_psr_prf_prd_code     IN         product_srps.psr_prf_prd_code%TYPE,
  p_psr_prf_fmt_code     IN         product_srps.psr_prf_fmt_code%TYPE,
  p_psr_srt_code         IN         product_srps.psr_srt_code%TYPE,
  p_psr_price            IN         product_srps.psr_price%TYPE,
  p_psr_profit_percent   IN         product_srps.psr_profit_percent%TYPE,
  p_psr_quantity         IN         product_srps.psr_quantity%TYPE,
  p_psr_fixed_srp_switch IN         product_srps.psr_fixed_srp_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY product_srps%ROWTYPE);

END PSR_PACK;
/