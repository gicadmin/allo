CREATE OR REPLACE PACKAGE phenix.INV_OPERATION_PACK IS


FUNCTION GET_SHORT_NAME RETURN VARCHAR2;

-- Fonction utilisée pour mettre à jour l'inventaire
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

-- Fonction qui met à jour une quantité entrante ou sortante pour une ligne d'inventaire.
FUNCTION UPDATE_IN_TRANSIT_FUNC(
  p_inv_loc_code        IN VARCHAR2,
  p_inv_prf_prd_code    IN VARCHAR2,
  p_inv_prf_fmt_code    IN VARCHAR2,
  p_inv_quantity_in_out IN NUMBER,
  p_inv_weight_in_out   IN NUMBER,
  p_inv_in_out_flag     IN CHAR,
  p_inv_fifo_date       IN DATE,  --CSC8528
  p_inv_expiry_date     IN DATE   --CSC8528
)
RETURN PLS_INTEGER;

-- Fonction qui met à jour une quantité entrante ou sortante pour une ligne d'inventaire.
FUNCTION UPDATE_IN_TRANSIT_FUNC(
  p_inv_loc_code        IN VARCHAR2,
  p_inv_prf_prd_code    IN VARCHAR2,
  p_inv_prf_fmt_code    IN VARCHAR2,
  p_inv_quantity_in_out IN NUMBER,
  p_inv_weight_in_out   IN NUMBER,
  p_inv_in_out_flag     IN CHAR
)
RETURN PLS_INTEGER;

-- Fonction utilisée pour supprimer une ligne d'inventaire lorsque toutes les quantités sont à 0 et que la localisation n'est pas dédiée            --
FUNCTION DELETE_EMPTY_INV_FUNC(
  p_loc_code        IN  VARCHAR2,
  p_prd_code        IN  VARCHAR2,
  p_fmt_code        IN  VARCHAR2,
  p_undedicate      IN  BOOLEAN DEFAULT FALSE
)
RETURN PLS_INTEGER;

FUNCTION DELETE_EMPTY_INV_FUNC(
  p_lty_code        IN  locations.loc_lty_code%TYPE,
  p_undedicate      IN  BOOLEAN DEFAULT FALSE
)
RETURN PLS_INTEGER;

FUNCTION CREATE_INVENTORY_ETC_FUNC(
  p_inv_loc_code     IN VARCHAR2,
  p_inv_prf_prd_code IN VARCHAR2,
  p_inv_prf_fmt_code IN VARCHAR2,
  p_inv_quantity_max IN NUMBER,
  p_inv_quantity_min IN NUMBER,
  p_inv_weight_max   IN NUMBER,
  p_inv_weight_min   IN NUMBER,
  p_inv_id           OUT NOCOPY NUMBER
)
RETURN PLS_INTEGER;

FUNCTION CREATE_INVENTORY_ETC_FUNC(
  p_inv_loc_code     IN VARCHAR2,
  p_inv_prf_prd_code IN VARCHAR2,
  p_inv_prf_fmt_code IN VARCHAR2,
  p_inv_quantity_max IN NUMBER,
  p_inv_quantity_min IN NUMBER,
  p_inv_weight_max   IN NUMBER,
  p_inv_weight_min   IN NUMBER,
  p_inv_fifo_date    IN DATE,  --CSC8528
  p_inv_expiry_date  IN DATE,  --CSC8528
  p_inv_id           OUT NOCOPY NUMBER
)
RETURN PLS_INTEGER ;

-- Fonction utilisé pour savoir qu'elle est la quantité disponible dans une localisation                                                            --
FUNCTION CALCULATE_AVAILABLE_FUNC(
  p_inv_loc_code     IN inventories.inv_loc_code%TYPE,
  p_inv_prf_prd_code IN inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code IN inventories.inv_prf_fmt_code%TYPE,
  p_prd_definition   IN products.prd_definition%TYPE,
  p_mission_switch   IN NUMBER DEFAULT 0  --CSC3985
)
RETURN NUMBER;

--Fonction qui retourne la quantité qu'il manque dans le plus grand format de la localisation pour remplir cette localisation
FUNCTION CALCULATE_FILL_FUNC(
  p_inv_loc_code       IN VARCHAR2,
  p_inv_prf_prd_code   IN VARCHAR2,
  p_prd_definition     IN OUT NOCOPY VARCHAR2,
  p_qty_wgt_max        OUT NOCOPY NUMBER,
  p_biggest_fmt_in_loc OUT NOCOPY VARCHAR2
)
RETURN PLS_INTEGER;

--Fonction utilisée pour mettre à jour la quantité ou le poids minimum et maximum pour une ligne d'inventaire                                     --
FUNCTION SET_INV_LOC_MIN_MAX_FUNC(
  p_inv_id                      IN  NUMBER,
  p_inv_quantity_or_weight_min  IN  NUMBER,
  p_inv_quantity_or_weight_max  IN  NUMBER
)
RETURN PLS_INTEGER;

