CREATE OR REPLACE PACKAGE phenix.VBD_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
   p_inh_id                    IN INVOICE_HEADERS.INH_ID%type
);

--GCL8829 purge selon le VBH_ID
PROCEDURE PURGE_PROC(
  p_vbh_id                    IN vendor_billing_headers.vbh_id%TYPE
);

--GCL8845 prodécure qui facture les différences de prix/quantité/consigne lors de la réconciliation des commandes d'achat
PROCEDURE CREATE_VBD_INVOICE_MATCH_PROC(
	p_vbh_id 									      IN NUMBER,
	p_vbd_header_line_number 	      IN OUT NUMBER,
	p_mah_ap_invoice_number 	      IN NUMBER,
	p_mad_line_number 				      IN NUMBER,
	p_mad_list_price 					      IN NUMBER,
	p_mad_match_cost                IN NUMBER,  --équivalent a mad_list - mad_promo
  p_mad_invoiced_quantity 	      IN NUMBER,
	p_mad_invoiced_weight 		      IN NUMBER,
	p_mad_consignment_price		      IN NUMBER,
  p_pod_poh_id 							      IN NUMBER,
	p_pod_line_number 				      IN NUMBER,
  p_pod_prf_prd_code 				      IN VARCHAR2,
	p_pod_prf_fmt_code 				      IN VARCHAR2,
  p_prd_definition					      IN VARCHAR2,
	p_prf_tobacco_tax 				      IN NUMBER,
  p_mad_difference_quantity       IN NUMBER,
	p_mad_difference_weight 	      IN NUMBER,
	p_mad_difference_price 		      IN NUMBER,
	p_whs_code								      IN VARCHAR2,
  p_ven_match_credit_note_switch  IN NUMBER
) ;

FUNCTION  EXIST_BY_VBH_STATUS_FUNC (
  p_vbh_id  IN vendor_billing_headers.vbh_id%TYPE,
  p_vbd_status   IN vendor_billing_details.vbd_approval_status%TYPE
) RETURN NUMBER;

FUNCTION LOCK_BY_VBH_ID_FUNC(
   p_vbh_id  IN vendor_billing_headers.vbh_id%TYPE
) RETURN BOOLEAN ;

END VBD_OPERATION_PACK;
/