CREATE OR REPLACE PACKAGE phenix.RCD_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_rcd_mah_ap_invoice_number  IN receipt_details.rcd_mah_ap_invoice_number%TYPE
);

FUNCTION FIND_MAX_LINE_FUNC(
	p_rcd_rch_number 	IN VARCHAR2,
	p_rcd_ven_code		IN NUMBER,
	p_rcd_rch_source	IN VARCHAR2,
	p_palette_number	IN VARCHAR2
)
RETURN NUMBER;

FUNCTION LOCK_SPECIFIC_RCD_FUNC(
  p_rcd_id IN receipt_details.rcd_id%TYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_ALL_RCD_FOR_RCH_FUNC(
  p_rcd_rch_number    IN receipt_details.rcd_rch_number%TYPE,
  p_rcd_rch_ven_code  IN receipt_details.rcd_rch_ven_code%TYPE,
  p_rcd_rch_source    IN receipt_details.rcd_rch_source%TYPE
)
RETURN BOOLEAN;

--USG989 création de la fonction
PROCEDURE DELETE_ALL_RCD_FOR_RCH_PROC(
  p_rcd_rch_number    IN receipt_details.rcd_rch_number%TYPE,
  p_rcd_rch_ven_code  IN receipt_details.rcd_rch_ven_code%TYPE,
  p_rcd_rch_source    IN receipt_details.rcd_rch_source%TYPE
);

FUNCTION IS_PO_ON_SYSTEM_ASN_ONLY_FUNC(
  p_poh_id IN NUMBER
)
RETURN BOOLEAN;

FUNCTION IS_THE_RECEIPT_STARTED_FUNC(
  p_poh_id IN NUMBER
)
RETURN BOOLEAN;

--BER6011 trouver la quantité recue pour des COD spécifiques, mais dont le COD n'est pas encore au statut RC etc...
FUNCTION FIND_RECEIVED_FOR_COD_FUNC(
	p_prd_code 					IN VARCHAR2,
	p_vpd_prf_fmt_code 	IN VARCHAR2,
	p_prd_definition 		IN VARCHAR2,
	p_whs_code					IN VARCHAR2
)
RETURN NUMBER;

PROCEDURE SET_RCH_RCD_FOR_POH_PROC(
 p_poh_id  IN purchase_order_headers.poh_id%TYPE
);

--GCL8845 création de la procédure pour trouver la somme recu pour une ligne de PO, sur une facture distincte
PROCEDURE FIND_SUM_RECEIVED_FOR_MAH_PROC(
  p_mah_ap_invoice_number     IN NUMBER,
  p_pod_poh_id                IN NUMBER,
  p_pod_line_number           IN NUMBER,
  p_sum_rcd_received_quantity OUT NUMBER,
  p_sum_rcd_received_weight   OUT NUMBER
);

FUNCTION GET_MAX_LINE_NUMBER_FUNC(
  p_rcd_rch_ven_code  IN receipt_details.rcd_rch_ven_code%TYPE,
  p_rcd_rch_number    IN receipt_details.rcd_rch_number%TYPE,
  p_rcd_rch_source    IN receipt_details.rcd_rch_source%TYPE
) RETURN NUMBER ;

PROCEDURE GET_SUM_RECEIVED_PROC(
  p_rcd_pod_poh_id        IN receipt_details.rcd_pod_poh_id%TYPE,
  p_rcd_pod_line_number   IN receipt_details.rcd_pod_line_number%TYPE,
  p_rcd_shipment_quantity OUT NUMBER,
  p_rcd_shipment_weight   OUT NUMBER,
  p_rcd_received_quantity OUT NUMBER,
  p_rcd_received_weight   OUT NUMBER
);

PROCEDURE GET_SUM_RECEIVED_PROC(
  p_rcd_pod_poh_id            IN receipt_details.rcd_pod_poh_id%TYPE,
  p_rcd_pod_line_number       IN receipt_details.rcd_pod_line_number%TYPE,
  p_rcd_mah_ap_invoice_number IN receipt_details.rcd_mah_ap_invoice_number%TYPE,
  p_rcd_shipment_quantity     OUT NUMBER,
  p_rcd_shipment_weight       OUT NUMBER,
  p_rcd_received_quantity     OUT NUMBER,
  p_rcd_received_weight       OUT NUMBER
);

FUNCTION IS_LAST_LINE_FUNC(
  p_rcd_pod_poh_id      IN receipt_details.rcd_pod_poh_id%TYPE,
  p_rcd_pod_line_number IN receipt_details.rcd_pod_line_number%TYPE
)
RETURN BOOLEAN;

FUNCTION COUNT_WITHOUT_MAH_FUNC
RETURN NUMBER;

PROCEDURE CONFIRM_RECEPTION_PROC(
  p_rcd_id                IN receipt_details.rcd_id%TYPE,
  p_rcd_received_quantity IN receipt_details.rcd_received_quantity%TYPE,
  p_rcd_shipment_quantity IN receipt_details.rcd_shipment_quantity%TYPE,
  p_pod_prf_prd_code      IN purchase_order_details.pod_prf_prd_code%TYPE,
  p_pod_prf_fmt_code      IN purchase_order_details.pod_prf_fmt_code%TYPE,
  p_prd_definition        IN products.prd_definition%TYPE
);

FUNCTION SET_RECEIVED_QUANTITY_FUNC(
  p_rcd_id                IN receipt_details.rcd_id%TYPE,
  p_rcd_received_quantity IN receipt_details.rcd_received_quantity%TYPE,
  p_rcd_received_weight   IN receipt_details.rcd_received_weight%TYPE,
  p_prd_definition        IN products.prd_definition%TYPE
)
RETURN NUMBER;

END RCD_OPERATION_PACK;
/