CREATE OR REPLACE PACKAGE phenix.VSIC_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_sales_incent_customers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vsic_vsi_code                  IN         vendor_sales_incent_customers.vsic_vsi_code%TYPE,
  p_vsic_cgr_code                  IN         vendor_sales_incent_customers.vsic_cgr_code%TYPE,
  p_vsic_rec                       OUT NOCOPY vendor_sales_incent_customers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vsic_vsi_code                  IN         vendor_sales_incent_customers.vsic_vsi_code%TYPE,
  p_vsic_cgr_code                  IN         vendor_sales_incent_customers.vsic_cgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_vsic_vsi_code                  IN         vendor_sales_incent_customers.vsic_vsi_code%TYPE,
  p_vsic_cgr_code                  IN         vendor_sales_incent_customers.vsic_cgr_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vsic_vsi_code                  IN         vendor_sales_incent_customers.vsic_vsi_code%TYPE,
  p_vsic_cgr_code                  IN         vendor_sales_incent_customers.vsic_cgr_code%TYPE);

FUNCTION GET_FULL_FUNC(
  p_vsic_vsi_code                  IN         vendor_sales_incent_customers.vsic_vsi_code%TYPE,
  p_vsic_cus_code                  IN         vendor_sales_incent_customers.vsic_cus_code%TYPE,
  p_vsic_rec                       OUT NOCOPY vendor_sales_incent_customers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vsic_vsi_code                  IN         vendor_sales_incent_customers.vsic_vsi_code%TYPE,
  p_vsic_cus_code                  IN         vendor_sales_incent_customers.vsic_cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_vsic_vsi_code                  IN         vendor_sales_incent_customers.vsic_vsi_code%TYPE,
  p_vsic_cus_code                  IN         vendor_sales_incent_customers.vsic_cus_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vsic_vsi_code                  IN         vendor_sales_incent_customers.vsic_vsi_code%TYPE,
  p_vsic_cus_code                  IN         vendor_sales_incent_customers.vsic_cus_code%TYPE);


PROCEDURE INSERT_PROC(
  p_vsic_vsi_code        IN         vendor_sales_incent_customers.vsic_vsi_code%TYPE,
  p_vsic_cus_code        IN         vendor_sales_incent_customers.vsic_cus_code%TYPE             DEFAULT NULL,
  p_vsic_cgr_code        IN         vendor_sales_incent_customers.vsic_cgr_code%TYPE             DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_sales_incent_customers%ROWTYPE);

END VSIC_PACK;
/