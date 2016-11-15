CREATE OR REPLACE PACKAGE phenix.ZISA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  zero_inventory_sales_audits%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_zisa_id                        IN         zero_inventory_sales_audits.zisa_id%TYPE,
  p_zisa_rec                       OUT NOCOPY zero_inventory_sales_audits%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_zisa_id                        IN         zero_inventory_sales_audits.zisa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_zisa_id                        IN         zero_inventory_sales_audits.zisa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_zisa_id                        IN         zero_inventory_sales_audits.zisa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_zisa_id                        IN         zero_inventory_sales_audits.zisa_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_zisa_id                        IN         zero_inventory_sales_audits.zisa_id%TYPE);


FUNCTION INSERT_FUNC(
  p_zisa_whs_code        IN         zero_inventory_sales_audits.zisa_whs_code%TYPE,
  p_zisa_cus_code        IN         zero_inventory_sales_audits.zisa_cus_code%TYPE,
  p_zisa_prf_prd_code    IN         zero_inventory_sales_audits.zisa_prf_prd_code%TYPE,
  p_zisa_prf_fmt_code    IN         zero_inventory_sales_audits.zisa_prf_fmt_code%TYPE,
  p_zisa_date            IN         zero_inventory_sales_audits.zisa_date%TYPE,
  p_zisa_inventory       IN         zero_inventory_sales_audits.zisa_inventory%TYPE,
  p_zisa_sales           IN         zero_inventory_sales_audits.zisa_sales%TYPE,
  p_zisa_source          IN         zero_inventory_sales_audits.zisa_source%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY zero_inventory_sales_audits%ROWTYPE)
RETURN NUMBER;

END ZISA_PACK;
/