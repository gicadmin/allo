CREATE OR REPLACE PACKAGE phenix.HDH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  hold_di_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_hdh_id                         IN         hold_di_headers.hdh_id%TYPE,
  p_hdh_rec                        OUT NOCOPY hold_di_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_hdh_id                         IN         hold_di_headers.hdh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_hdh_id                         IN         hold_di_headers.hdh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_hdh_id                         IN         hold_di_headers.hdh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_hdh_id                         IN         hold_di_headers.hdh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_hdh_id                         IN         hold_di_headers.hdh_id%TYPE);


FUNCTION INSERT_FUNC(
  p_hdh_ccr_code                 IN         hold_di_headers.hdh_ccr_code%TYPE                      DEFAULT NULL,
  p_hdh_purch_ven_code           IN         hold_di_headers.hdh_purch_ven_code%TYPE                DEFAULT NULL,
  p_hdh_purch_vendor_code        IN         hold_di_headers.hdh_purch_vendor_code%TYPE             DEFAULT NULL,
  p_hdh_to_pay_ven_code          IN         hold_di_headers.hdh_to_pay_ven_code%TYPE               DEFAULT NULL,
  p_hdh_to_pay_vendor_code       IN         hold_di_headers.hdh_to_pay_vendor_code%TYPE            DEFAULT NULL,
  p_hdh_input_date               IN         hold_di_headers.hdh_input_date%TYPE                    DEFAULT NULL,
  p_hdh_date                     IN         hold_di_headers.hdh_date%TYPE                          DEFAULT NULL,
  p_hdh_reference_number         IN         hold_di_headers.hdh_reference_number%TYPE              DEFAULT NULL,
  p_hdh_message                  IN         hold_di_headers.hdh_message%TYPE                       DEFAULT NULL,
  p_hdh_federal_tax_total        IN         hold_di_headers.hdh_federal_tax_total%TYPE             DEFAULT NULL,
  p_hdh_provincial_tax_total     IN         hold_di_headers.hdh_provincial_tax_total%TYPE          DEFAULT NULL,
  p_hdh_transport_cost           IN         hold_di_headers.hdh_transport_cost%TYPE                DEFAULT NULL,
  p_hdh_purchase_total           IN         hold_di_headers.hdh_purchase_total%TYPE                DEFAULT NULL,
  p_hdh_po_number                IN         hold_di_headers.hdh_po_number%TYPE                     DEFAULT NULL,
  p_hdh_whs_member_id            IN         hold_di_headers.hdh_whs_member_id%TYPE                 DEFAULT NULL,
  p_hdh_whs_code                 IN         hold_di_headers.hdh_whs_code%TYPE                      DEFAULT NULL,
  p_hdh_original_rebill_number   IN         hold_di_headers.hdh_original_rebill_number%TYPE        DEFAULT NULL,
  p_hdh_indirect_delivery_switch IN         hold_di_headers.hdh_indirect_delivery_switch%TYPE      DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY hold_di_headers%ROWTYPE)
RETURN NUMBER;

END HDH_PACK;
/