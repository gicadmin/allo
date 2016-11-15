CREATE OR REPLACE PACKAGE phenix.COH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_order_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_coh_id                         IN         customer_order_headers.coh_id%TYPE,
  p_coh_rec                        OUT NOCOPY customer_order_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_coh_id                         IN         customer_order_headers.coh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_coh_id                         IN         customer_order_headers.coh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_coh_id                         IN         customer_order_headers.coh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_coh_id                         IN         customer_order_headers.coh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_coh_id                         IN         customer_order_headers.coh_id%TYPE);


FUNCTION INSERT_FUNC(
  p_coh_cus_code                 IN         customer_order_headers.coh_cus_code%TYPE,
  p_coh_use_code                 IN         customer_order_headers.coh_use_code%TYPE,
  p_coh_approved_switch          IN         customer_order_headers.coh_approved_switch%TYPE,
  p_coh_open_switch              IN         customer_order_headers.coh_open_switch%TYPE,
  p_coh_order_date               IN         customer_order_headers.coh_order_date%TYPE,
  p_coh_credit_approval_switch   IN         customer_order_headers.coh_credit_approval_switch%TYPE,
  p_coh_whs_delivery_code        IN         customer_order_headers.coh_whs_delivery_code%TYPE,
  p_coh_use_telemark_code        IN         customer_order_headers.coh_use_telemark_code%TYPE             DEFAULT NULL,
  p_coh_message                  IN         customer_order_headers.coh_message%TYPE                       DEFAULT NULL,
  p_coh_reference_number         IN         customer_order_headers.coh_reference_number%TYPE              DEFAULT NULL,
  p_coh_use_credit_code          IN         customer_order_headers.coh_use_credit_code%TYPE               DEFAULT NULL,
  p_coh_credit_hold_reason       IN         customer_order_headers.coh_credit_hold_reason%TYPE            DEFAULT NULL,
  p_coh_orig_ven_name            IN         customer_order_headers.coh_orig_ven_name%TYPE                 DEFAULT NULL,
  p_coh_pci_order_rgf_number     IN         customer_order_headers.coh_pci_order_rgf_number%TYPE          DEFAULT NULL,
  p_coh_surcharge_per_delivery   IN         customer_order_headers.coh_surcharge_per_delivery%TYPE        DEFAULT 0 ,
  p_coh_cross_dock_switch        IN         customer_order_headers.coh_cross_dock_switch%TYPE             DEFAULT 0 ,
  p_coh_hold_switch              IN         customer_order_headers.coh_hold_switch%TYPE                   DEFAULT 0 ,
  p_coh_delivery_type_flag       IN         customer_order_headers.coh_delivery_type_flag%TYPE            DEFAULT 'RG' ,
  p_coh_delivery_override_switch IN         customer_order_headers.coh_delivery_override_switch%TYPE      DEFAULT 0 ,
  p_coh_proposed_delivery_charge IN         customer_order_headers.coh_proposed_delivery_charge%TYPE      DEFAULT 0 ,
  p_coh_cash_and_carry_switch    IN         customer_order_headers.coh_cash_and_carry_switch%TYPE         DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_order_headers%ROWTYPE)
RETURN NUMBER;

END COH_PACK;
/