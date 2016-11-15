CREATE OR REPLACE PACKAGE phenix.PWID_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  public_whse_identifiers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pwid_identifier                IN         public_whse_identifiers.pwid_identifier%TYPE,
  p_pwid_rec                       OUT NOCOPY public_whse_identifiers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pwid_identifier                IN         public_whse_identifiers.pwid_identifier%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pwid_identifier                IN         public_whse_identifiers.pwid_identifier%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pwid_identifier                IN         public_whse_identifiers.pwid_identifier%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pwid_identifier                IN         public_whse_identifiers.pwid_identifier%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pwid_identifier                IN         public_whse_identifiers.pwid_identifier%TYPE);

FUNCTION GET_FULL_FUNC(
  p_pwid_id                        IN         public_whse_identifiers.pwid_id%TYPE,
  p_pwid_rec                       OUT NOCOPY public_whse_identifiers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pwid_id                        IN         public_whse_identifiers.pwid_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pwid_id                        IN         public_whse_identifiers.pwid_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pwid_id                        IN         public_whse_identifiers.pwid_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pwid_id                        IN         public_whse_identifiers.pwid_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pwid_id                        IN         public_whse_identifiers.pwid_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pwid_pwrd_id            IN         public_whse_identifiers.pwid_pwrd_id%TYPE,
  p_pwid_identifier         IN         public_whse_identifiers.pwid_identifier%TYPE,
  p_pwid_loc_code           IN         public_whse_identifiers.pwid_loc_code%TYPE,
  p_pwid_quantity           IN         public_whse_identifiers.pwid_quantity%TYPE,
  p_pwid_use_reception_code IN         public_whse_identifiers.pwid_use_reception_code%TYPE,
  p_pwid_reception_date     IN         public_whse_identifiers.pwid_reception_date%TYPE,
  p_pwid_lot_code           IN         public_whse_identifiers.pwid_lot_code%TYPE                DEFAULT NULL,
  p_pwid_expiry_date        IN         public_whse_identifiers.pwid_expiry_date%TYPE             DEFAULT NULL,
  p_pwid_pwpd_id            IN         public_whse_identifiers.pwid_pwpd_id%TYPE                 DEFAULT NULL,
  p_pwid_pick_date          IN         public_whse_identifiers.pwid_pick_date%TYPE               DEFAULT NULL,
  p_pwid_use_pick_code      IN         public_whse_identifiers.pwid_use_pick_code%TYPE           DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY public_whse_identifiers%ROWTYPE)
RETURN NUMBER;

END PWID_PACK;
/