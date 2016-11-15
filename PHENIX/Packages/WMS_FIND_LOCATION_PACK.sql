CREATE OR REPLACE PACKAGE phenix.WMS_FIND_LOCATION_PACK IS

--------------------------------------------------------------------------------

FUNCTION FIND_LOCATION_FUNC(
  p_prd_code              IN VARCHAR2,
  p_fmt_code              IN VARCHAR2,
  p_date                  IN DATE,
  p_qty_wgt               IN NUMBER,
  p_receipt_quantity      IN NUMBER,
  p_rth_id                IN VARCHAR2,
  p_ide_id                IN NUMBER,
  p_loc_code              OUT VARCHAR2,
  p_err_msg               OUT VARCHAR2,
  p_skip_loc_pick_switch  IN NUMBER,
  p_use_code              IN NUMBER,
  p_language              IN VARCHAR2 DEFAULT 'F'
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION CHECK_PICKING_LOC_FUNC(
  p_prd_code IN  VARCHAR2,
  p_fmt_code IN  VARCHAR2,
  p_date     IN  DATE,
  p_qty_wgt  IN  NUMBER,
  p_use_code IN  NUMBER,   --BER1427
  p_language IN  VARCHAR2, --GIC2912
  p_err_msg  OUT VARCHAR2, --CSC4540
  p_loc_code OUT VARCHAR2
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION CHECK_TPT_FUNC(
  p_prd_code         IN VARCHAR2,
  p_fmt_code         IN VARCHAR2,
  p_date             IN DATE,
  p_qty_wgt          IN NUMBER,
  p_receipt_quantity IN NUMBER,
  p_rth_id           IN VARCHAR2,
  p_use_code         IN NUMBER,   --BER1434
  p_loc_code         OUT VARCHAR2
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION CHECK_DRIVE_IN_LOC_FUNC(
  p_prd_code      IN  VARCHAR2,
  p_fmt_code      IN  VARCHAR2,
  p_date          IN  DATE,
  p_qty_wgt       IN  NUMBER,
  p_total_qty_wgt IN  NUMBER,
  p_rth_id        IN  VARCHAR2,
  p_use_code      IN  NUMBER,     --BER1434
  p_loc_code      OUT VARCHAR2
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION CHECK_OVERSTOCK_LOC_FUNC(
  p_prd_code      IN  VARCHAR2,
  p_fmt_code      IN  VARCHAR2,
  p_date          IN  DATE,
  p_qty_wgt       IN  NUMBER,
  p_loc_code      OUT VARCHAR2,
  p_err_msg       OUT VARCHAR2,
  p_use_code      IN  NUMBER   DEFAULT NULL,  --BER1425
  p_language      IN  VARCHAR2 DEFAULT 'F'    --GIC2912
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION FIND_LOC_FUNC(
  p_loc_code    IN VARCHAR2,
  p_loc_before  IN VARCHAR2,
  P_loc_after   IN VARCHAR2,
  p_nb_chr      IN NUMBER
)
RETURN VARCHAR2;

--------------------------------------------------------------------------------

FUNCTION VALID_SPACE_IN_LOC_FUNC(
  p_loc_code              IN  VARCHAR2,
  p_prd_code              IN  VARCHAR2,
  p_fmt_code              IN  VARCHAR2,
  p_qty_wgt               IN  NUMBER,
  p_language_flag         IN  VARCHAR2,   -- "F" pour Français ou "E" pour English
  p_vocal_switch          IN  NUMBER,
  p_loc_is_valid_switch   OUT NUMBER,
  p_ccr_code              OUT NUMBER,
  p_ccr_message           OUT VARCHAR2
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION VALID_IDENT_DESTINATION_LOC(
  p_loc_code              IN  VARCHAR2,
  p_identifier            IN  NUMBER,
  p_language_flag         IN  VARCHAR2,   -- "F" pour Français ou "E" pour English
  p_vocal_switch          IN  NUMBER,
  p_ccr_code              OUT NUMBER,
  p_ccr_message           OUT VARCHAR2
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------


END WMS_FIND_LOCATION_PACK;
/