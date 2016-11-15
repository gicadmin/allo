CREATE OR REPLACE PACKAGE phenix.SLE_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  system_license_exceptions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sle_use_code                   IN         system_license_exceptions.sle_use_code%TYPE,
  p_sle_rec                        OUT NOCOPY system_license_exceptions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sle_use_code                   IN         system_license_exceptions.sle_use_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_sle_use_code                   IN         system_license_exceptions.sle_use_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sle_use_code                   IN         system_license_exceptions.sle_use_code%TYPE);


PROCEDURE INSERT_PROC(
  p_sle_use_code         IN         system_license_exceptions.sle_use_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY system_license_exceptions%ROWTYPE);

END SLE_PACK;
/