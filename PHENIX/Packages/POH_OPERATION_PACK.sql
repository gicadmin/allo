CREATE OR REPLACE PACKAGE phenix.POH_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep  IN  NUMBER,
  p_max_items        IN  NUMBER
);

PROCEDURE UPDATE_POH_STATUS_PROC(
  p_poh_id      IN purchase_order_headers.poh_id%TYPE,
  p_poh_status  IN purchase_order_headers.poh_status%TYPE
);

PROCEDURE CHANGE_RECEPT_DATE_PROC(
  p_poh_id            IN purchase_order_headers.poh_id%TYPE,
  p_whs_code          IN PURCHASE_ORDER_HEADERS.POH_WHS_CODE%TYPE,
  p_old_recept_date   IN purchase_order_headers.poh_inventory_avalability_date%TYPE,
  p_new_recept_date   IN purchase_order_headers.poh_inventory_avalability_date%TYPE
);

FUNCTION POPUP_PO_TRANSMIT_MAIL_FUNC (
  p_jsc_id IN job_schedules.jsc_id%TYPE,
  p_poh_id IN purchase_order_headers.poh_id%TYPE
)
RETURN NUMBER;

PROCEDURE FREE_INH_PROC (p_inh_id IN invoice_headers.inh_id%TYPE);

FUNCTION POH_RECEIVED_DATE_FUNC (
  p_poh_id                          IN purchase_order_headers.poh_id%TYPE
 ) RETURN DATE;

FUNCTION  POH_QTY_RECEIVED_FUNC (
  p_poh_id         IN purchase_order_headers.poh_id%TYPE
) RETURN NUMBER ;

FUNCTION SET_RAP_EMAIL_FUNC(
  p_poh_id     IN purchase_order_headers.poh_id%TYPE ,
  p_cus_code   IN customers.cus_code%TYPE
) RETURN BOOLEAN;

--GCL8845 procédure pour valider si on doit fermer le header d'un po lors de la fermeture dune facture fournisseur
PROCEDURE VALIDATE_POH_CLOSING_MAH_PROC(
	p_poh_id IN purchase_order_headers.poh_id%TYPE
);

PROCEDURE SET_IS_SEND_PROC (
p_poh_id IN purchase_order_headers.poh_id%TYPE
);

PROCEDURE CHANGE_AVAILABILITY_DAYS_PROC(
  p_ven_code         IN vendor_warehouses.vwh_ven_code%TYPE,
  p_whs_code         IN vendor_warehouses.vwh_whs_code%TYPE,
  p_new_avail_days   IN vendor_warehouses.vwh_avail_in_inventory_days%TYPE,
  p_old_avail_days   IN vendor_warehouses.vwh_avail_in_inventory_days%TYPE
);

PROCEDURE CHANGE_SHIP_DAYS_PROC(
  p_ven_code           IN vendor_warehouses.vwh_ven_code%TYPE,
  p_whs_code           IN vendor_warehouses.vwh_whs_code%TYPE,
  p_new_vwh_ship_days  IN vendor_warehouses.vwh_ship_days%TYPE,
  p_old_vwh_ship_days  IN vendor_warehouses.vwh_ship_days%TYPE
) ;

FUNCTION CHANGE_AVAILABILITY_DAYS_FUNC(
  p_ven_code                   IN vendor_warehouses.vwh_ven_code%TYPE,
  p_whs_code                   IN vendor_warehouses.vwh_whs_code%TYPE,
  p_poh_expected_recep_date    IN purchase_order_headers.poh_expected_recep_date%TYPE
)
RETURN DATE;

FUNCTION LOCK_FUNC(
  p_poh_id IN purchase_order_headers.poh_id%TYPE
)
RETURN BOOLEAN;

END POH_OPERATION_PACK;
/