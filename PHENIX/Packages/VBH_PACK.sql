CREATE OR REPLACE PACKAGE phenix.VBH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_billing_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vbh_id                         IN         vendor_billing_headers.vbh_id%TYPE,
  p_vbh_rec                        OUT NOCOPY vendor_billing_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vbh_id                         IN         vendor_billing_headers.vbh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vbh_id                         IN         vendor_billing_headers.vbh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vbh_id                         IN         vendor_billing_headers.vbh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vbh_id                         IN         vendor_billing_headers.vbh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vbh_id                         IN         vendor_billing_headers.vbh_id%TYPE);


FUNCTION INSERT_FUNC(
  p_vbh_use_code                IN         vendor_billing_headers.vbh_use_code%TYPE,
  p_vbh_order_date              IN         vendor_billing_headers.vbh_order_date%TYPE,
  p_vbh_status                  IN         vendor_billing_headers.vbh_status%TYPE,
  p_vbh_whs_code                IN         vendor_billing_headers.vbh_whs_code%TYPE,
  p_vbh_original_vbh_id         IN         vendor_billing_headers.vbh_original_vbh_id%TYPE,
  p_vbh_ven_purchase_code       IN         vendor_billing_headers.vbh_ven_purchase_code%TYPE,
  p_vbh_ven_payable_code        IN         vendor_billing_headers.vbh_ven_payable_code%TYPE,
  p_vbh_reference_number        IN         vendor_billing_headers.vbh_reference_number%TYPE             DEFAULT NULL,
  p_vbh_rma                     IN         vendor_billing_headers.vbh_rma%TYPE                          DEFAULT NULL,
  p_vbh_credit_note             IN         vendor_billing_headers.vbh_credit_note%TYPE                  DEFAULT NULL,
  p_vbh_message                 IN         vendor_billing_headers.vbh_message%TYPE                      DEFAULT NULL,
  p_vbh_invoice_matching_switch IN         vendor_billing_headers.vbh_invoice_matching_switch%TYPE      DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_billing_headers%ROWTYPE)
RETURN NUMBER;

END VBH_PACK;
/