CREATE OR REPLACE PACKAGE phenix.CPL_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_price_lists%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cpl_cus_code                   IN         customer_price_lists.cpl_cus_code%TYPE,
  p_cpl_cgr_code                   IN         customer_price_lists.cpl_cgr_code%TYPE,
  p_cpl_prf_prd_code               IN         customer_price_lists.cpl_prf_prd_code%TYPE,
  p_cpl_prf_fmt_code               IN         customer_price_lists.cpl_prf_fmt_code%TYPE,
  p_cpl_rec                        OUT NOCOPY customer_price_lists%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_cpl_cus_code                   IN         customer_price_lists.cpl_cus_code%TYPE,
  p_cpl_cgr_code                   IN         customer_price_lists.cpl_cgr_code%TYPE,
  p_cpl_prf_prd_code               IN         customer_price_lists.cpl_prf_prd_code%TYPE,
  p_cpl_prf_fmt_code               IN         customer_price_lists.cpl_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cpl_cus_code                   IN         customer_price_lists.cpl_cus_code%TYPE,
  p_cpl_cgr_code                   IN         customer_price_lists.cpl_cgr_code%TYPE,
  p_cpl_prf_prd_code               IN         customer_price_lists.cpl_prf_prd_code%TYPE,
  p_cpl_prf_fmt_code               IN         customer_price_lists.cpl_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cpl_cus_code                   IN         customer_price_lists.cpl_cus_code%TYPE,
  p_cpl_cgr_code                   IN         customer_price_lists.cpl_cgr_code%TYPE,
  p_cpl_prf_prd_code               IN         customer_price_lists.cpl_prf_prd_code%TYPE,
  p_cpl_prf_fmt_code               IN         customer_price_lists.cpl_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cpl_cus_code                   IN         customer_price_lists.cpl_cus_code%TYPE,
  p_cpl_cgr_code                   IN         customer_price_lists.cpl_cgr_code%TYPE,
  p_cpl_prf_prd_code               IN         customer_price_lists.cpl_prf_prd_code%TYPE,
  p_cpl_prf_fmt_code               IN         customer_price_lists.cpl_prf_fmt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cpl_cus_code                   IN         customer_price_lists.cpl_cus_code%TYPE,
  p_cpl_cgr_code                   IN         customer_price_lists.cpl_cgr_code%TYPE,
  p_cpl_prf_prd_code               IN         customer_price_lists.cpl_prf_prd_code%TYPE,
  p_cpl_prf_fmt_code               IN         customer_price_lists.cpl_prf_fmt_code%TYPE);


PROCEDURE INSERT_PROC(
  p_cpl_prf_prd_code       IN         customer_price_lists.cpl_prf_prd_code%TYPE,
  p_cpl_prf_fmt_code       IN         customer_price_lists.cpl_prf_fmt_code%TYPE,
  p_cpl_prd_selling_retail IN         customer_price_lists.cpl_prd_selling_retail%TYPE,
  p_cpl_modification_date  IN         customer_price_lists.cpl_modification_date%TYPE,
  p_cpl_cus_code           IN         customer_price_lists.cpl_cus_code%TYPE                DEFAULT NULL,
  p_cpl_cgr_code           IN         customer_price_lists.cpl_cgr_code%TYPE                DEFAULT NULL,
  p_cpl_profil_switch      IN         customer_price_lists.cpl_profil_switch%TYPE           DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_price_lists%ROWTYPE);

END CPL_PACK;
/