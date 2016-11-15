CREATE OR REPLACE PACKAGE phenix.VSI_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_sales_incentives%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vsi_code                       IN         vendor_sales_incentives.vsi_code%TYPE,
  p_vsi_rec                        OUT NOCOPY vendor_sales_incentives%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vsi_code                       IN         vendor_sales_incentives.vsi_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vsi_code                       IN         vendor_sales_incentives.vsi_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vsi_code                       IN         vendor_sales_incentives.vsi_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_vsi_code                       IN         vendor_sales_incentives.vsi_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vsi_code                       IN         vendor_sales_incentives.vsi_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vsi_code                       IN         vendor_sales_incentives.vsi_code%TYPE);


PROCEDURE INSERT_PROC(
  p_vsi_code                     IN         vendor_sales_incentives.vsi_code%TYPE,
  p_vsi_creation_date            IN         vendor_sales_incentives.vsi_creation_date%TYPE,
  p_vsi_description              IN         vendor_sales_incentives.vsi_description%TYPE,
  p_vsi_start_date               IN         vendor_sales_incentives.vsi_start_date%TYPE                    DEFAULT NULL,
  p_vsi_end_date                 IN         vendor_sales_incentives.vsi_end_date%TYPE                      DEFAULT NULL,
  p_vsi_alt_description          IN         vendor_sales_incentives.vsi_alt_description%TYPE               DEFAULT NULL,
  p_vsi_billing_cycle            IN         vendor_sales_incentives.vsi_billing_cycle%TYPE                 DEFAULT NULL,
  p_vsi_date_last_billed         IN         vendor_sales_incentives.vsi_date_last_billed%TYPE              DEFAULT NULL,
  p_vsi_freegood_prf_prd_code    IN         vendor_sales_incentives.vsi_freegood_prf_prd_code%TYPE         DEFAULT NULL,
  p_vsi_freegood_prf_fmt_code    IN         vendor_sales_incentives.vsi_freegood_prf_fmt_code%TYPE         DEFAULT NULL,
  p_vsi_billing_method           IN         vendor_sales_incentives.vsi_billing_method%TYPE                DEFAULT 'C' ,
  p_vsi_refund_type_flag         IN         vendor_sales_incentives.vsi_refund_type_flag%TYPE              DEFAULT 'P' ,
  p_vsi_points_switch            IN         vendor_sales_incentives.vsi_points_switch%TYPE                 DEFAULT 0 ,
  p_vsi_freegood_replaced_switch IN         vendor_sales_incentives.vsi_freegood_replaced_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_sales_incentives%ROWTYPE);

END VSI_PACK;
/