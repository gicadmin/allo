CREATE OR REPLACE PACKAGE phenix.WMS_GENERAL_UPDATE_PACK IS

FUNCTION GET_SEQUENCE_NEXTVAL_FUNC(
  p_sequence_name    IN VARCHAR2,
  p_sequence_nextval OUT NOCOPY NUMBER
)
RETURN PLS_INTEGER;

FUNCTION UPDATE_ALTERNATE_FUNC(
  p_apc_code     IN VARCHAR2,
  p_apc_prd_code IN VARCHAR2
)
RETURN PLS_INTEGER;

FUNCTION GET_LOCATION_TYPE_FUNC(
  p_loc_code           IN VARCHAR2,
  p_lty_code           IN NUMBER,
  p_location_types_rec OUT NOCOPY location_types%ROWTYPE
)
RETURN PLS_INTEGER;

FUNCTION GET_PRODUCT_FUNC(
  p_rcd_pod_poh_id      IN NUMBER,
  p_rcd_pod_line_number IN NUMBER,
  p_prd_code            IN VARCHAR2,
  p_products_rec        OUT NOCOPY products%ROWTYPE
)
RETURN PLS_INTEGER;

FUNCTION GET_PRF_FUNC(
  p_prf_prd_code        IN VARCHAR2,
  p_prf_fmt_code        IN VARCHAR2,
  p_product_formats_rec OUT NOCOPY product_formats%ROWTYPE
)
RETURN PLS_INTEGER;

FUNCTION GET_FMT_FUNC(
  p_fmt_code    IN VARCHAR2,
  p_formats_rec OUT NOCOPY formats%ROWTYPE
)
RETURN PLS_INTEGER;

FUNCTION GET_VEN_FUNC(
  p_ven_code    IN NUMBER,
  p_vendors_rec OUT NOCOPY vendors%ROWTYPE
)
RETURN PLS_INTEGER;

FUNCTION GET_RECEIVED_WEIGHT_FUNC(
  p_rtd_prf_prd_code      IN VARCHAR2,
  p_rtd_prf_fmt_code      IN VARCHAR2,
  p_average_weight        IN NUMBER,
  p_product_rec           IN OUT NOCOPY products%ROWTYPE,
  p_product_formats_rec   IN OUT NOCOPY product_formats%ROWTYPE,
  p_formats_rec           IN OUT NOCOPY formats%ROWTYPE,
  p_rcd_received_quantity IN NUMBER,
  p_rcd_received_weight   OUT NOCOPY NUMBER
)
RETURN PLS_INTEGER;

