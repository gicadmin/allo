CREATE OR REPLACE PACKAGE phenix.POD_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_pod_poh_id  IN purchase_order_details.pod_poh_id%TYPE
);
FUNCTION FIND_NEXT_POD_LINE_FUNC(
	p_pod_poh_id IN purchase_order_details.pod_poh_id%TYPE
)
RETURN NUMBER;


FUNCTION LOCK_POD_FUNC(
	p_pod_poh_id 			IN purchase_order_details.pod_poh_id%TYPE,
	p_pod_line_number		IN purchase_order_details.pod_line_number%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_THERE_OPEN_POD_FOR_PRD_FUNC(
	p_prd_code IN VARCHAR2
)
RETURN NUMBER;

PROCEDURE FIND_POD_STATUS_PROC(
	p_pod_poh_id 			IN 	purchase_order_details.pod_poh_id%TYPE,
	p_pod_line_number 		IN  purchase_order_details.pod_line_number%TYPE,
	p_pod_status 			OUT purchase_order_details.pod_status%TYPE,
	p_pod_back_order_switch OUT purchase_order_details.pod_back_order_switch%TYPE
);

FUNCTION IS_THERE_NOT_CL_POD_FUNC(
	p_poh_id IN purchase_order_headers.poh_id%TYPE
)
RETURN NUMBER;

PROCEDURE CLOSE_LINE_PROC(
  p_pod_poh_id                         IN purchase_order_details.pod_poh_id%TYPE,
  p_pod_line_number                    IN purchase_order_details.pod_line_number%TYPE,
  p_pod_prf_prd_code                   IN purchase_order_details.pod_prf_prd_code%TYPE,
  p_pod_prf_fmt_code                   IN purchase_order_details.pod_prf_fmt_code%TYPE,
  p_pod_status                         IN purchase_order_details.pod_status%TYPE,
  p_pod_quantity_ordered               IN purchase_order_details.pod_quantity_ordered%TYPE,
  p_pod_weight_ordered                 IN purchase_order_details.pod_weight_ordered%TYPE
);

FUNCTION  COUNT_NEW_PRODUCT_ON_POD_FUNC
( p_poh_id 				IN purchase_order_headers.poh_id%TYPE,
  p_poh_whs_code 	IN purchase_order_headers.poh_whs_code%TYPE )
RETURN NUMBER ;


FUNCTION GENERATE_RAP_CREATION_LOC_FUNC
( p_poh_id 				IN purchase_order_headers.poh_id%TYPE,
	p_poh_whs_code 	IN purchase_order_headers.poh_whs_code%TYPE,
  p_use_code      IN users.use_code%TYPE
)
RETURN BOOLEAN ;

--GCL8845 fonction qui lock et update le PO au status passé en paramètre
FUNCTION LOCK_AND_UPDATE_STATUS_FUNC(
  p_pod_poh_id                         IN purchase_order_details.pod_poh_id%TYPE,
  p_pod_line_number                    IN purchase_order_details.pod_line_number%TYPE,
  p_pod_status                         IN purchase_order_details.pod_status%TYPE
)
RETURN BOOLEAN;

--procédure pour valider si une ligne de PO doit être fermé lors du paiement de la facture (MAH)
PROCEDURE CLOSE_WHILE_PAYING_MAH_PROC(
	p_mah_ap_invoice_number         IN NUMBER,
  p_mah_source 								    IN VARCHAR2,
	p_mad_line_number 					    IN NUMBER,
  p_poh_ven_purchase_code         IN NUMBER,
  p_pod_poh_id 								    IN NUMBER,
	p_pod_line_number 					    IN NUMBER,
	p_pod_prf_prd_code              IN VARCHAR2,
  p_pod_quantity_ordered 			    IN NUMBER,
	p_pod_weight_ordered 				    IN NUMBER,
  p_pod_prebook_quantity_left     IN NUMBER,
	p_pod_prebook_weight_left 	    IN NUMBER,
  p_pod_prebook_flag              IN VARCHAR2,
  p_pod_pod_poh_id                IN NUMBER,
  p_prd_definition                IN VARCHAR2,
	p_ctr_super_distributor_switch  IN NUMBER
);

FUNCTION EXISTS_PO_NOT_CLOSE_FUNC(
  p_pod_prf_prd_code      IN purchase_order_details.pod_prf_prd_code%TYPE,
  p_poh_ven_purchase_code IN purchase_order_headers.poh_ven_purchase_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE FIND_LAST_PO_COST_PROC(
  p_prf_prd_code      IN product_formats.prf_prd_code%TYPE,
  p_pod_list          OUT NUMBER,
  p_pod_cost_1        OUT NUMBER,
  p_pod_cost_2        OUT NUMBER,
  p_pod_cost_3        OUT NUMBER,
  p_pod_cost_4        OUT NUMBER,
  p_pod_match_cost    OUT NUMBER,
  p_rcd_date_closed   OUT receipt_details.rcd_date_closed%TYPE
);

PROCEDURE GET_VALUES_FOR_NEXT_PO_PROC(
  p_prd_code                      IN products.prd_code%TYPE,
  p_prd_definition                IN products.prd_definition%TYPE,
  p_prd_fmt_solid_inventory_code  IN products.prd_fmt_solid_inventory_code %TYPE,
  p_first_date                    OUT purchase_order_headers.poh_expected_recep_date%TYPE,
  p_first_quantity_weight         OUT NUMBER
);

END POD_OPERATION_PACK;
/