CREATE OR REPLACE PACKAGE phenix.LOC_OPERATION_PACK IS

FUNCTION CHECK_LOC_RANGE_FUNC(
  p_loc_code           IN VARCHAR2,
  p_lty_first_location IN VARCHAR2,
  p_lty_last_location  IN VARCHAR2
)
RETURN SIGNTYPE;

--insertion d'une loc en validant quelle peut bien aller dans la zone dentreposage voulu
FUNCTION CREATE_LOCATION_FOR_PRD_FUNC(
  p_loc_code    IN VARCHAR2,
  p_prd_code    IN VARCHAR2,
  p_use_code    IN NUMBER       --BER1427
)
RETURN PLS_INTEGER;

--création de loc sans valider de produit ou zone d'entreposage etc
FUNCTION CREATE_LOCATION_FUNC(
  p_loc_code  IN VARCHAR2,
  p_use_code  IN NUMBER
)
RETURN PLS_INTEGER;

FUNCTION GET_NEXT_VALID_COUNT_LOC_FUNC(
  p_loc_code            IN VARCHAR2,
  p_next_count_loc_code OUT NOCOPY VARCHAR2,
  p_loc_lty_code        IN NUMBER DEFAULT NULL
)
RETURN PLS_INTEGER;

FUNCTION GET_NEXT_VALID_PRD_LOC_FUNC(
  p_prd_code                  IN          VARCHAR2,
  p_fmt_short_code            IN          VARCHAR2,
  p_loc_code                  IN          VARCHAR2,  --GIC1626
  p_use_code                  IN          NUMBER,   --ber1460
  p_next_valid_prd_loc_code   OUT NOCOPY  VARCHAR2, --GIC1626
  p_next_valid_fmt_code       OUT NOCOPY  VARCHAR2 --GIC1626
)
RETURN PLS_INTEGER;

FUNCTION GET_NEXT_VALID_DATE_LOC_FUNC( --GIC1797
  p_loc_code      IN VARCHAR2,
  p_next_loc_code OUT NOCOPY VARCHAR2
)
RETURN PLS_INTEGER;

FUNCTION VALIDATE_PRODUCT_FOR_LOC_FUNC(
  p_loc_code                  IN  VARCHAR2,
  p_prf_prd_code              IN  VARCHAR2,
  p_prf_fmt_code              IN  VARCHAR2,
  p_is_valid                  OUT NOCOPY PLS_INTEGER,
  p_ccr_code                  OUT NUMBER, --cvi104
  p_validate_dedicated_switch IN  NUMBER DEFAULT 1,
  p_use_code                  IN  NUMBER      --BER1434
)
RETURN PLS_INTEGER;

--GIC1796 fonction qui retourne le code de localisation selon le format défini dans les types de localisation
FUNCTION GET_LOC_CODE_WITH_MASK_FUNC(
  p_loc_code   IN VARCHAR2,
  p_use_alias  IN NUMBER DEFAULT 0
)
RETURN VARCHAR2;

FUNCTION SET_LOC_LAST_COUNT_DATE_FUNC(
  p_loc_code IN VARCHAR2
)
RETURN PLS_INTEGER;

--Fonction qui retourne la prochaine localisation vide pour un décompte                                                                                                       -
FUNCTION GET_NEXT_EMPTY_LOC_FUNC(
  p_loc_code            IN VARCHAR2,
  p_current_loc_switch  IN NUMBER,
  p_next_empty_loc_code OUT NOCOPY VARCHAR2
)
RETURN PLS_INTEGER;

