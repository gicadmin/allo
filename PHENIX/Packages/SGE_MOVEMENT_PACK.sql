CREATE OR REPLACE PACKAGE phenix.SGE_MOVEMENT_PACK IS

FUNCTION CALCULATE_AVAILABLE_FUNC(
  p_inv_loc_code     IN inventories.inv_loc_code%TYPE,
  p_inv_prf_prd_code IN inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code IN inventories.inv_prf_fmt_code%TYPE,
  p_prd_definition   IN products.prd_definition%TYPE,
  p_mission_switch   IN NUMBER DEFAULT 0  --CSC3985
)
RETURN NUMBER;

FUNCTION VALID_IDENT_DESTINAT_LOC_FUNC(
  p_loc_code              IN  VARCHAR2,
  p_identifier            IN  NUMBER,
  p_language_flag         IN  VARCHAR2,   -- "F" pour Français ou "E" pour English
  p_vocal_switch          IN  NUMBER,
  p_ccr_code              OUT NUMBER,
  p_ccr_message           OUT VARCHAR2
)
RETURN PLS_INTEGER;

FUNCTION MOVE_IDENT_DEPLACEMENT_FUNC(
  p_ident                 IN      NUMBER,
  p_new_ident             IN      NUMBER,
  p_inv_quantity_on_hand  IN      NUMBER,
  p_inv_weight_on_hand    IN      NUMBER,
  p_inv_loc_code          IN      VARCHAR2,
  p_new_loc_code          OUT     VARCHAR2,
  p_use_code              IN      NUMBER   	DEFAULT NULL,
  p_planned_switch        IN      NUMBER   	DEFAULT NULL,
  p_inm_trans_type        IN      VARCHAR2 	DEFAULT NULL,
  p_dmr_code			 				IN			NUMBER		DEFAULT NULL	--CSC3441
)
RETURN PLS_INTEGER;

FUNCTION MOVE_IDENT_REPLENISH_FUNC(
  p_ident                 IN      NUMBER,
  p_inv_quantity_on_hand  IN      NUMBER,
  p_inv_weight_on_hand    IN      NUMBER,
  p_quantity_suggested    IN      NUMBER,   --BER3820 doit indiqué la quantité suggéré d'une destination de réappro (lorsqu'on met dans une loc de cueillette
  p_inv_loc_code          IN      VARCHAR2,
  p_picking_loc_code      IN      VARCHAR2,
  p_deplacement_type      IN      NUMBER,   --ber3820  0=de la réserve vers la loc user  1=1ere destination de cueillette     2=2eme destination (ou plus)
  p_new_loc_code          OUT     VARCHAR2,
  p_use_code              IN      NUMBER   DEFAULT NULL,
  p_planned_switch        IN      NUMBER   DEFAULT NULL,
  p_inm_trans_type        IN      VARCHAR2 DEFAULT NULL
)
RETURN PLS_INTEGER;

FUNCTION UPDATE_IN_TRANSIT_FUNC(
  p_inv_loc_code        IN VARCHAR2,
  p_inv_prf_prd_code    IN VARCHAR2,
  p_inv_prf_fmt_code    IN VARCHAR2,
  p_inv_quantity_in_out IN NUMBER,
  p_inv_weight_in_out   IN NUMBER,
  p_inv_in_out_flag     IN CHAR
)
RETURN PLS_INTEGER;

FUNCTION GENERAL_UPDATE_INVENTORY_FUNC(
  p_inv_loc_code            IN VARCHAR2,
  p_inv_prf_prd_code        IN VARCHAR2,
  p_inv_prf_fmt_code        IN VARCHAR2,
  p_inv_quantity_on_hand    IN NUMBER,
  p_inv_weight_on_hand      IN NUMBER,
  p_inv_fifo_date           IN DATE,  -- GIC3396
  p_inv_expiry_date         IN DATE,  -- GIC3396
  p_inv_in_out_flag         IN CHAR,
  p_inv_last_count_date     IN DATE DEFAULT NULL,
  p_picking_switch          IN NUMBER DEFAULT 0,      --CSC2799
  p_dest_loc                IN VARCHAR2 DEFAULT NULL, --CSC2799
  p_ident                   IN NUMBER DEFAULT NULL,   --CSC2799
  p_inv_trans_type          IN VARCHAR2 DEFAULT NULL  --CSC3548
)
RETURN PLS_INTEGER;

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
  p_inm_dmr_code									 IN 	NUMBER	DEFAULT NULL,			--CSC3441
  p_inm_destination_prd_code			 IN	 	VARCHAR2 DEFAULT NULL			--BER1019
)
RETURN PLS_INTEGER;

FUNCTION FIND_AND_LOCK_REP_BY_PRD_FUNC(
  p_prd_code    IN VARCHAR2,
  p_which_prd   IN VARCHAR2,    --S ou D (S pour Source, D pour Destination)
  p_use_code    IN NUMBER,
  p_whs_code    IN VARCHAR2
)
RETURN NUMBER;

FUNCTION FIND_AND_LOCK_REP_ROU_FUNC(   --ber3820
  p_whz_code            IN warehouse_zones.whz_code%TYPE, --peut être null, si null, on prend toutes les zones
  p_source_loc_code     IN locations.loc_code%TYPE, --la source OU la DEST doit être rempli...
  p_dest_loc_code       IN locations.loc_code%TYPE,
  p_use_code            IN NUMBER,
  p_whs_code            IN VARCHAR2,
  p_only_greater_switch IN NUMBER,   -- 0 sera >=    1 sera > seulement
  p_rou_code            IN NUMBER DEFAULT NULL  --si NULL, on cherche les réappros SANS ROUTE seulement
)
RETURN NUMBER;

