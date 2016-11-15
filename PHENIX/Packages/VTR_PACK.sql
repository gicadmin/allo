CREATE OR REPLACE PACKAGE phenix.VTR_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_transport_agreements%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vtr_id                         IN         vendor_transport_agreements.vtr_id%TYPE,
  p_vtr_rec                        OUT NOCOPY vendor_transport_agreements%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vtr_id                         IN         vendor_transport_agreements.vtr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vtr_id                         IN         vendor_transport_agreements.vtr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vtr_id                         IN         vendor_transport_agreements.vtr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vtr_id                         IN         vendor_transport_agreements.vtr_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_vtr_whs_code                   IN         vendor_transport_agreements.vtr_whs_code%TYPE,
  p_vtr_ven_code                   IN         vendor_transport_agreements.vtr_ven_code%TYPE,
  p_vtr_vts_code                   IN         vendor_transport_agreements.vtr_vts_code%TYPE,
  p_vtr_start_date                 IN         vendor_transport_agreements.vtr_start_date%TYPE,
  p_vtr_end_date                   IN         vendor_transport_agreements.vtr_end_date%TYPE,
  p_vtr_frequency                  IN         vendor_transport_agreements.vtr_frequency%TYPE,
  p_vtr_cus_code                   IN         vendor_transport_agreements.vtr_cus_code%TYPE,
  p_vtr_invoicing_method           IN         vendor_transport_agreements.vtr_invoicing_method%TYPE,
  p_vtr_fixed_amount               IN         vendor_transport_agreements.vtr_fixed_amount%TYPE,
  p_vtr_fsg_code                   IN         vendor_transport_agreements.vtr_fsg_code%TYPE,
  p_vtr_message                    IN         vendor_transport_agreements.vtr_message%TYPE,
  p_vtr_minimum_charge             IN         vendor_transport_agreements.vtr_minimum_charge%TYPE,
  p_vtr_min_charge_method          IN         vendor_transport_agreements.vtr_min_charge_method%TYPE,
  p_vtr_min_charge_grouping        IN         vendor_transport_agreements.vtr_min_charge_grouping%TYPE,
  p_vtr_last_invoiced_date         IN         vendor_transport_agreements.vtr_last_invoiced_date%TYPE,
  p_vtr_created_date               IN         vendor_transport_agreements.vtr_created_date%TYPE                    DEFAULT NULL,
  p_vtr_expired_switch             IN         vendor_transport_agreements.vtr_expired_switch%TYPE                  DEFAULT NULL,
  p_vtr_validate_to_invoice_swit   IN         vendor_transport_agreements.vtr_validate_to_invoice_switch%TYPE      DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_transport_agreements%ROWTYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vtr_id                         IN         vendor_transport_agreements.vtr_id%TYPE);

END VTR_PACK;
/