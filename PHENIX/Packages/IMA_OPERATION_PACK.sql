CREATE OR REPLACE PACKAGE phenix.IMA_OPERATION_PACK AS
PROCEDURE CREATE_PROC(
  p_ima_mad_mah_ap_invoice_numbe  IN match_details.mad_mah_ap_invoice_number%TYPE,
  p_ima_mad_line_number           IN match_details.mad_line_number%TYPE,
  p_ima_mad_pod_poh_id            IN match_details.mad_pod_poh_id%TYPE,
  p_ima_mad_pod_line_number       IN match_details.mad_pod_line_number%TYPE,
  p_ima_use_code                  IN users.use_code%TYPE DEFAULT 99999,
  p_ima_source                    IN VARCHAR2,
  p_ima_name_field                IN VARCHAR2,
  p_ima_before_modif              IN VARCHAR2,
  p_ima_after_modif               IN VARCHAR2,
  p_ima_pdi_dit_code              IN NUMBER   DEFAULT NULL
);
END IMA_OPERATION_PACK;
/