-- Procédure qui recherche la plus vieille date d'expiration ou date d'entrée dans une localisation pour un produit
PROCEDURE FIND_OLDEST_DATE_PROC(
  p_loc_code                IN VARCHAR2,
  p_prd_code                IN VARCHAR2,
  p_fmt_code                IN VARCHAR2,
  p_inv_lot_switch          IN NUMBER,
  p_current_inv_quantity    IN NUMBER DEFAULT NULL,
  p_current_inv_weight      IN NUMBER DEFAULT NULL,
  p_fifo_date               OUT DATE,  -- GIC3396
  p_expiry_date             OUT DATE,  -- GIC3396
  p_history_found_switch    OUT NUMBER -- GIC3730
);

-- Procédure qui met à jour la quantité restante pour une transaction de réception, décompte ou déplacement
PROCEDURE UPDATE_TRAN_QTY_WGT_LEFT_PROC (
  p_transaction_type    IN VARCHAR2,
  p_transaction_id      IN NUMBER,
  p_qty_wgt_left        IN NUMBER,
  p_transaction_qty_wgt IN NUMBER,
  p_prd_definition      IN VARCHAR2
);

FUNCTION UPDATE_MOVEMENT_FUNC (
  p_inv_loc_code         IN   VARCHAR2,
  p_inv_prf_prd_code     IN   VARCHAR2,
  p_inv_prf_fmt_code     IN   VARCHAR2,
  p_inv_qty_mvt_in_out   IN   NUMBER,
  p_inv_wgt_mvt_in_out   IN   NUMBER,
  p_inv_fifo_date        IN   DATE,
  p_inv_expiry_date      IN   DATE,
  p_inv_in_out_flag      IN   CHAR
)
RETURN PLS_INTEGER;

FUNCTION RAZ_MOVEMENT_FUNC (
  p_inv_prf_prd_code   IN   VARCHAR2,
  p_inv_loc_code       IN   VARCHAR2,
  p_inv_prf_fmt_code   IN   VARCHAR2    --GIC1830
)
RETURN PLS_INTEGER;

FUNCTION FIND_LIQUIDATION_INV_DATE_FUNC(
  p_prd_code              IN inventories.inv_prf_prd_code%TYPE,
  p_fmt_code              IN inventories.inv_prf_fmt_code%TYPE,
  p_loc_code              IN inventories.inv_loc_code%TYPE,
  p_whs_code              IN location_types.lty_whs_code%TYPE,
  p_min_fifo_date         OUT inventories.inv_fifo_date%TYPE,
  p_min_expiry_date       OUT inventories.inv_expiry_date%TYPE,
  p_max_fifo_date         OUT inventories.inv_fifo_date%TYPE,
  p_max_expiry_date       OUT inventories.inv_expiry_date%TYPE
)
RETURN BOOLEAN;

--USG850 Retourne l'inventaire disponible
PROCEDURE FIND_AVAILABLE_PROC(
  p_prd_code  IN      VARCHAR2,
  p_fmt_code  IN OUT  VARCHAR2,
  p_whs_code  IN      VARCHAR2,
  p_quantity  OUT     NUMBER,
  p_weight    OUT     NUMBER
);

--fre4019 fonction pour trouver tout l'inventaire converti au format demandé (format null donnera le format d'inventaire
PROCEDURE FIND_ALL_ON_HAND_PROC(
  p_prd_code  IN      VARCHAR2,
  p_fmt_code  IN OUT  VARCHAR2,
  p_whs_code  IN      VARCHAR2,
  p_quantity  OUT     NUMBER,
  p_weight    OUT     NUMBER
);

--USG850 Retourne l'inventaire disponible des localisations de liquidation
PROCEDURE FIND_AVAILABL_LIQUIDATION_PROC(
  p_prd_code       IN  products.prd_code%TYPE,
  p_fmt_code       IN  formats.fmt_code%TYPE,
  p_whs_code       IN  warehouses.whs_code%TYPE,
  p_fmt_conversion IN  formats.fmt_code%TYPE,
  p_quantity       OUT NUMBER,
  p_weight         OUT NUMBER
);

--CSC6701 Ajouter ou enlever des quantités/poids sortant dans la table INVENTORIES
PROCEDURE UPDATE_OUT_PROC(
  p_loc_code         IN inventories.inv_loc_code%TYPE,
  p_prd_code         IN inventories.inv_prf_prd_code%TYPE,
  p_fmt_code         IN inventories.inv_prf_fmt_code%TYPE,
  p_quantity         IN inventories.inv_quantity_out%TYPE,
  p_weight           IN inventories.inv_weight_out%TYPE,
  p_in_out_flag      IN VARCHAR2 -- 'I' incoming  'O' outgoing
);

--CSC6701 Ajouter ou enlever des quantités/poids entrant dans la table INVENTORIES
PROCEDURE UPDATE_IN_PROC(
  p_loc_code         IN inventories.inv_loc_code%TYPE,
  p_prd_code         IN inventories.inv_prf_prd_code%TYPE,
  p_fmt_code         IN inventories.inv_prf_fmt_code%TYPE,
  p_quantity         IN inventories.inv_quantity_out%TYPE,
  p_weight           IN inventories.inv_weight_out%TYPE,
  p_in_out_flag      IN VARCHAR2 -- 'I' incoming  'O' outgoing
);

