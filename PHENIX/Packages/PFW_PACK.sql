CREATE OR REPLACE PACKAGE phenix.PFW_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  product_format_warehouses%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pfw_prf_prd_code               IN         product_format_warehouses.pfw_prf_prd_code%TYPE,
  p_pfw_prf_fmt_code               IN         product_format_warehouses.pfw_prf_fmt_code%TYPE,
  p_pfw_whs_code                   IN         product_format_warehouses.pfw_whs_code%TYPE,
  p_pfw_rec                        OUT NOCOPY product_format_warehouses%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pfw_prf_prd_code               IN         product_format_warehouses.pfw_prf_prd_code%TYPE,
  p_pfw_prf_fmt_code               IN         product_format_warehouses.pfw_prf_fmt_code%TYPE,
  p_pfw_whs_code                   IN         product_format_warehouses.pfw_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pfw_prf_prd_code               IN         product_format_warehouses.pfw_prf_prd_code%TYPE,
  p_pfw_prf_fmt_code               IN         product_format_warehouses.pfw_prf_fmt_code%TYPE,
  p_pfw_whs_code                   IN         product_format_warehouses.pfw_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pfw_prf_prd_code               IN         product_format_warehouses.pfw_prf_prd_code%TYPE,
  p_pfw_prf_fmt_code               IN         product_format_warehouses.pfw_prf_fmt_code%TYPE,
  p_pfw_whs_code                   IN         product_format_warehouses.pfw_whs_code%TYPE)
RETURN NUMBER;


PROCEDURE INSERT_PROC(
  p_pfw_prf_prd_code     IN         product_format_warehouses.pfw_prf_prd_code%TYPE,
  p_pfw_prf_fmt_code     IN         product_format_warehouses.pfw_prf_fmt_code%TYPE,
  p_pfw_whs_code         IN         product_format_warehouses.pfw_whs_code%TYPE,
  p_pfw_whz_code         IN         product_format_warehouses.pfw_whz_code%TYPE,
  p_pfw_pof_code         IN         product_format_warehouses.pfw_pof_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY product_format_warehouses%ROWTYPE);

END PFW_PACK;
/