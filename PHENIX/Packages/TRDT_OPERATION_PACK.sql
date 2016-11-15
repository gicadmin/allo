CREATE OR REPLACE PACKAGE phenix.TRDT_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_trd_trh_id  IN transfer_details.trd_trh_id%TYPE
);

PROCEDURE RESERVE_TRD_PROC(
  p_trd_id              IN transfer_details.trd_id%TYPE,
  p_trd_selected_switch IN NUMBER,
  p_use_code            IN users.use_code%TYPE,
  p_trd_lock_unique_id  IN OUT VARCHAR2
);

PROCEDURE SET_LINES_PROC(
  p_trd_id          IN transfer_details.trd_id%TYPE,
  p_trd_trh_id      IN transfer_details.trd_trh_id%TYPE,
  p_trd_line_number IN transfer_details.trd_line_number%TYPE
);

PROCEDURE ADJUST_TIMELINE(
  p_poh_whs_code               IN PURCHASE_ORDER_HEADERS.POH_WHS_CODE%TYPE,
  p_trd_whs_to_code            IN TRANSFER_DETAILS.TRD_WHS_TO_CODE%TYPE,
  p_trd_prf_prd_code           IN TRANSFER_DETAILS.TRD_PRF_PRD_CODE%TYPE,
  p_trd_prf_fmt_code           IN TRANSFER_DETAILS.TRD_PRF_FMT_CODE%TYPE,
  p_poh_inventory_avalab_date  IN PURCHASE_ORDER_HEADERS.POH_INVENTORY_AVALABILITY_DATE%TYPE,
  p_trd_requested_quantity     IN TRANSFER_DETAILS.TRD_REQUESTED_QUANTITY%TYPE,
  p_trd_requested_weight       IN TRANSFER_DETAILS.TRD_REQUESTED_WEIGHT%TYPE,
  p_trd_authorized_quantity    IN TRANSFER_DETAILS.TRD_AUTHORIZED_QUANTITY%TYPE,
  p_trd_authorized_weight      IN TRANSFER_DETAILS.TRD_AUTHORIZED_WEIGHT%TYPE,
  p_trd_received_quantity      IN TRANSFER_DETAILS.TRD_RECEIVED_QUANTITY%TYPE,
  p_trd_received_weight        IN TRANSFER_DETAILS.TRD_RECEIVED_WEIGHT%TYPE
);

PROCEDURE CHANGE_RECEPT_DATE_PROC(
    p_poh_id                            IN purchase_order_headers.poh_id%TYPE,
    p_whs_code                          IN PURCHASE_ORDER_HEADERS.POH_WHS_CODE%TYPE,
    p_old_recept_date                   IN PURCHASE_ORDER_HEADERS.POH_EXPECTED_RECEP_DATE%TYPE,
    p_new_recept_date                   IN PURCHASE_ORDER_HEADERS.POH_EXPECTED_RECEP_DATE%TYPE
);

PROCEDURE PO_RECEIVED_PROC(
  p_poh_id                     IN purchase_order_headers.poh_id%TYPE,
  p_whs_code                   IN purchase_order_headers.poh_whs_code%TYPE,
  p_poh_inventory_avalab_date  IN purchase_order_headers.poh_inventory_avalability_date%TYPE
);

PROCEDURE TRH_CLOSING_PROC(
    p_trh_id                           IN transfer_headers.trh_id%TYPE);

PROCEDURE RECEIVE_PROC(
  p_trd_id              IN  transfer_details.trd_id%TYPE,
  p_received_quantity   IN  transfer_details.trd_received_quantity%TYPE,
  p_received_weight     IN  transfer_details.trd_received_weight%TYPE,
  p_use_code            IN  users.use_code%TYPE,
  p_loc_code            IN  locations.loc_code%TYPE,
  p_start_date          IN  DATE,
  p_end_date            IN  DATE,
  p_expiry_date         IN  DATE
);


PROCEDURE RECEIVE_PO_PROC(
  p_trd_id              IN transfer_details.trd_id%TYPE,
  p_loc_code            IN locations.loc_code%TYPE,
  p_received_quantity   IN transfer_details.trd_authorized_quantity%TYPE,
  p_received_weight     IN transfer_details.trd_authorized_weight%TYPE,
  p_use_po_recept_code  IN NUMBER DEFAULT NULL -- BER1927
) ;

