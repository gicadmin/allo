CREATE OR REPLACE PACKAGE phenix.INM_OPERATION_PACK IS

FUNCTION CREATE_INM_FUNC (
  p_inm_prf_prd_code         IN  VARCHAR2,
  p_inm_prf_source_fmt_code  IN  VARCHAR2,
  p_inm_moved_quantity_out   IN  NUMBER,
  p_inm_moved_weight_out     IN  NUMBER,
  p_inm_use_code             IN  NUMBER,
  p_inm_from_loc_code        IN  VARCHAR2,
  p_inm_start_date           IN  DATE,
  p_inm_planned_switch       IN  NUMBER,
  p_inm_trans_type           IN  VARCHAR2,
  p_inm_fifo_date            IN  DATE,  -- GIC3396
  p_inm_expiry_date          IN  DATE,  --CVI98 + GIC3396
  p_inm_id                   OUT NOCOPY NUMBER,
  p_inm_source_ide_id        IN  NUMBER  DEFAULT NULL      --CSC2799
)
RETURN PLS_INTEGER;

FUNCTION UPDATE_INM_FUNC (
  p_inm_id                         IN   NUMBER,
  p_inm_prf_destination_fmt_code   IN   VARCHAR2,
  p_inm_moved_quantity_in          IN   NUMBER,
  p_inm_moved_weight_in            IN   NUMBER,
  p_inm_to_loc_code                IN   VARCHAR2,
  p_inm_end_date                   IN   DATE,
  p_inm_destination_ide_id         IN   NUMBER  DEFAULT NULL,     ---CSC2799
  p_inm_dmr_code                   IN   NUMBER  DEFAULT NULL,     --CSC3441
  p_inm_destination_prd_code       IN   VARCHAR2 DEFAULT NULL     --BER1019
)
RETURN PLS_INTEGER;

--Fonction utilisée pour déterminer le id original du deplacement (loc_orig vers loc_user vers loc_dest)...
FUNCTION FIND_ORIGINAL_INM_FUNC (--csc3555
  p_inm_prf_prd_code        IN VARCHAR2,
  p_inm_prf_fmt_code        IN VARCHAR2,
  p_inm_use_code            IN VARCHAR2,
  p_inm_from_loc_code       IN VARCHAR2,
  p_inm_trans_type          IN VARCHAR2,
  p_inm_group_id            OUT NOCOPY NUMBER
)
RETURN PLS_INTEGER;

--Fonction utilisée pour déterminer le id original du deplacement multiple
FUNCTION FIND_ORIGINAL_INM_MV2_FUNC (--csc3555
  p_identifier        IN NUMBER,
  p_inm_use_code      IN VARCHAR2,
  p_inm_from_loc_code IN VARCHAR2,
  p_inm_to_loc_code   IN VARCHAR2,
  p_inm_group_id      OUT NOCOPY NUMBER
)
RETURN PLS_INTEGER;

FUNCTION GET_MAX_REP_START_DATE_FUNC(
  p_inm_prf_prd_code        IN inventory_movements.inm_prf_prd_code%TYPE,
  p_inm_prf_source_fmt_code IN inventory_movements.inm_prf_source_fmt_code%TYPE,
  p_inm_to_loc_code         IN inventory_movements.inm_to_loc_code%TYPE
) RETURN DATE;

PROCEDURE PURGE_PROC(
  p_max_items        IN NUMBER
);

PROCEDURE GET_INFO_BY_LOC_PROC(
  p_prd_code        IN   products.prd_code%TYPE,
  p_prd_fmt_code    IN   product_formats.prf_fmt_code%TYPE,
  p_loc_code        IN   locations.loc_code%TYPE ,
  p_whs_code        IN   warehouses.whs_code%TYPE ,
  p_date            IN   DATE,
  p_prd_definition  IN   products.prd_definition%TYPE,
  p_inv_qty         OUT  NUMBER,
  p_inv_wght        OUT  NUMBER,
  p_start_date      OUT  DATE
);

PROCEDURE SET_USED_PROC(
  p_rowid IN ROWID
);

PROCEDURE SET_ALL_USED_PROC(
  p_inm_prf_destination_prd_code IN inventory_movements.inm_prf_destination_prd_code%TYPE,
  p_inm_prf_destination_fmt_code IN inventory_movements.inm_prf_destination_fmt_code%TYPE,
  p_inm_to_loc_code              IN inventory_movements.inm_to_loc_code%TYPE
);

FUNCTION CREATE_FUNC (
  p_inm_prf_prd_code              IN  inventory_movements.inm_prf_prd_code%TYPE,
  p_inm_prf_source_fmt_code       IN  inventory_movements.inm_prf_source_fmt_code%TYPE,
  p_inm_src_loc_quantity_on_hand  IN  inventory_movements.inm_src_loc_quantity_on_hand%TYPE,
  p_inm_src_loc_weight_on_hand    IN  inventory_movements.inm_src_loc_weight_on_hand%TYPE,
  p_inm_moved_quantity_out        IN  inventory_movements.inm_moved_quantity_out%TYPE,
  p_inm_moved_weight_out          IN  inventory_movements.inm_moved_weight_out%TYPE,
  p_inm_use_code                  IN  inventory_movements.inm_use_code%TYPE,
  p_inm_from_loc_code             IN  inventory_movements.inm_from_loc_code%TYPE,
  p_inm_start_date                IN  inventory_movements.inm_start_date%TYPE,
  p_inm_planned_switch            IN  inventory_movements.inm_planned_switch%TYPE,
  p_inm_trans_type                IN  inventory_movements.inm_trans_type%TYPE,
  p_inm_fifo_date                 IN  inventory_movements.inm_fifo_date%TYPE,
  p_inm_expiry_date               IN  inventory_movements.inm_expiry_date%TYPE,
  p_inm_group_id                  IN  inventory_movements.inm_group_id%TYPE,
  p_inm_prf_destination_prd_code  IN  inventory_movements.inm_prf_destination_prd_code%TYPE,
  p_inm_prf_destination_fmt_code  IN  inventory_movements.inm_prf_destination_fmt_code%TYPE,
  p_inm_dest_loc_qty_on_hand      IN  inventory_movements.inm_dest_loc_quantity_on_hand%TYPE,
  p_inm_dest_loc_weight_on_hand   IN  inventory_movements.inm_dest_loc_weight_on_hand%TYPE,
  p_inm_moved_quantity_in         IN  inventory_movements.inm_moved_quantity_in%TYPE,
  p_inm_moved_weight_in           IN  inventory_movements.inm_moved_weight_in%TYPE,
  p_inm_to_loc_code               IN  inventory_movements.inm_to_loc_code%TYPE,
  p_inm_end_date                  IN  inventory_movements.inm_end_date%TYPE,
  p_inm_source_ide_id             IN  inventory_movements.inm_source_ide_id%TYPE      DEFAULT NULL,
  p_inm_destination_ide_id        IN  inventory_movements.inm_destination_ide_id%TYPE DEFAULT NULL,
  p_inm_dmr_code                  IN  inventory_movements.inm_dmr_code%TYPE           DEFAULT NULL
)
RETURN NUMBER;

FUNCTION EXISTS_ON_USER_FUNC(
  p_use_code IN users.use_code%TYPE
)
RETURN BOOLEAN;

END INM_OPERATION_PACK;
/