CREATE OR REPLACE PACKAGE phenix.INTERCO_PACK AS

FUNCTION GET_TRH_FUNC(
  p_trh_id  IN         transfer_headers.trh_id%TYPE,
  p_trh     OUT NOCOPY transfer_headers%ROWTYPE
) RETURN PLS_INTEGER;

FUNCTION GET_TRD_FUNC(
  p_trd_id  IN         transfer_details.trd_id%TYPE,
  p_trd     OUT NOCOPY transfer_details%ROWTYPE
) RETURN PLS_INTEGER;

FUNCTION UPDATE_TRH_STATUS_FUNC(
  p_trh_id          IN  transfer_headers.trh_id%TYPE,
  p_status_code     IN  transfer_headers.trh_status%TYPE
) RETURN PLS_INTEGER;

FUNCTION LOCK_TRH_FUNC(
  p_trh_id        IN  transfer_headers.trh_id%TYPE,
  p_use_code      IN  users.use_code%TYPE
) RETURN PLS_INTEGER;

FUNCTION RELEASE_TRH_FUNC(
  p_use_code  IN  users.use_code%TYPE,
  p_trh_id    IN  NUMBER DEFAULT NULL
) RETURN PLS_INTEGER;

FUNCTION UPDATE_INTERCO_RECEIPT_FUNC(
  p_trd_id              IN  transfer_details.trd_id%TYPE,
  p_received_quantity   IN  transfer_details.trd_received_quantity%TYPE,
  p_received_weight     IN  transfer_details.trd_received_weight%TYPE,
  p_use_code            IN  users.use_code%TYPE,
  p_loc_code            IN  locations.loc_code%TYPE,
  p_start_date          IN  DATE,
  p_end_date            IN  DATE,
  p_expiry_date         IN  DATE
) RETURN PLS_INTEGER;

FUNCTION UPDATE_INTERCO_PICKING_FUNC(
  p_trd_id              IN  transfer_details.trd_id%TYPE,
  p_picked_quantity     IN  transfer_details.trd_picked_quantity%TYPE,
  p_picked_weight       IN  transfer_details.trd_picked_weight%TYPE,
  p_use_code            IN  users.use_code%TYPE,
  p_loc_code            IN  locations.loc_code%TYPE,
  p_start_date          IN  DATE,
  p_end_date            IN  DATE,
  p_expiry_date         IN  DATE
) RETURN PLS_INTEGER;

FUNCTION CREATE_INTERCO_HEADER_FUNC(
  p_src_whs_code            IN  transfer_headers.trh_whs_from_code%TYPE,
  p_dest_whs_code           IN  transfer_headers.trh_whs_to_code%TYPE,
  p_shipping_date           IN  DATE,
  p_trh_id                  OUT transfer_headers.trh_id%TYPE
) RETURN PLS_INTEGER;

FUNCTION CREATE_INTERCO_DETAIL_FUNC(
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
) RETURN PLS_INTEGER;

FUNCTION END_PICKING_FUNC(
  p_trh_id        IN  transfer_headers.trh_id%TYPE,
  p_shipping_date IN  transfer_headers.trh_shipping_date%TYPE
) RETURN PLS_INTEGER;

FUNCTION END_RECEIVING_FUNC(
  p_trh_id      IN  transfer_headers.trh_id%TYPE,
  p_use_code    IN  users.use_code%TYPE
) RETURN PLS_INTEGER;

FUNCTION GET_TRH_TOTALS_FUNC(
  p_trh_id                IN  transfer_headers.trh_id%TYPE,
  p_accounting_quantity   OUT NUMBER,
  p_elements              OUT NUMBER,
  p_cost                  OUT NUMBER,
  p_consignments          OUT NUMBER,   -- BER2282
  p_trd_id                IN  NUMBER DEFAULT NULL -- BER2282
) RETURN PLS_INTEGER;

PROCEDURE PRINT_MANIFEST_PROC(
  p_shipping_date   IN  DATE,
  p_src_whs_code    IN  transfer_headers.trh_whs_from_code%TYPE,
  p_dest_whs_code   IN  transfer_headers.trh_whs_to_code%TYPE,
  p_prn_code        IN  printers.prn_code%TYPE DEFAULT NULL,
  p_interco_number  IN  NUMBER DEFAULT NULL -- BER1927
);

FUNCTION CREATE_TRU_FUNC(
  p_trh_id    IN transfer_headers.trh_id%TYPE,
  p_use_code  IN users.use_code%TYPE
) RETURN PLS_INTEGER;

FUNCTION DELETE_TRU_FUNC(
  p_trh_id    IN transfer_headers.trh_id%TYPE,
  p_use_code  IN users.use_code%TYPE
) RETURN PLS_INTEGER;

FUNCTION UPDATE_TRD_FOR_RECEIPT_FUNC(
  p_trd_id              IN transfer_details.trd_id%TYPE,
  p_loc_code            IN locations.loc_code%TYPE,
  p_received_quantity   IN transfer_details.trd_authorized_quantity%TYPE,
  p_received_weight     IN transfer_details.trd_authorized_weight%TYPE,
  p_use_po_recept_code  IN NUMBER DEFAULT NULL -- BER1927
) RETURN PLS_INTEGER;

PROCEDURE DELETE_TRD_PROC (
  p_poh_id   IN  purchase_order_headers.poh_id%TYPE
);

END INTERCO_PACK;
/