PROCEDURE PICK_PROC(
  p_trd_id              IN  transfer_details.trd_id%TYPE,
  p_picked_quantity     IN  transfer_details.trd_picked_quantity%TYPE,
  p_picked_weight       IN  transfer_details.trd_picked_weight%TYPE,
  p_use_code            IN  users.use_code%TYPE,
  p_loc_code            IN  locations.loc_code%TYPE,
  p_start_date          IN  DATE,
  p_end_date            IN  DATE,
  p_expiry_date         IN  DATE
) ;

FUNCTION GET_TRD_ID(
  p_trh_id                  IN  transfer_headers.trh_id%TYPE,
  p_prd_code                IN  products.prd_code%TYPE,
  p_fmt_code                IN  formats.fmt_code%TYPE
)
RETURN NUMBER;

PROCEDURE ADD_PROC(
  p_trh_id                  IN  transfer_headers.trh_id%TYPE,
  p_from_whs_code           IN  transfer_details.trd_whs_from_code%TYPE,
  p_to_whs_code             IN  transfer_details.trd_whs_to_code%TYPE,
  p_creation_source         IN  transfer_details.trd_creation_source%TYPE,
  p_prd_code                IN  products.prd_code%TYPE,
  p_fmt_code                IN  formats.fmt_code%TYPE,
  p_requested_quantity      IN  transfer_details.trd_requested_quantity%TYPE,
  p_requested_weight        IN  transfer_details.trd_requested_weight%TYPE,
  p_use_code                IN  users.use_code%TYPE,
  p_poh_id                  IN  transfer_details.trd_poh_id%TYPE,
  p_expected_shipping_date  IN  transfer_details.trd_expected_shipping_date%TYPE,
  p_trd_id                  OUT transfer_details.trd_id%TYPE
);

PROCEDURE DELETE_FROM_PO_PROC (
  p_poh_id   IN  purchase_order_headers.poh_id%TYPE
);

PROCEDURE MODIFY_TRD_SHIPPING_DATE_PROC(
  p_poh_id  IN purchase_order_headers.poh_id%TYPE
);

FUNCTION GET_ACTUAL_TRD_FUNC(
  p_trd_prf_prd_code            IN  transfer_details.trd_prf_prd_code%TYPE,
  p_trd_prf_fmt_code            IN  transfer_details.trd_prf_fmt_code%TYPE,
  p_trd_whs_from_code           IN  transfer_details.trd_whs_from_code%TYPE,
  p_trd_whs_to_code             IN  transfer_details.trd_whs_to_code%TYPE,
  p_trd_creation_source         IN  transfer_details.trd_creation_source%TYPE,
  p_trd_expected_shipping_date  IN  transfer_details.trd_expected_shipping_date%TYPE,
  p_trd_requested_qty_weight    OUT NUMBER
)
RETURN NUMBER;

PROCEDURE INSERT_OR_UPDATE_PROC(
  p_trd_prf_prd_code           IN transfer_details.trd_prf_prd_code%TYPE,
  p_trd_prf_fmt_code           IN transfer_details.trd_prf_fmt_code%TYPE,
  p_trd_whs_from_code          IN transfer_details.trd_whs_from_code%TYPE,
  p_trd_whs_to_code            IN transfer_details.trd_whs_to_code%TYPE,
  p_trd_creation_source        IN transfer_details.trd_creation_source%TYPE,
  p_trd_expected_shipping_date IN transfer_details.trd_expected_shipping_date%TYPE,
  p_trd_requested_quantity     IN transfer_details.trd_requested_quantity%TYPE,
  p_trd_requested_weight       IN transfer_details.trd_requested_weight%TYPE
);

PROCEDURE DISTRIBUTE_PICKING_PROC(
  p_trh_use_lock_code IN transfer_headers.trh_use_lock_code%TYPE,
  p_trd_prf_prd_code  IN transfer_details.trd_prf_prd_code%TYPE,
  p_trd_prf_fmt_code  IN transfer_details.trd_prf_fmt_code%TYPE,
  p_loc_code          IN locations.loc_code%TYPE,
  p_quantity          IN NUMBER,
  p_weight            IN NUMBER,
  p_start_date        IN DATE,
  p_expiry_date       IN DATE
);

PROCEDURE DISTRIBUTE_RECEIVING_PROC(
  p_tru_use_code      IN transfer_users.tru_use_code%TYPE,
  p_trd_prf_prd_code  IN transfer_details.trd_prf_prd_code%TYPE,
  p_trd_prf_fmt_code  IN transfer_details.trd_prf_fmt_code%TYPE,
  p_loc_code          IN locations.loc_code%TYPE,
  p_quantity          IN NUMBER,
  p_weight            IN NUMBER,
  p_start_date        IN DATE,
  p_expiry_date       IN DATE
);

END TRDT_OPERATION_PACK;
/