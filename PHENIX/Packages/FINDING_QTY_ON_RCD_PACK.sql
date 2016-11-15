CREATE OR REPLACE PACKAGE phenix.FINDING_QTY_ON_RCD_PACK IS

--appellé lorsquon transfere les factures DI.. pour trouver quels ASN on associe
FUNCTION TROUVER_MATCH_TRANSF_DI_FUNC(
	p_poh_id 								IN number,
	p_pod_line_number 			IN number,
	p_quantity_to_match 		IN number,
	p_mah_ap_invoice_number IN number,
	p_weight 								IN number default 0
	) return boolean;

--appellé lorsquon transfere les factures DI.. pour trouver quels ASN on associe
PROCEDURE REMPLIR_ARRAY_TRANSF_DI_PROC(
	p_poh_id 					IN number,
	p_pod_line_number IN number,
	p_weight 					IN number default 0
	);

--appellé lorsquon transfere les factures DI.. pour trouver quels ASN on associe
FUNCTION RECURSION_TRANSF_DI_FUNC (
	p_array_rendu_a 				IN number,
	p_qty_to_match 					IN number,
	p_qty_rendu_a 					IN number,
	p_mah_ap_invoice_number IN number
	) return boolean;

--appellé lorsquon valide les factures DI.. lorsqu'on split une ligne de PO en deux (prebook et pas prebook)
--afin de rematché les bonnes quantités sur chaque lignes splittée
FUNCTION TROUVER_MATCH_VAL_DI_FUNC(
	p_poh_id 							IN number,
	p_pod_line_number 		IN number,
	p_quantity_to_match 	IN number,
	p_new_pod_line_number IN number,
	p_weight 							IN number default 0
	) return boolean;

--appellé lorsquon valide les factures DI.. lorsqu'on split une ligne de PO en deux (prebook et pas prebook)
--afin de rematché les bonnes quantités sur chaque lignes splittée
PROCEDURE REMPLIR_ARRAY_VAL_DI_PROC(
	p_poh_id 					IN number,
	p_pod_line_number IN number,
	p_weight 					IN number default 0
	);

--appellé lorsquon valide les factures DI.. lorsqu'on split une ligne de PO en deux (prebook et pas prebook)
--afin de rematché les bonnes quantités sur chaque lignes splittée
FUNCTION RECURSION_VAL_DI_FUNC (
	p_array_rendu_a 			IN number,
	p_qty_to_match 				IN number,
	p_qty_rendu_a 				IN number,
	p_new_pod_line_number IN number
	) return boolean;


END FINDING_QTY_ON_RCD_PACK;
 
/