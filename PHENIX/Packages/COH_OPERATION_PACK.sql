CREATE OR REPLACE PACKAGE phenix.COH_OPERATION_PACK IS

PROCEDURE CLOSE_COH_WHEN_INVOICING_PROC(
  p_inh_id IN invoice_headers.inh_id%TYPE
);

PROCEDURE COH_PURGE_PROC(
  p_jsc_id IN NUMBER
) ;

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep               IN NUMBER,
  p_max_items                     IN NUMBER
);

FUNCTION FIND_COH_WITH_SUSPECT_QTY_FUNC(
  p_cod_project_delivery_date IN     customer_order_details.cod_project_delivery_date%TYPE,
  p_cod_whs_picking_code      IN     customer_order_details.cod_whs_picking_code%TYPE,
  p_coh_whs_delivery_code     IN     customer_order_headers.coh_whs_delivery_code%TYPE,
  p_coh_cus_code              IN OUT customer_order_headers.coh_cus_code%TYPE,
  p_cod_line_number           OUT    customer_order_details.cod_line_number%TYPE,
  p_cod_prf_prd_code          OUT    customer_order_details.cod_prf_prd_code%TYPE,
  p_cod_prf_fmt_code          OUT    customer_order_details.cod_prf_fmt_code%TYPE
) RETURN NUMBER;

PROCEDURE VERIFY_SUSPECT_QTY_IN_COH_PROC(
  p_cod_project_delivery_date IN  customer_order_details.cod_project_delivery_date%TYPE,
  p_cod_whs_picking_code      IN  customer_order_details.cod_whs_picking_code%TYPE,
  p_coh_whs_delivery_code     IN  customer_order_headers.coh_whs_delivery_code%TYPE,
  p_coh_cus_code              IN  customer_order_headers.coh_cus_code%TYPE,
  p_language                  IN  VARCHAR2,
  p_log_name                  IN  VARCHAR2,
  p_parameters                IN  VARCHAR2,
  p_error_code                OUT NUMBER,
  p_error_message             OUT VARCHAR2
);
FUNCTION LOCK_COH_FUNC(
	p_coh_id  IN customer_order_headers.coh_id%TYPE
)
RETURN BOOLEAN;

PROCEDURE UPDATE_COH_OPEN_SWITCH_PROC(
	p_coh_id 				IN NUMBER,
	p_switch_value	IN NUMBER
);

FUNCTION FIND_COH_CUS_CODE_FUNC(
	p_coh_id IN NUMBER
)
RETURN NUMBER;

PROCEDURE GENERATE_POH_PROC (
  p_coh_id IN NUMBER
);

PROCEDURE CREATE_POH(
  p_to_ven_code      	            IN NUMBER,
  p_poh_message      	            IN VARCHAR2,
  p_poh_cus_po_number             IN VARCHAR2,
  p_poh_indirect_delivery_switch  IN NUMBER,
  p_poh_division_order_switch     IN NUMBER,
  p_project_date 			            IN DATE,
  p_whs_code                      IN VARCHAR2,
  p_poh_id		                    OUT NUMBER,
  p_poh_ven_to_pay		            OUT NUMBER,
  p_ven_prv_code                  OUT VARCHAR2
 ) ;

PROCEDURE CREATE_POD(
  p_poh_sequence       	IN NUMBER,
  p_pod_line           	IN NUMBER,
  p_poh_ven_purchase		IN NUMBER,
  p_poh_ven_to_pay			IN NUMBER,
  p_ven_prv_code		  	IN VARCHAR2,
  p_whs_code						IN VARCHAR2,
  p_coh_cus_code       	IN NUMBER,
  p_cod_prf_prd_code   	IN VARCHAR2,
  p_cod_prf_fmt_code   	IN VARCHAR2,
  p_prd_definition     	IN VARCHAR2,
  p_cod_project_date 		IN DATE,
  p_qty_a_livrer       	IN NUMBER,
  p_poids_a_livrer     	IN NUMBER,
	p_pod_message        	IN VARCHAR2
) ;

PROCEDURE CONFIRM_GENERATION_PROC(
  p_poh_id      purchase_order_headers.poh_id%TYPE,
  p_cus_code 		customer_order_headers.coh_cus_code%TYPE
);

PROCEDURE SET_RECONCILIATION_PROC(
  p_coh_id                IN customer_order_headers.coh_id%TYPE,
  p_use_code              IN users.use_code%TYPE,
  p_reconciliation_date   IN DATE
);

--fonction pour trouver si des produits pre-deleted ou liquidation ont été commandé par un client dans les derniers 6 mois
--pour améliorer la rapidité quand un client n'en a pas commandé, on n'a pas besoin de valider l'inventaire et les droits etc
FUNCTION PURCH_IN_LAST_SIX_MONTHS_FUNC(
  p_cus_code            IN NUMBER
)
RETURN BOOLEAN;

--procédure pour valider s'il y a des produit pre-detruit ou liquider que le client a acheter récement, quil reste de l'inventiare et tout
PROCEDURE FIND_LIQU_OR_DELETED_PROC(
  p_cus_code              IN  NUMBER,
  p_open_quotation_switch IN  NUMBER,
  p_whs_delivery_code     IN  VARCHAR2,
  p_regular_allowed       IN  VARCHAR2,
  p_alcohol_allowed       IN  VARCHAR2,
  p_tobacco_allowed       IN  VARCHAR2,
  p_delivery_date         IN  DATE,
  p_pre_deleted_switch    OUT NUMBER,
  p_liquidation_switch    OUT NUMBER
);