FUNCTION GET_LOCATION_PART_FUNC(
  p_loc_code            IN    LOCATIONS.LOC_CODE%TYPE,
  p_part_code           IN    VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GEN_VALIDATION_CODE_FUNC(
  p_loc_code            IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION VAL_LOCATION_CODE_FUNC(
  p_loc_code            IN  VARCHAR2,
  p_validation_code     IN  VARCHAR2
)
RETURN BOOLEAN;

FUNCTION GET_NEXT_ALLEY_LEVEL_LOC_FUNC(
  p_loc_code    IN locations.loc_code%TYPE,
  p_language    IN  VARCHAR2,
  p_ccr_code    OUT error_codes.ccr_code%TYPE,
  p_ccr_message OUT error_codes.ccr_message%TYPE
)
RETURN locations.loc_code%TYPE;

PROCEDURE GET_ALL_PART_LOC_CODE_PROC(
  p_loc_code      IN locations.loc_code%TYPE,
  p_zone_part     OUT locations.loc_code%TYPE,
  p_alley_part    OUT locations.loc_code%TYPE,
  p_bay_part      OUT locations.loc_code%TYPE,
  p_level_part    OUT locations.loc_code%TYPE,
  p_position_part OUT locations.loc_code%TYPE,
  p_depth_part    OUT locations.loc_code%TYPE,
  p_rec_lty       IN location_types%ROWTYPE DEFAULT NULL
);

PROCEDURE FIND_LOC_WHS_AND_PICKING_PROC(
  p_loc_code        IN locations.loc_code%TYPE,
  p_whs_code        OUT location_types.lty_whs_code%TYPE,
  p_picking_switch  OUT location_types.lty_picking_switch%TYPE
);

FUNCTION GET_USE_WHS_FOR_LOC_CODE_FUNC(
  p_loc_code IN locations.loc_code%TYPE
)
RETURN VARCHAR2;

FUNCTION CREATE_LOCATION_FOR_USER_FUNC(
  p_use_code     IN users.use_code%TYPE,
  p_use_whs_code IN users.use_whs_code%TYPE
)
RETURN BOOLEAN;
------------------------------------------
FUNCTION INV_PICKING_LOC_FUNC(
p_prf_prd_code	  IN product_formats.prf_prd_code%TYPE,
p_prf_fmt_code    IN product_formats.prf_fmt_code%TYPE,
p_lty_whs_code    IN location_types.lty_whs_code%TYPE)
RETURN VARCHAR2;

PROCEDURE SET_LOCATION_PROC(
  p_tlt_loc_code             IN temporary_location_tickets.tlt_loc_code%TYPE,
  p_tlt_loc_validation_code  IN temporary_location_tickets.tlt_loc_validation_code%TYPE,
  p_tlt_direction_up_switch  IN temporary_location_tickets.tlt_direction_up_switch%TYPE,
  p_tlt_pof_code             IN temporary_location_tickets.tlt_pof_code%TYPE,
  p_tlt_rac_code             IN temporary_location_tickets.tlt_rac_code%TYPE
);

PROCEDURE CREATE_LOCATIONS_PROC(
  p_loc_code      IN  LOCATIONS.LOC_CODE%TYPE,
  p_use_code      IN users.use_code%TYPE,
  p_new_loc_cnt   IN OUT NUMBER
);

PROCEDURE CHECK_LOC_RANGE_PROC(
  p_lty_first_location   IN location_types.lty_first_location%TYPE,
  p_lty_last_location    IN location_types.lty_last_location%TYPE
);

PROCEDURE GET_NEXT_LOCATION_FUNC(
  p_previous_location         IN VARCHAR2,
  p_lty_first_location        IN location_types.lty_first_location%TYPE,
  p_lty_last_location         IN location_types.lty_last_location%TYPE,
  p_show_exist_location_only  IN NUMBER,
  p_use_code                  IN users.use_code%TYPE,
  p_whs_code                  IN warehouses.whs_code%TYPE,
  p_genere_code_validation    IN NUMBER,
  p_new_loc_cnt               IN OUT NUMBER,
  p_position                  IN NUMBER,
  p_length                    IN NUMBER
);

PROCEDURE GENERATE_TEMP_LOCATIONS_PROC(
  p_lty_first_location        IN location_types.lty_first_location%TYPE,
  p_lty_last_location         IN location_types.lty_last_location%TYPE,
  p_show_exist_location_only  IN NUMBER,
  p_use_code                  IN users.use_code%TYPE,
  p_whs_code                  IN warehouses.whs_code%TYPE,
  p_genere_code_validation    IN NUMBER,
  p_new_loc_cnt               IN OUT NUMBER
);

FUNCTION LOCK_LOC_FUNC(
  p_loc_code  IN  locations.loc_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE SET_RAC_CODE_PROC(
  p_ploc_zone_from   IN  VARCHAR2,
  p_ploc_allee_from  IN  VARCHAR2,
  p_ploc_bay_from    IN  VARCHAR2,
  p_ploc_level_from  IN  VARCHAR2,
  p_ploc_zone_to     IN  VARCHAR2,
  p_ploc_allee_to    IN  VARCHAR2,
  p_ploc_bay_to      IN  VARCHAR2,
  p_ploc_level_to    IN  VARCHAR2,
  p_ploc_rac_code    IN  VARCHAR2,
  p_loc_order        IN  VARCHAR2,
  p_number_updated   OUT NUMBER,
  p_number_locked    OUT NUMBER

);

FUNCTION HAS_LOCATION_CODE_EXIST_FUNC(
  p_loc_code              IN locations.loc_code%TYPE,
  p_loc_validataion_code  IN locations.loc_validation_code%TYPE
) RETURN BOOLEAN;

FUNCTION GET_PART_LOC_CODE_FUNC(
  p_loc_code  IN locations.loc_code%TYPE,
  p_type      IN NUMBER
) RETURN locations.loc_code%TYPE ;

--csc9049
FUNCTION IS_PUBLIC_WHSE_LOC_FUNC(
  p_loc_code IN locations.loc_code%type
) RETURN BOOLEAN;

FUNCTION GET_LOC_OR_ALT_FUNC(
  p_loc_code IN VARCHAR2
)
RETURN VARCHAR2;

END LOC_OPERATION_PACK;
/