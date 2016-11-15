CREATE OR REPLACE PACKAGE phenix.SGE_INTERCO_PACK IS

PROCEDURE SET_TRANSFERT_STATUS_PROC(
  p_trh_id          IN  transfer_headers.trh_id%TYPE,
  p_status_code     IN  transfer_headers.trh_status%TYPE
);

PROCEDURE LOCK_TRANSFERT_PROC(
  p_trh_id        IN  transfer_headers.trh_id%TYPE,
  p_use_code      IN  users.use_code%TYPE
);

PROCEDURE RELEASE_TRANSFERT_PROC(
  p_use_code  IN  users.use_code%TYPE,
  p_trh_id    IN  NUMBER DEFAULT NULL
);

PROCEDURE RECEIVE_TRANSFERT_LINE_PROC(
  p_trd_id              IN  transfer_details.trd_id%TYPE,
  p_received_quantity   IN  transfer_details.trd_received_quantity%TYPE,
  p_received_weight     IN  transfer_details.trd_received_weight%TYPE,
  p_use_code            IN  users.use_code%TYPE,
  p_loc_code            IN  locations.loc_code%TYPE,
  p_start_date          IN  DATE,
  p_end_date            IN  DATE,
  p_expiry_date         IN  DATE
);

PROCEDURE RECEIVE_PO_TRANSFERT_LINE_PROC(
  p_trd_id              IN transfer_details.trd_id%TYPE,
  p_loc_code            IN locations.loc_code%TYPE,
  p_received_quantity   IN transfer_details.trd_authorized_quantity%TYPE,
  p_received_weight     IN transfer_details.trd_authorized_weight%TYPE,
  p_use_po_recept_code  IN NUMBER DEFAULT NULL -- BER1927
);

PROCEDURE PICK_TRANSFERT_LINE_PROC(
  p_trd_id              IN  transfer_details.trd_id%TYPE,
  p_picked_quantity     IN  transfer_details.trd_picked_quantity%TYPE,
  p_picked_weight       IN  transfer_details.trd_picked_weight%TYPE,
  p_use_code            IN  users.use_code%TYPE,
  p_loc_code            IN  locations.loc_code%TYPE,
  p_start_date          IN  DATE,
  p_end_date            IN  DATE,
  p_expiry_date         IN  DATE
);

FUNCTION CREATE_TRANSFERT_FUNC (
  p_src_whs_code            IN  transfer_headers.trh_whs_from_code%TYPE,
  p_dest_whs_code           IN  transfer_headers.trh_whs_to_code%TYPE,
  p_shipping_date           IN  DATE
)RETURN NUMBER;

PROCEDURE ADD_TRANSFERT_LINE_PROC(
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

PROCEDURE END_TRANSFERT_PICK_PROC(
  p_trh_id          IN transfer_headers.trh_id%TYPE,
  p_shipping_date   IN transfer_headers.trh_shipping_date%TYPE,
  p_use_picker_code IN transfer_details.trd_use_picker_code%TYPE
);

PROCEDURE END_RECEIVING_PROC(
  p_trh_id      IN  transfer_headers.trh_id%TYPE,
  p_use_code    IN  users.use_code%TYPE
);

PROCEDURE PRINT_TRANSFERT_MANIFEST_PROC(
  p_shipping_date   IN  DATE,
  p_src_whs_code    IN  transfer_headers.trh_whs_from_code%TYPE,
  p_dest_whs_code   IN  transfer_headers.trh_whs_to_code%TYPE,
  p_prn_code        IN  printers.prn_code%TYPE DEFAULT NULL,
  p_interco_number  IN  NUMBER DEFAULT NULL
);

PROCEDURE CREATE_TRANSFERT_USER_PROC(
  p_trh_id    IN transfer_headers.trh_id%TYPE,
  p_use_code  IN users.use_code%TYPE
);

FUNCTION DELETE_TRANSFERT_USER_FUNC (
  p_trh_id    IN transfer_headers.trh_id%TYPE,
  p_use_code  IN users.use_code%TYPE
)RETURN NUMBER;

FUNCTION IS_DETAIL_MUST_BE_UPDATED_FUNC(
  p_trd_prf_prd_code            IN  transfer_details.trd_prf_prd_code%TYPE,
  p_trd_prf_fmt_code            IN  transfer_details.trd_prf_fmt_code%TYPE,
  p_trd_whs_from_code           IN  transfer_details.trd_whs_from_code%TYPE,
  p_trd_whs_to_code             IN  transfer_details.trd_whs_to_code%TYPE,
  p_trd_creation_source         IN  transfer_details.trd_creation_source%TYPE,
  p_trd_expected_shipping_date  IN  transfer_details.trd_expected_shipping_date%TYPE,
  p_trd_requested_qty_weight    OUT NUMBER
)
RETURN BOOLEAN;

PROCEDURE INSERT_OR_UPDATE_DETAIL_PROC(
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

PROCEDURE BUILD_PICK_LOCATIONS_PROC(
  p_trh_use_lock_code IN transfer_headers.trh_use_lock_code%TYPE,
  p_trd_prf_prd_code  IN transfer_details.trd_prf_prd_code%TYPE,
  p_trd_prf_fmt_code  IN transfer_details.trd_prf_fmt_code%TYPE,
  p_language          IN VARCHAR2
);

PROCEDURE BUILD_PICK_LOCATIONS_PROC(
  p_trh_use_lock_code IN transfer_headers.trh_use_lock_code%TYPE,
  p_language          IN VARCHAR2
);

END SGE_INTERCO_PACK;
/