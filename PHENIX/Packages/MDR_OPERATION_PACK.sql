CREATE OR REPLACE PACKAGE phenix.MDR_OPERATION_PACK IS

PROCEDURE CREATE_MAD_REBILLS_PROC(
 p_mad_pod_poh_id            IN  match_details.mad_pod_poh_id%TYPE,
 p_mad_pod_line_number       IN  match_details.mad_pod_line_number%TYPE,
 p_mad_mah_ap_invoice_number IN  match_details.mad_mah_ap_invoice_number%TYPE,
 p_mad_line_number           IN  match_details.mad_line_number%TYPE
);

END MDR_OPERATION_PACK;
/