PROCEDURE UPDATE_CREDIT_APPROVAL_PROC(
  p_coh_id                          IN customer_order_headers.coh_id%TYPE,
  p_coh_credit_approval_switch      IN customer_order_headers.coh_credit_approval_switch%TYPE,
  p_coh_delivery_type_flag          IN customer_order_headers.coh_delivery_type_flag%TYPE,
  p_coh_cus_code                    IN customer_order_headers.coh_cus_code%TYPE,
  p_coh_message                     IN customer_order_headers.coh_message%TYPE,
  p_use_code                        IN users.use_code%TYPE,
  p_lang                            IN VARCHAR2,
  p_to_be_cleared_switch            OUT NUMBER,
  p_pick_list_generated_switch      OUT NUMBER
);

FUNCTION IS_TO_BE_PREPARED_FUNC(
  p_coh_id  IN customer_order_headers.coh_id%TYPE
) RETURN BOOLEAN;

PROCEDURE FIND_INFO_ROUTE_PROC(
  p_coh_cus_code            IN  customer_order_headers.coh_cus_code%TYPE,
  p_coh_whs_delivery_code   IN  customer_order_headers.coh_whs_delivery_code%TYPE,
  p_coh_delivery_type_flag  IN  customer_order_headers.coh_delivery_type_flag%TYPE,
  p_cod_delivery_date       IN  customer_order_details.cod_project_delivery_date%TYPE,
  p_language                IN  VARCHAR2,
  p_rou_code                OUT routes.rou_code%TYPE,
  p_rou_description         OUT routes.rou_description%TYPE,
  p_route_position          OUT route_dates.rod_position%TYPE
);

FUNCTION GET_DELIVERY_DATE_FUNC(
  p_coh_id                  IN customer_order_headers.coh_id%TYPE,
  p_coh_cus_code            IN customer_order_headers.coh_cus_code%TYPE,
  p_coh_delivery_type_flag  IN customer_order_headers.coh_delivery_type_flag%TYPE,
  p_ctr_order_days_limit    IN control.ctr_order_days_limit%TYPE
) RETURN DATE;

FUNCTION IS_SCHEDULE_FOR_DELIVERY_FUNC (
  p_coh_id                      IN    customer_order_headers.coh_id%TYPE,
  p_from_route_code             IN    routes.rou_code%TYPE,
  p_to_route_code               IN    routes.rou_code%TYPE,
  p_delivery_date               IN    DATE
) RETURN BOOLEAN;

PROCEDURE UPDATE_COH_PRO_DELIV_CHAR_PROC(
  p_coh_id                        IN customer_order_headers.coh_id%TYPE,
  p_coh_proposed_delivery_charge  IN customer_order_headers.coh_proposed_delivery_charge%TYPE
);

FUNCTION VALIDATE_MAX_TOBACCO_FUNC(
  p_max_tobacco IN provinces.prv_max_tobacco_no_licence%TYPE,
  p_qty_tobacco IN NUMBER
)
RETURN BOOLEAN;

FUNCTION VALIDATE_MAX_TOBACCO_FUNC(
  p_coh_id      IN customer_order_headers.coh_id%TYPE,
  p_max_tobacco IN provinces.prv_max_tobacco_no_licence%TYPE
)
RETURN BOOLEAN;

FUNCTION EXISTS_OPEN_CASH_CARRY_FUNC(
  p_coh_cus_code IN customer_order_headers.coh_cus_code%TYPE
)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_coh_id IN customer_order_headers.coh_id%TYPE
);
PROCEDURE APPLY_INCENTIVES_PROC(
  p_coh_id                   IN customer_order_headers.coh_id%TYPE,
  p_add_free_if_not_enough   IN NUMBER,
  p_cod_order_source         IN VARCHAR2,
  p_calculated               OUT NUMBER
 ) ;

PROCEDURE CANCEL_INCENTIVES_PROC(
  p_coh_id                         IN customer_order_headers.coh_id%TYPE
);

PROCEDURE DELETE_FREEGOOD_CC_PROC(
  p_coh_id                         IN customer_order_headers.coh_id%TYPE
) ;

PROCEDURE CANCEL_INCENTIVES_CC_PROC(
  p_coh_id                         IN customer_order_headers.coh_id%TYPE
);

--bea228 trouver un COH_REF relié à une facture
FUNCTION FIND_COH_REF_FROM_INH_FUNC(
  p_inh_id IN NUMBER
)
RETURN VARCHAR2;

FUNCTION VALIDATE_REFERENCE_NUMBER_FUNC(
  p_coh_cus_code             IN customer_order_headers.coh_cus_code%TYPE,
  p_coh_reference_number     IN customer_order_headers.coh_reference_number%TYPE,
  p_coh_pci_order_rgf_number IN customer_order_headers.coh_pci_order_rgf_number%TYPE
)
RETURN BOOLEAN;

END COH_OPERATION_PACK;
/