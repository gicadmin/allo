CREATE OR REPLACE PACKAGE phenix.VBD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_billing_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vbd_id                         IN         vendor_billing_details.vbd_id%TYPE,
  p_vbd_rec                        OUT NOCOPY vendor_billing_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vbd_id                         IN         vendor_billing_details.vbd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vbd_id                         IN         vendor_billing_details.vbd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vbd_id                         IN         vendor_billing_details.vbd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vbd_id                         IN         vendor_billing_details.vbd_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vbd_id                         IN         vendor_billing_details.vbd_id%TYPE);


FUNCTION INSERT_FUNC(
  p_vbd_prf_prd_code              IN         vendor_billing_details.vbd_prf_prd_code%TYPE,
  p_vbd_prf_fmt_code              IN         vendor_billing_details.vbd_prf_fmt_code%TYPE,
  p_vbd_consignment_switch        IN         vendor_billing_details.vbd_consignment_switch%TYPE,
  p_vbd_federal_tax_rate          IN         vendor_billing_details.vbd_federal_tax_rate%TYPE,
  p_vbd_provincial_tax_rate       IN         vendor_billing_details.vbd_provincial_tax_rate%TYPE,
  p_vbd_tobacco_tax               IN         vendor_billing_details.vbd_tobacco_tax%TYPE,
  p_vbd_approval_status           IN         vendor_billing_details.vbd_approval_status%TYPE,
  p_vbd_whs_code                  IN         vendor_billing_details.vbd_whs_code%TYPE,
  p_vbd_dit_code                  IN         vendor_billing_details.vbd_dit_code%TYPE                       DEFAULT NULL,
  p_vbd_inh_id                    IN         vendor_billing_details.vbd_inh_id%TYPE                         DEFAULT NULL,
  p_vbd_mad_mah_ap_invoice_numbe  IN         vendor_billing_details.vbd_mad_mah_ap_invoice_number%TYPE      DEFAULT NULL,
  p_vbd_mad_line_number           IN         vendor_billing_details.vbd_mad_line_number%TYPE                DEFAULT NULL,
  p_vbd_vbd_id                    IN         vendor_billing_details.vbd_vbd_id%TYPE                         DEFAULT NULL,
  p_vbd_vbh_id                    IN         vendor_billing_details.vbd_vbh_id%TYPE                         DEFAULT NULL,
  p_vbd_vct_code                  IN         vendor_billing_details.vbd_vct_code%TYPE                       DEFAULT NULL,
  p_vbd_header_line_number        IN         vendor_billing_details.vbd_header_line_number%TYPE             DEFAULT NULL,
  p_vbd_invoice_line_number       IN         vendor_billing_details.vbd_invoice_line_number%TYPE            DEFAULT NULL,
  p_vbd_billed_cost               IN         vendor_billing_details.vbd_billed_cost%TYPE                    DEFAULT NULL,
  p_vbd_billed_quantity           IN         vendor_billing_details.vbd_billed_quantity%TYPE                DEFAULT NULL,
  p_vbd_billed_retail             IN         vendor_billing_details.vbd_billed_retail%TYPE                  DEFAULT NULL,
  p_vbd_billed_weight             IN         vendor_billing_details.vbd_billed_weight%TYPE                  DEFAULT NULL,
  p_vbd_original_retail           IN         vendor_billing_details.vbd_original_retail%TYPE                DEFAULT NULL,
  p_vbd_original_cost             IN         vendor_billing_details.vbd_original_cost%TYPE                  DEFAULT NULL,
  p_vbd_requested_quantity        IN         vendor_billing_details.vbd_requested_quantity%TYPE             DEFAULT NULL,
  p_vbd_requested_weight          IN         vendor_billing_details.vbd_requested_weight%TYPE               DEFAULT NULL,
  p_vbd_surcharge                 IN         vendor_billing_details.vbd_surcharge%TYPE                      DEFAULT NULL,
  p_vbd_vph_id                    IN         vendor_billing_details.vbd_vph_id%TYPE                         DEFAULT NULL,
  p_vbd_pick_line_number          IN         vendor_billing_details.vbd_pick_line_number%TYPE               DEFAULT NULL,
  p_vbd_ven_code                  IN         vendor_billing_details.vbd_ven_code%TYPE                       DEFAULT NULL,
  p_vbd_source_description        IN         vendor_billing_details.vbd_source_description%TYPE             DEFAULT NULL,
  p_vbd_reference_description     IN         vendor_billing_details.vbd_reference_description%TYPE          DEFAULT NULL,
  p_vbd_from_date                 IN         vendor_billing_details.vbd_from_date%TYPE                      DEFAULT NULL,
  p_vbd_to_date                   IN         vendor_billing_details.vbd_to_date%TYPE                        DEFAULT NULL,
  p_vbd_pty_code                  IN         vendor_billing_details.vbd_pty_code%TYPE                       DEFAULT NULL,
  p_vbd_message                   IN         vendor_billing_details.vbd_message%TYPE                        DEFAULT NULL,
  p_vbd_vsi_code                  IN         vendor_billing_details.vbd_vsi_code%TYPE                       DEFAULT NULL,
  p_vbd_damaged_switch            IN         vendor_billing_details.vbd_damaged_switch%TYPE                 DEFAULT 0 ,
  p_vbd_admin_amount              IN         vendor_billing_details.vbd_admin_amount%TYPE                   DEFAULT 0 ,
  p_vbd_invoiced_ext_price        IN         vendor_billing_details.vbd_invoiced_ext_price%TYPE             DEFAULT 0 ,
  p_vbd_invoiced_ext_admin        IN         vendor_billing_details.vbd_invoiced_ext_admin%TYPE             DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_billing_details%ROWTYPE)
