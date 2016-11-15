CREATE OR REPLACE PACKAGE phenix.PMO_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pallet_models%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pmo_code                       IN         pallet_models.pmo_code%TYPE,
  p_pmo_rec                        OUT NOCOPY pallet_models%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pmo_code                       IN         pallet_models.pmo_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pmo_code                       IN         pallet_models.pmo_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pmo_code                       IN         pallet_models.pmo_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pmo_code                       IN         pallet_models.pmo_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pmo_code                       IN         pallet_models.pmo_code%TYPE);


PROCEDURE INSERT_PROC(
  p_pmo_code                      IN         pallet_models.pmo_code%TYPE,
  p_pmo_description               IN         pallet_models.pmo_description%TYPE,
  p_pmo_tolerance_max_vol_percen  IN         pallet_models.pmo_tolerance_max_vol_percent%TYPE,
  p_pmo_pallet_method             IN         pallet_models.pmo_pallet_method%TYPE,
  p_pmo_alt_description           IN         pallet_models.pmo_alt_description%TYPE                DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY pallet_models%ROWTYPE);

END PMO_PACK;
/