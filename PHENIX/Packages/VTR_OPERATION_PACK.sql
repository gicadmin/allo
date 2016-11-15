CREATE OR REPLACE PACKAGE phenix.VTR_OPERATION_PACK IS

PROCEDURE CHECK_OTHER_ASSIGNATION_PROC(
  p_vtr_id       IN NUMBER,
  p_cus_code     IN NUMBER,
  p_ven_code     IN NUMBER,
  p_start_date   IN DATE,
  p_end_date     IN DATE,
  p_whs_code     IN NUMBER);


FUNCTION EXISTS_OTHER_ASSIGNATION_FUNC(
  p_vtr_id       IN NUMBER,
  p_cus_code     IN NUMBER,
  p_ven_code     IN NUMBER,
  p_start_date   IN DATE,
  p_end_date     IN DATE,
  p_whs_code     IN NUMBER)

  RETURN BOOLEAN;

PROCEDURE GET_EXPID_INFO_PROC(
  v_vtr_id                         IN vendor_transport_agreements.vtr_id%TYPE,
  p_vtr_id                         OUT vendor_transport_agreements.vtr_id%TYPE,
  p_vtr_start_date                 OUT vendor_transport_agreements.vtr_start_date%TYPE,
  p_vtr_end_date                   OUT vendor_transport_agreements.vtr_end_date%TYPE,
  p_vtr_message                    OUT vendor_transport_agreements.vtr_message%TYPE,
  p_vtr_invoicing_method           OUT vendor_transport_agreements.vtr_invoicing_method%TYPE,
  p_vtr_fixed_amount               OUT vendor_transport_agreements.vtr_fixed_amount%TYPE,
  p_vtr_whs_code                   OUT vendor_transport_agreements.vtr_whs_code%TYPE,
  p_vtr_vts_code                   OUT vendor_transport_agreements.vtr_vts_code%TYPE,
  p_vtr_validate_invoice_switch    OUT vendor_transport_agreements.vtr_validate_to_invoice_switch%TYPE)

  ;

PROCEDURE GET_INFO_VTR_PROC(
  p_vtr_id                IN vendor_transport_agreements.vtr_id%TYPE,
  p_vtr_start_date        OUT vendor_transport_agreements.vtr_start_date%TYPE,
  p_vtr_end_date          OUT vendor_transport_agreements.vtr_end_date%TYPE,
  p_vtr_invoicing_method  OUT vendor_transport_agreements.vtr_invoicing_method%TYPE
) ;



END VTR_OPERATION_PACK;
/