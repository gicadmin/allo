CREATE OR REPLACE PACKAGE phenix.TRH_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep               IN  NUMBER,
  p_max_items                     IN  NUMBER
);

PROCEDURE SET_STATUS_PROC(
  p_trh_id       IN  transfer_headers.trh_id%TYPE,
  p_status_code  IN  transfer_headers.trh_status%TYPE
);

PROCEDURE CREATE_INTERCO_PROC(
  p_from_whs_code  IN warehouses.whs_code%TYPE,
  p_to_whs_code    IN warehouses.whs_code%TYPE,
  p_sort_selection IN VARCHAR2,
  p_use_code       IN users.use_code%TYPE
);

PROCEDURE END_PICKING_PROC(
  p_trh_id          IN transfer_headers.trh_id%TYPE,
  p_shipping_date   IN transfer_headers.trh_shipping_date%TYPE,
  p_use_picker_code IN transfer_details.trd_use_picker_code%TYPE
);

PROCEDURE END_RECEIVING_PROC(
  p_trh_id      IN  transfer_headers.trh_id%TYPE,
  p_use_code    IN  users.use_code%TYPE
);

PROCEDURE TRH_USE_LOCK_CODE_PROC(
  p_trh_id        IN  transfer_headers.trh_id%TYPE,
  p_use_code      IN  users.use_code%TYPE
);

FUNCTION LOCK_FUNC(
  p_trh_id        IN  transfer_headers.trh_id%TYPE,
  p_use_code      IN  users.use_code%TYPE
) RETURN BOOLEAN;

PROCEDURE RELEASE_PROC(
  p_use_code  IN  users.use_code%TYPE,
  p_trh_id    IN  NUMBER DEFAULT NULL
);

PROCEDURE GET_TOTALS_PROC(
  p_trh_id                IN  transfer_headers.trh_id%TYPE,
  p_accounting_quantity   OUT NUMBER,
  p_elements              OUT NUMBER,
  p_cost                  OUT NUMBER,
  p_consignments          OUT NUMBER,   -- BER2282
  p_trd_id                IN  NUMBER DEFAULT NULL -- BER2282
);

FUNCTION EXISTS_ON_USER_FUNC(
  p_trh_use_lock_code IN transfer_headers.trh_use_lock_code%TYPE
)
RETURN BOOLEAN;

END TRH_OPERATION_PACK;
/