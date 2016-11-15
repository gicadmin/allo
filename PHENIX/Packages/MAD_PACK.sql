CREATE OR REPLACE PACKAGE phenix.MAD_PACK IS

FUNCTION FIND_MAX_MAD_LINE_FUNC(
	p_mad_mah_ap_invoice_number	IN match_details.mad_mah_ap_invoice_number%TYPE
)
RETURN NUMBER ;

PROCEDURE INSERT_MAD_PROC(
	p_mad_mah_ap_invoice_number	IN match_details.mad_mah_ap_invoice_number%TYPE,
	p_mad_line_number           IN match_details.mad_line_number%TYPE,
	p_mad_source                IN match_details.mad_source%TYPE,
	p_mad_pod_poh_id            IN match_details.mad_pod_poh_id%TYPE,
	p_mad_pod_line_number       IN match_details.mad_pod_line_number%TYPE,
	p_mad_list_price            IN match_details.mad_list_price%TYPE,
	p_mad_promotion_amount      IN match_details.mad_promotion_amount%TYPE,
	p_mad_reference_promotion   IN match_details.mad_reference_promotion%TYPE,
	p_mad_consignment_price     IN match_details.mad_consignment_price%TYPE,
	p_mad_federal_tax_rate      IN match_details.mad_federal_tax_rate%TYPE,
	p_mad_provincial_tax_rate   IN match_details.mad_provincial_tax_rate%TYPE,
	p_mad_invoiced_quantity     IN match_details.mad_invoiced_quantity%TYPE,
	p_mad_invoiced_weight       IN match_details.mad_invoiced_weight%TYPE,
	p_mad_date_closed           IN match_details.mad_date_closed%TYPE						DEFAULT NULL,
	p_mad_difference_price      IN match_details.mad_difference_price%TYPE			DEFAULT NULL,
	p_mad_difference_quantity   IN match_details.mad_difference_quantity%TYPE		DEFAULT NULL,
	p_mad_difference_weight     IN match_details.mad_difference_weight%TYPE			DEFAULT NULL,
	p_mad_reorder_quantity      IN match_details.mad_reorder_quantity%TYPE			DEFAULT NULL,
	p_mad_reorder_weight        IN match_details.mad_reorder_weight%TYPE				DEFAULT NULL
);

END MAD_PACK;
 
/