--procédure pour obtenir l'inventaire qu'on considère être disponible pour un produit demandé
PROCEDURE GET_INVENTORY_AVAILABLE_PROC (
  p_prd_code           IN VARCHAR2,
  p_prd_definition     IN VARCHAR2,
  p_whs_picking_code   IN VARCHAR2,  --ber1436
  p_available_qty      OUT NUMBER,
  p_available_wght     OUT NUMBER
);


FUNCTION FIND_INV_ON_HAND_AND_DATE_FUNC(
  p_loc_code      IN  inventories.inv_loc_code%TYPE,
  p_prd_code      IN  inventories.inv_prf_prd_code%TYPE,
  p_fmt_code      IN  inventories.inv_prf_fmt_code%TYPE,
  p_qty_on_hand   OUT inventories.inv_quantity_on_hand%TYPE,
  p_wght_on_hand  OUT inventories.inv_weight_on_hand%TYPE,
  p_fifo_date     OUT inventories.inv_fifo_date%TYPE,
  p_expiry_date   OUT inventories.inv_expiry_date%TYPE
)RETURN BOOLEAN;

PROCEDURE PURGE_PROC(
  p_inv_prf_prd_code IN inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code IN inventories.inv_prf_fmt_code%TYPE
);

FUNCTION HAS_SHIPPING_CONTAINER_FUNC(
  p_lsc_loc_code      IN location_shipping_containers.lsc_loc_code%TYPE,
  p_pmd_prf_prd_code  IN pick_mission_details.pmd_prf_prd_code%TYPE,
  p_pmd_prf_fmt_code  IN pick_mission_details.pmd_prf_fmt_code%TYPE
) RETURN BOOLEAN;

FUNCTION IS_LOC_USED_FUNC(
  p_inv_loc_code  IN inventories.inv_loc_code%TYPE
) RETURN BOOLEAN;


FUNCTION IS_CASH_AND_CARRY_FUNC(
  p_prd_code IN inventories.inv_prf_prd_code%TYPE,
  p_whs_code IN location_types.lty_whs_code%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_ANOTHER_WAREHOUSE_FUNC(
  p_inv_prf_prd_code IN inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code IN inventories.inv_prf_fmt_code%TYPE,
  p_actual_whs_code  IN warehouses.whs_code%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_THERE_INV_ON_HAND_FUNC(
  p_prd_code IN products.prd_code%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_AVAILABLE_CASH_CARRY_FUNC(
  p_inv_prf_prd_code IN inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code IN inventories.inv_prf_fmt_code%TYPE,
  p_lty_whs_code     IN location_types.lty_whs_code%TYPE,
  p_prd_definition   IN products.prd_definition%TYPE,
  p_inv_rec          OUT NOCOPY inventories%ROWTYPE
)
RETURN NUMBER;

FUNCTION GET_AVAIL_OTHER_FMT_CARRY_FUNC(
  p_inv_prf_prd_code IN inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code IN inventories.inv_prf_fmt_code%TYPE,
  p_lty_whs_code     IN location_types.lty_whs_code%TYPE,
  p_prd_definition   IN products.prd_definition%TYPE,
  p_inv_rec          OUT NOCOPY inventories%ROWTYPE
)
RETURN NUMBER;

PROCEDURE MOVE_INVENTORY_OTHER_FMT_PROC(
  p_inv_rec           IN inventories%ROWTYPE,
  p_prd_definition    IN products.prd_definition%TYPE,
  p_other_fmt_code    IN product_formats.prf_prd_code%TYPE,
  p_qty_wgt_available IN NUMBER,
  p_wanted_qty_wght   IN NUMBER
);

PROCEDURE UPDATE_INVENTORY_SAME_FMT_PROC(
  p_inv_rec           IN inventories%ROWTYPE,
  p_lty_whs_code      IN location_types.lty_whs_code%TYPE,
  p_prd_definition    IN products.prd_definition%TYPE,
  p_qty_wgt_available IN NUMBER,
  p_wanted_qty_wght   IN OUT NUMBER
);

PROCEDURE CREATE_INVENTORY_COUNT_PROC(
  p_inv_prf_prd_code IN inventories.inv_prf_prd_code%TYPE,
  p_lty_whs_code     IN location_types.lty_whs_code%TYPE
);

PROCEDURE FIND_ALL_WHS_AVAILABLE_PROC(
  p_prd_code     IN  products.prd_code%TYPE,
  p_tot_quantity OUT NUMBER,
  p_tot_weight   OUT NUMBER
);

FUNCTION EXISTS_ON_USER_FUNC(
  p_use_code   IN users.use_code%TYPE,
  p_trans_type IN VARCHAR2
)
RETURN BOOLEAN;

END INV_OPERATION_PACK;
/