FUNCTION UPDATE_INVENTORY_FUNC(
  p_inv_loc_code            IN VARCHAR2,
  p_inv_prf_prd_code        IN VARCHAR2,
  p_inv_prf_fmt_code        IN VARCHAR2,
  p_inv_quantity_on_hand    IN NUMBER,
  p_inv_weight_on_hand      IN NUMBER,
  p_inv_fifo_date           IN DATE,  -- GIC3396
  p_inv_expiry_date         IN DATE,  -- GIC3396
  p_inv_in_out_flag         IN CHAR,
  p_inv_last_count_date     IN DATE DEFAULT NULL,
  p_picking_switch          IN NUMBER DEFAULT 0,                    --CSC2799
  p_dest_loc                IN VARCHAR2 DEFAULT NULL, --CSC2799
  p_ident                   IN NUMBER DEFAULT NULL,  --CSC2799
  p_inv_trans_type          IN VARCHAR2 DEFAULT NULL --CSC3548
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

FUNCTION GET_INVENTORY_FUNC(
  p_inv_id           IN NUMBER,
  p_inv_prf_prd_code IN VARCHAR2,
  p_inv_prf_fmt_code IN VARCHAR2,
  p_inv_loc_code     IN VARCHAR2,
  p_inventories_rec  OUT NOCOPY inventories%ROWTYPE
)
RETURN PLS_INTEGER;

FUNCTION CHECK_LOC_RANGE_FUNC(
  p_loc_code           IN VARCHAR2,
  p_lty_first_location IN VARCHAR2,
  p_lty_last_location  IN VARCHAR2
)
RETURN SIGNTYPE;

FUNCTION CREATE_LOCATION_FUNC(
  p_loc_code      IN VARCHAR2,
  p_prd_code      IN VARCHAR2,
  p_fmt_code      IN VARCHAR2,
  p_use_code      IN NUMBER
)
RETURN PLS_INTEGER;

FUNCTION CREATE_LOCATION_FUNC(
  p_loc_code IN VARCHAR2,
  p_use_code IN NUMBER
)
RETURN PLS_INTEGER;

-- GIC1601 Valide si le code de localisation entré est valide
FUNCTION CHECK_LOC_CHARACTERS_FUNC(
  p_loc_code  IN  VARCHAR2
)
RETURN BOOLEAN;

FUNCTION VALIDATE_PRODUCT_FOR_LOC_FUNC(
  p_loc_code                  IN VARCHAR2,
  p_prf_prd_code              IN VARCHAR2,
  p_prf_fmt_code              IN VARCHAR2,
  p_is_valid                  OUT NOCOPY PLS_INTEGER,
  p_ccr_code                  OUT NUMBER, --cvi104
  p_validate_dedicated_switch IN NUMBER DEFAULT 1,
  p_use_code                  IN  NUMBER
)
RETURN PLS_INTEGER;

FUNCTION GENERATE_OIC_FUNC(
  p_cah_id IN NUMBER
)
RETURN PLS_INTEGER;

FUNCTION GET_PRD_EXPIRY_DATE_FUNC(
  p_prd_code        IN VARCHAR2,
  p_date_to_convert IN VARCHAR2,
  p_expiry_date     OUT NOCOPY DATE
)
RETURN PLS_INTEGER;

FUNCTION DELETE_ALTERNATE_FUNC(
  p_apc_code     IN VARCHAR2,
  p_apc_prd_code IN VARCHAR2
)
RETURN PLS_INTEGER;

FUNCTION DELETE_INVENTORY_FUNC(
  p_inv_loc_code     IN VARCHAR2,
  p_inv_prf_prd_code IN VARCHAR2,
  p_inv_prf_fmt_code IN VARCHAR2
)
RETURN PLS_INTEGER;

FUNCTION CREATE_INVENTORY_FUNC(
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

FUNCTION CALCULATE_AVAILABLE_FUNC(
  p_inv_loc_code     IN inventories.inv_loc_code%TYPE,
  p_inv_prf_prd_code IN inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code IN inventories.inv_prf_fmt_code%TYPE,
  p_prd_definition   IN products.prd_definition%TYPE,
  p_mission_switch   IN NUMBER DEFAULT 0  --CSC3985
) RETURN NUMBER;

FUNCTION CALCULATE_FILL_FUNC(
  p_inv_loc_code       IN VARCHAR2,
  p_inv_prf_prd_code   IN VARCHAR2,
  p_prd_definition     IN OUT NOCOPY VARCHAR2,
  p_qty_wgt_max        OUT NOCOPY NUMBER,
  p_biggest_fmt_in_loc OUT NOCOPY VARCHAR2
)
RETURN PLS_INTEGER;

--GIC1796 fonction qui retourne le code de localisation selon le format défini dans les types de localisation
FUNCTION GET_LOC_CODE_WITH_MASK_FUNC(
  p_loc_code IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION SET_LOC_LAST_COUNT_DATE_FUNC(
  p_loc_code IN VARCHAR2
)
RETURN PLS_INTEGER;

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fonction utilisée pour supprimer une ligne d'inventaire lorsque toutes les quantités sont à 0 et que la localisation n'est pas dédiée            --
------------------------------------------------------------------------------------------------------------------------------------------------------
FUNCTION DELETE_EMPTY_INV_FUNC(
  p_loc_code  IN  VARCHAR2,
  p_prd_code  IN  VARCHAR2,
  p_fmt_code  IN  VARCHAR2
)
RETURN PLS_INTEGER;

------------------------------------------------------------------------------------------------------------------------------------------------------
--  Fonction utilisée pour mettre à jour la quantité ou le poids minimum et maximum pour une ligne d'inventaire                                     --
------------------------------------------------------------------------------------------------------------------------------------------------------
FUNCTION SET_LOC_MIN_MAX_FUNC(
  p_inv_id                      IN  NUMBER,
  p_inv_quantity_or_weight_min  IN  NUMBER,
  p_inv_quantity_or_weight_max  IN  NUMBER
)
RETURN PLS_INTEGER;

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fonction qui met à jour la palettisation d'un produit
------------------------------------------------------------------------------------------------------------------------------------------------------
FUNCTION SET_PALLET_PATTERN_FUNC(
  p_prd_code                IN  VARCHAR2,
  p_prw_items_per_pallet    IN  NUMBER,
  p_prw_items_per_row       IN  NUMBER,
  p_use_code                IN  NUMBER,   --ber1460
  p_vocal_switch            IN  NUMBER,
  p_language_flag           IN  VARCHAR2,
  p_ccr_code                OUT NUMBER,
  p_ccr_message             OUT VARCHAR2
)
RETURN PLS_INTEGER;

END WMS_GENERAL_UPDATE_PACK;
/