--trouver le premier préapro par zone d'entreposage (urgence ET preventif)
FUNCTION FIND_AND_LOCK_REP_BY_WHZ_FUNC(
  p_whz_code            IN warehouse_zones.whz_code%TYPE, --peut être null, si null, on prend toutes les zones
  p_source_loc_code     IN locations.loc_code%TYPE, --la source OU la DEST doit être rempli...
  p_dest_loc_code       IN locations.loc_code%TYPE,
  p_use_code            IN NUMBER,
  p_whs_code            IN VARCHAR2,
  p_only_greater_switch IN NUMBER,   -- 0 sera >=    1 sera > seulement
  p_from_dock_switch    IN NUMBER
)
RETURN NUMBER;

--trouver le premier réappro PREVENTIF SEULEMENT!!
FUNCTION FIND_AND_LOCK_REP_PLANNED_FUNC(
  p_whz_code            IN warehouse_zones.whz_code%TYPE, --peut être null, si null, on prend toutes les zones
  p_source_loc_code     IN locations.loc_code%TYPE, --la source OU la DEST doit être rempli...
  p_dest_loc_code       IN locations.loc_code%TYPE,
  p_use_code            IN NUMBER,
  p_whs_code            IN VARCHAR2,
  p_only_greater_switch IN NUMBER   -- 0 sera >=    1 sera > seulement
)
RETURN NUMBER;

PROCEDURE LOCK_AND_PROCESS_REP_PROC(
  p_rep_id    IN replenishments.rep_id%TYPE,
  p_use_code  IN NUMBER
);

PROCEDURE UNLOCK_REP_PROC(
  p_rep_id    IN replenishments.rep_id%TYPE,
  p_use_code  IN NUMBER
);

PROCEDURE TRANSFER_REP_FROM_USER_PROC(
  p_rep_id            IN replenishments.rep_id%TYPE,
  p_current_use_code  IN NUMBER,
  p_new_use_code      IN NUMBER
);

PROCEDURE UPDATE_REP_TAKEN_PROC(
  p_rep_id               IN replenishments.rep_id%TYPE,
  p_use_code             IN NUMBER,
  p_rep_taken_quantity   IN replenishments.rep_taken_quantity%TYPE,
  p_rep_taken_weight     IN replenishments.rep_taken_weight%TYPE
);

PROCEDURE SET_REP_STATUS_TERMINATED_PROC(
  p_rep_id        IN replenishments.rep_id%TYPE,
  p_use_code      IN NUMBER
);

PROCEDURE SET_RED_STATUS_LOC_CONF_PROC(
  p_red_id        IN replenishments.rep_id%TYPE,
  p_use_code      IN NUMBER
);

PROCEDURE UPDATE_TAKEN_AND_CLOSE_PROC(
  p_red_id                      IN replenishment_details.red_id%TYPE,
  p_use_code                    IN NUMBER,
  p_red_source_taken_quantity   IN replenishment_details.red_source_taken_quantity%TYPE,
  p_red_source_taken_weight     IN replenishment_details.red_source_taken_weight%TYPE,
  p_red_result_taken_quantity   IN replenishment_details.red_result_taken_quantity%TYPE,
  p_red_result_taken_weight     IN replenishment_details.red_result_taken_weight%TYPE
);

PROCEDURE COMPLETE_REP_PROC(  --ber3820
  p_rep_id    IN replenishments.rep_id%TYPE,
  p_use_code  IN users.use_code%TYPE
);

FUNCTION CREATE_ICT_FUNC(
  p_ict_prf_prd_code       IN   VARCHAR2,
  p_ict_prf_fmt_code       IN   VARCHAR2,
  p_ict_original_quantity  IN   NUMBER,
  p_ict_count_quantity     IN   NUMBER,
  p_ict_original_weight    IN   NUMBER,
  p_ict_count_weight       IN   NUMBER,
  p_ict_use_code           IN   NUMBER,
  p_ict_loc_code           IN   VARCHAR2,
  p_ict_start_date         IN   DATE,
  p_ict_end_date           IN   DATE,
  p_ict_fifo_date          IN   DATE, -- GIC3396
  p_ict_expiry_date        IN   DATE,
  p_ict_cah_id             IN   NUMBER,
  p_adjustment_flag        IN   VARCHAR2 DEFAULT 'A',  -- "I" = Inventaire, "E" = Aucun écart, "A" = Autres
  p_ict_iat_code           IN   NUMBER,
  p_ict_ide_id             IN   NUMBER,                --CSC3162
  p_ict_id                 OUT  NOCOPY NUMBER,
  p_ict_type               IN   VARCHAR2,              --CSC3257
  p_ict_adj_comment        IN   VARCHAR2,              --GIC2369
  p_ict_dmr_code           IN   NUMBER DEFAULT NULL,   --CSC3441
  p_ict_trh_id             IN   NUMBER DEFAULT NULL    --BER1486
)
RETURN PLS_INTEGER;

PROCEDURE SPLIT_REPLENISHMENT_PROC(
  p_red_id            IN replenishment_details.red_id%TYPE,
  p_new_dest_loc_code IN replenishment_details.red_to_loc_code%TYPE,
  p_new_quantity      IN replenishments.rep_quantity%TYPE,
  p_new_weight        IN replenishments.rep_weight%TYPE
);

END SGE_MOVEMENT_PACK;
/