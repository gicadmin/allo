CREATE OR REPLACE PACKAGE phenix.ROL_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  roles%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rol_code                       IN         roles.rol_code%TYPE,
  p_rol_rec                        OUT NOCOPY roles%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rol_code                       IN         roles.rol_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_rol_code                       IN         roles.rol_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rol_code                       IN         roles.rol_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rol_code                       IN         roles.rol_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rol_code             IN         roles.rol_code%TYPE,
  p_rol_description      IN         roles.rol_description%TYPE,
  p_rol_alt_description  IN         roles.rol_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY roles%ROWTYPE);

END ROL_PACK;
/