RETURN NUMBER;
FUNCTION GET_VBD_ID_FUNC RETURN NUMBER;

PROCEDURE INSERT_VBD_PROC(
  p_vbd_id                        IN NUMBER,
  p_vbd_prf_prd_code              IN VARCHAR2,
  p_vbd_prf_fmt_code              IN VARCHAR2,
  p_vbd_federal_tax_rate          IN NUMBER,
  p_vbd_provincial_tax_rate       IN NUMBER,
  p_vbd_approval_status           IN VARCHAR2,
  p_vbd_whs_code                  IN VARCHAR2,
  p_vbd_invoiced_ext_price        IN NUMBER,
  p_vbd_invoiced_ext_admin        IN NUMBER,
  p_vbd_consignment_switch        IN NUMBER   DEFAULT 0,
  p_vbd_dit_code                  IN NUMBER   DEFAULT NULL,
  p_vbd_inh_id                    IN NUMBER   DEFAULT NULL,
  p_vbd_mad_mah_ap_inv_number     IN NUMBER   DEFAULT NULL,
  p_vbd_mad_line_number           IN NUMBER   DEFAULT NULL,
  p_vbd_vbd_id                    IN NUMBER   DEFAULT NULL,
  p_vbd_vbh_id                    IN NUMBER   DEFAULT NULL,
  p_vbd_vct_code                  IN VARCHAR2 DEFAULT NULL,
  p_vbd_header_line_number        IN NUMBER   DEFAULT NULL,
  p_vbd_invoice_line_number       IN NUMBER   DEFAULT NULL,
  p_vbd_billed_cost               IN NUMBER   DEFAULT NULL,
  p_vbd_billed_quantity           IN NUMBER   DEFAULT NULL,
  p_vbd_billed_retail             IN NUMBER   DEFAULT NULL,
  p_vbd_billed_weight             IN NUMBER   DEFAULT NULL,
  p_vbd_original_retail           IN NUMBER   DEFAULT NULL,
  p_vbd_original_cost             IN NUMBER   DEFAULT NULL,
  p_vbd_requested_quantity        IN NUMBER   DEFAULT NULL,
  p_vbd_requested_weight          IN NUMBER   DEFAULT NULL,
  p_vbd_surcharge                 IN NUMBER   DEFAULT NULL,
  p_vbd_tobacco_tax               IN NUMBER   DEFAULT 0,
  p_vbd_vph_id                    IN NUMBER   DEFAULT NULL,
  p_vbd_pick_line_number          IN NUMBER   DEFAULT NULL,
  p_vbd_ven_code                  IN NUMBER   DEFAULT NULL,
  p_vbd_source_description        IN VARCHAR2 DEFAULT NULL,
  p_vbd_reference_description     IN VARCHAR2 DEFAULT NULL,
  p_vbd_damaged_switch            IN NUMBER   DEFAULT 0,
  p_vbd_from_date                 IN DATE     DEFAULT NULL,
  p_vbd_to_date                   IN DATE     DEFAULT NULL,
  p_vbd_pty_code                  IN NUMBER   DEFAULT NULL,
  p_vbd_message                   IN VARCHAR2 DEFAULT NULL,
  p_vbd_admin_amount              IN NUMBER   DEFAULT 0,
  p_vbd_vsi_code                  IN NUMBER   DEFAULT NULL
);



END VBD_PACK;
/