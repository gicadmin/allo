CREATE OR REPLACE PACKAGE phenix.VSIP_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_sales_incent_products%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vsip_id                        IN         vendor_sales_incent_products.vsip_id%TYPE,
  p_vsip_rec                       OUT NOCOPY vendor_sales_incent_products%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vsip_id                        IN         vendor_sales_incent_products.vsip_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vsip_id                        IN         vendor_sales_incent_products.vsip_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vsip_id                        IN         vendor_sales_incent_products.vsip_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vsip_id                        IN         vendor_sales_incent_products.vsip_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_vsip_vsi_code                  IN         vendor_sales_incent_products.vsip_vsi_code%TYPE,
  p_vsip_prf_prd_code              IN         vendor_sales_incent_products.vsip_prf_prd_code%TYPE,
  p_vsip_prf_fmt_code              IN         vendor_sales_incent_products.vsip_prf_fmt_code%TYPE,
  p_vsip_rec                       OUT NOCOPY vendor_sales_incent_products%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vsip_vsi_code                  IN         vendor_sales_incent_products.vsip_vsi_code%TYPE,
  p_vsip_prf_prd_code              IN         vendor_sales_incent_products.vsip_prf_prd_code%TYPE,
  p_vsip_prf_fmt_code              IN         vendor_sales_incent_products.vsip_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vsip_vsi_code                  IN         vendor_sales_incent_products.vsip_vsi_code%TYPE,
  p_vsip_prf_prd_code              IN         vendor_sales_incent_products.vsip_prf_prd_code%TYPE,
  p_vsip_prf_fmt_code              IN         vendor_sales_incent_products.vsip_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vsip_vsi_code                  IN         vendor_sales_incent_products.vsip_vsi_code%TYPE,
  p_vsip_prf_prd_code              IN         vendor_sales_incent_products.vsip_prf_prd_code%TYPE,
  p_vsip_prf_fmt_code              IN         vendor_sales_incent_products.vsip_prf_fmt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vsip_vsi_code                  IN         vendor_sales_incent_products.vsip_vsi_code%TYPE,
  p_vsip_prf_prd_code              IN         vendor_sales_incent_products.vsip_prf_prd_code%TYPE,
  p_vsip_prf_fmt_code              IN         vendor_sales_incent_products.vsip_prf_fmt_code%TYPE);


FUNCTION INSERT_FUNC(
  p_vsip_vsi_code                 IN         vendor_sales_incent_products.vsip_vsi_code%TYPE,
  p_vsip_prf_prd_code             IN         vendor_sales_incent_products.vsip_prf_prd_code%TYPE,
  p_vsip_prf_fmt_code             IN         vendor_sales_incent_products.vsip_prf_fmt_code%TYPE,
  p_vsip_prod_coefficient_percen  IN         vendor_sales_incent_products.vsip_prod_coefficient_percent%TYPE      DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_sales_incent_products%ROWTYPE)
RETURN NUMBER;

END VSIP_PACK;
/