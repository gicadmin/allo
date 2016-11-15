CREATE OR REPLACE PACKAGE phenix.LTY_OPERATION_PACK IS

-- GIC1601 Retourne le type de localisation pour le code de localisation envoyé en paramètre
FUNCTION FIND_LOCATION_TYPE_FUNC(
  p_loc_code     IN VARCHAR2,
  p_lty_whs_code IN location_types.lty_whs_code%TYPE DEFAULT NULL
)
RETURN NUMBER;

FUNCTION GET_NUMBER_COLUMN_BY_LOC_FUNC(
  p_loc_code     IN  locations.loc_code%TYPE,
  p_column_name  IN  VARCHAR2,
  p_raise        IN  BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_BY_LOC_FUNC(
  p_loc_code     IN  locations.loc_code%TYPE,
  p_column_name  IN  VARCHAR2,
  p_raise        IN  BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_FULL_BY_LOC_FUNC(
  p_loc_code  IN         locations.loc_code%TYPE,
  p_lty_rec   OUT NOCOPY location_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_loc_code         IN  locations.loc_code%TYPE,
  p_column_name      IN  VARCHAR2,
  p_alt_column_name  IN  VARCHAR2,
  p_language         IN  VARCHAR2 DEFAULT 'F',
  p_raise            IN  BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

END LTY_OPERATION_PACK;
/