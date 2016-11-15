CREATE OR REPLACE PACKAGE phenix.DSC_PACK IS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  dock_sharing_codes%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_dsc_code                       IN         dock_sharing_codes.dsc_code%TYPE,
  p_dsc_rec                        OUT NOCOPY dock_sharing_codes%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dsc_code                       IN         dock_sharing_codes.dsc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_dsc_code                       IN         dock_sharing_codes.dsc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_dsc_code                       IN         dock_sharing_codes.dsc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_dsc_code                       IN         dock_sharing_codes.dsc_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dsc_code                       IN         dock_sharing_codes.dsc_code%TYPE);


PROCEDURE INSERT_PROC(
  p_dsc_code             IN         dock_sharing_codes.dsc_code%TYPE,
  p_dsc_description      IN         dock_sharing_codes.dsc_description%TYPE,
  p_dsc_alt_description  IN         dock_sharing_codes.dsc_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY dock_sharing_codes%ROWTYPE);

END DSC_PACK;
/