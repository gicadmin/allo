CREATE OR REPLACE PACKAGE phenix.MAD_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_mad_mah_ap_invoice_number  IN match_details.mad_mah_ap_invoice_number%TYPE
);

--GCL8845 fonction pour trouver si le PO demandé (la ligne) est sur une autre facture qui n'est pas encore payé
FUNCTION COUNT_POD_ON_DIFF_MAH_OPN_FUNC(
  p_mad_mah_ap_invoice_number   IN match_details.mad_mah_ap_invoice_number%TYPE,
  p_mad_pod_poh_id              IN match_details.mad_pod_poh_id%TYPE,
  p_mad_pod_line_number         IN match_details.mad_pod_line_number%TYPE
)
RETURN NUMBER;

--GCL8845 procédure qui fait la somme des qté/poids facturé ou à recommandé pour une ligne de PO donné, pour toutes les factures déjà fermé ET la facture en paramètre (qui ne l'est pas forcément encore)
PROCEDURE FIND_TOTAL_INV_OR_REORDER_PROC(
  p_mad_mah_ap_invoice_number   IN match_details.mad_mah_ap_invoice_number%TYPE,
  p_mad_pod_poh_id              IN match_details.mad_pod_poh_id%TYPE,
  p_mad_pod_line_number         IN match_details.mad_pod_line_number%TYPE,
  p_total_invoiced_quantity     OUT NUMBER,
  p_total_reorder_quantity      OUT NUMBER,
  p_total_invoiced_weight       OUT NUMBER,
  p_total_reorder_weight        OUT NUMBER
);

--GCL8845 procédure pour calculer les différences à mettre sur la ligne en même temps qu'on ferme la facture
PROCEDURE CLOSE_WHILE_PAYING_MAH_PROC (
	p_mah_ap_invoice_number         IN NUMBER,
  p_mad_line_number 					    IN NUMBER,
	p_mad_match_cost 					      IN NUMBER,
	p_pod_poh_id 								    IN NUMBER,
	p_pod_line_number 					    IN NUMBER,
  p_pod_match_cost_with_freight   IN NUMBER,
	p_mad_invoiced_quantity		      IN NUMBER,
	p_mad_invoiced_weight			      IN NUMBER,
	p_mad_difference_price 		      OUT NUMBER,
	p_mad_difference_quantity       OUT NUMBER,
	p_mad_difference_weight 	      OUT NUMBER
);

--GCL8845 procédure pour transformer une facture MAH/MAD indirecte en pick list pour facturer le client
PROCEDURE MAD_INDIRECT_TO_PICK_LIST_PROC(
  p_mad_mah_ap_invoice_number IN match_details.mad_mah_ap_invoice_number%TYPE,
  p_use_code                  IN NUMBER
);

--GCL8845 fonction pour locker toutes les lignes de détails d'une facture donnée
FUNCTION LOCK_ALL_MAD_FUNC(
	p_mah_ap_invoice_number  IN match_headers.mah_ap_invoice_number%TYPE,
  p_with_pod_rcd_switch    IN NUMBER DEFAULT 0 --si on doit locké les enregistrement du POD et du RCD aussi (possiblement nécessaire a l'invoice_matching)
)
RETURN BOOLEAN;

---GCL8851

PROCEDURE GET_INFO_PROC(
 p_mah_ap_invoice_number         IN match_headers.mah_ap_invoice_number%TYPE,
 p_mad_line_number               IN match_details.mad_line_number%TYPE,
 p_mah_reference_number         OUT match_headers.mah_reference_number%TYPE,
 p_mad_pod_poh_id               OUT match_details.mad_pod_poh_id%TYPE,
 p_mad_pod_line_number          OUT match_details.mad_pod_line_number%TYPE,
 p_mad_invoiced_weight          OUT NUMBER,
 p_mad_invoiced_quantity        OUT NUMBER,
 p_price_invoiced               OUT NUMBER,
 p_pod_match_cost               OUT NUMBER,
 p_pod_match_cost_with_freight  OUT NUMBER
);
FUNCTION GET_MAX_LINE_NUMBER_FUNC(
  p_mad_mah_ap_invoice_number   IN match_details.mad_mah_ap_invoice_number%TYPE
 )
RETURN NUMBER ;

FUNCTION IS_INDIRECT_DELIVERY_FUNC(
  p_mad_mah_ap_invoice_number   IN match_details.mad_mah_ap_invoice_number%TYPE
 )
RETURN BOOLEAN;

PROCEDURE GET_SUM_INVOICED_PROC(
  p_mad_pod_poh_id        IN match_details.mad_pod_poh_id%TYPE,
  p_mad_pod_line_number   IN match_details.mad_pod_line_number%TYPE,
  p_mad_invoiced_weight   OUT NUMBER,
  p_mad_invoiced_quantity OUT NUMBER
);

PROCEDURE GET_SUM_INVOICED_PROC(
  p_mad_pod_poh_id            IN match_details.mad_pod_poh_id%TYPE,
  p_mad_pod_line_number       IN match_details.mad_pod_line_number%TYPE,
  p_mad_mah_ap_invoice_number IN match_details.mad_mah_ap_invoice_number%TYPE,
  p_mad_invoiced_weight       OUT NUMBER,
  p_mad_invoiced_quantity     OUT NUMBER
);

FUNCTION IS_STAY_WAITING_FUNC(
  p_mad_mah_ap_invoice_number IN match_details.mad_mah_ap_invoice_number%TYPE
)
RETURN BOOLEAN;

END MAD_OPERATION_PACK;
/