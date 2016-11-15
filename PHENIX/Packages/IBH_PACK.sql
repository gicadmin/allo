CREATE OR REPLACE PACKAGE phenix.IBH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  indirect_billing_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ibh_id                         IN         indirect_billing_headers.ibh_id%TYPE,
  p_ibh_rec                        OUT NOCOPY indirect_billing_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ibh_id                         IN         indirect_billing_headers.ibh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ibh_id                         IN         indirect_billing_headers.ibh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ibh_id                         IN         indirect_billing_headers.ibh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ibh_id                         IN         indirect_billing_headers.ibh_id%TYPE);


FUNCTION INSERT_FUNC(
  p_ibh_ccr_code                IN         indirect_billing_headers.ibh_ccr_code%TYPE                     DEFAULT NULL,
  p_ibh_ven_code                IN         indirect_billing_headers.ibh_ven_code%TYPE                     DEFAULT NULL,
  p_ibh_sender_qualificatif     IN         indirect_billing_headers.ibh_sender_qualificatif%TYPE          DEFAULT NULL,
  p_ibh_sender_code             IN         indirect_billing_headers.ibh_sender_code%TYPE                  DEFAULT NULL,
  p_ibh_receiver_qualificatif   IN         indirect_billing_headers.ibh_receiver_qualificatif%TYPE        DEFAULT NULL,
  p_ibh_receiver_code           IN         indirect_billing_headers.ibh_receiver_code%TYPE                DEFAULT NULL,
  p_ibh_invoice_type            IN         indirect_billing_headers.ibh_invoice_type%TYPE                 DEFAULT NULL,
  p_ibh_invoice_date            IN         indirect_billing_headers.ibh_invoice_date%TYPE                 DEFAULT NULL,
  p_ibh_invoice_number          IN         indirect_billing_headers.ibh_invoice_number%TYPE               DEFAULT NULL,
  p_ibh_order_date              IN         indirect_billing_headers.ibh_order_date%TYPE                   DEFAULT NULL,
  p_ibh_customer_order_number   IN         indirect_billing_headers.ibh_customer_order_number%TYPE        DEFAULT NULL,
  p_ibh_shipment_ref_number     IN         indirect_billing_headers.ibh_shipment_ref_number%TYPE          DEFAULT NULL,
  p_ibh_picklist_ref_number     IN         indirect_billing_headers.ibh_picklist_ref_number%TYPE          DEFAULT NULL,
  p_ibh_ship_date               IN         indirect_billing_headers.ibh_ship_date%TYPE                    DEFAULT NULL,
  p_ibh_rebill_invoice_number   IN         indirect_billing_headers.ibh_rebill_invoice_number%TYPE        DEFAULT NULL,
  p_ibh_rebill_invoice_date     IN         indirect_billing_headers.ibh_rebill_invoice_date%TYPE          DEFAULT NULL,
  p_ibh_federal_tax_number      IN         indirect_billing_headers.ibh_federal_tax_number%TYPE           DEFAULT NULL,
  p_ibh_provincial_tax_number   IN         indirect_billing_headers.ibh_provincial_tax_number%TYPE        DEFAULT NULL,
  p_ibh_tobacco_tax_number      IN         indirect_billing_headers.ibh_tobacco_tax_number%TYPE           DEFAULT NULL,
  p_ibh_saq_permit_number       IN         indirect_billing_headers.ibh_saq_permit_number%TYPE            DEFAULT NULL,
  p_ibh_terms_start_date        IN         indirect_billing_headers.ibh_terms_start_date%TYPE             DEFAULT NULL,
  p_ibh_terms_discount_percent  IN         indirect_billing_headers.ibh_terms_discount_percent%TYPE       DEFAULT NULL,
  p_ibh_terms_discount_days_due IN         indirect_billing_headers.ibh_terms_discount_days_due%TYPE      DEFAULT NULL,
  p_ibh_terms_net_due_date      IN         indirect_billing_headers.ibh_terms_net_due_date%TYPE           DEFAULT NULL,
  p_ibh_devise                  IN         indirect_billing_headers.ibh_devise%TYPE                       DEFAULT NULL,
  p_ibh_invoice_due_date        IN         indirect_billing_headers.ibh_invoice_due_date%TYPE             DEFAULT NULL,
  p_ibh_note_1                  IN         indirect_billing_headers.ibh_note_1%TYPE                       DEFAULT NULL,
  p_ibh_note_2                  IN         indirect_billing_headers.ibh_note_2%TYPE                       DEFAULT NULL,
  p_ibh_cus_code                IN         indirect_billing_headers.ibh_cus_code%TYPE                     DEFAULT NULL,
  p_ibh_cus_name                IN         indirect_billing_headers.ibh_cus_name%TYPE                     DEFAULT NULL,
  p_ibh_ven_code_flag           IN         indirect_billing_headers.ibh_ven_code_flag%TYPE                DEFAULT NULL,
  p_ibh_whs_member_id           IN         indirect_billing_headers.ibh_whs_member_id%TYPE                DEFAULT NULL,
  p_ibh_whs_code                IN         indirect_billing_headers.ibh_whs_code%TYPE                     DEFAULT NULL,
  p_ibh_is_transfered_switch    IN         indirect_billing_headers.ibh_is_transfered_switch%TYPE         DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY indirect_billing_headers%ROWTYPE)
RETURN NUMBER;

END IBH_PACK;
/