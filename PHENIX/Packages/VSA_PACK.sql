CREATE OR REPLACE PACKAGE phenix.VSA_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_sales_agreements%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vsa_code                       IN         vendor_sales_agreements.vsa_code%TYPE,
  p_vsa_rec                        OUT NOCOPY vendor_sales_agreements%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vsa_code                       IN         vendor_sales_agreements.vsa_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vsa_code                       IN         vendor_sales_agreements.vsa_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vsa_code                       IN         vendor_sales_agreements.vsa_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_vsa_code                       IN         vendor_sales_agreements.vsa_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vsa_code                       IN         vendor_sales_agreements.vsa_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vsa_code                       IN         vendor_sales_agreements.vsa_code%TYPE);


PROCEDURE INSERT_PROC(
  p_vsa_code                    IN         vendor_sales_agreements.vsa_code%TYPE,
  p_vsa_ven_code                IN         vendor_sales_agreements.vsa_ven_code%TYPE,
  p_vsa_ap_ar_flag              IN         vendor_sales_agreements.vsa_ap_ar_flag%TYPE,
  p_vsa_description             IN         vendor_sales_agreements.vsa_description%TYPE,
  p_vsa_process_credit_switch   IN         vendor_sales_agreements.vsa_process_credit_switch%TYPE,
  p_vsa_billing_cycle           IN         vendor_sales_agreements.vsa_billing_cycle%TYPE                DEFAULT NULL,
  p_vsa_alt_description         IN         vendor_sales_agreements.vsa_alt_description%TYPE              DEFAULT NULL,
  p_vsa_date_last_billed        IN         vendor_sales_agreements.vsa_date_last_billed%TYPE             DEFAULT NULL,
  p_vsa_synchronization_id      IN         vendor_sales_agreements.vsa_synchronization_id%TYPE           DEFAULT NULL,
  p_vsa_output_file_switch      IN         vendor_sales_agreements.vsa_output_file_switch%TYPE           DEFAULT 0 ,
  p_vsa_billing_method          IN         vendor_sales_agreements.vsa_billing_method%TYPE               DEFAULT 'C' ,
  p_vsa_freegood_reclaim_switch IN         vendor_sales_agreements.vsa_freegood_reclaim_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_sales_agreements%ROWTYPE);

END VSA_PACK;
/