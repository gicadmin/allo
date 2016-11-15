CREATE OR REPLACE PACKAGE phenix.USR_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  user_roles%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_usr_use_code                   IN         user_roles.usr_use_code%TYPE,
  p_usr_rol_code                   IN         user_roles.usr_rol_code%TYPE,
  p_usr_rec                        OUT NOCOPY user_roles%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_usr_use_code                   IN         user_roles.usr_use_code%TYPE,
  p_usr_rol_code                   IN         user_roles.usr_rol_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_usr_use_code                   IN         user_roles.usr_use_code%TYPE,
  p_usr_rol_code                   IN         user_roles.usr_rol_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_usr_use_code                   IN         user_roles.usr_use_code%TYPE,
  p_usr_rol_code                   IN         user_roles.usr_rol_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_usr_use_code                   IN         user_roles.usr_use_code%TYPE,
  p_usr_rol_code                   IN         user_roles.usr_rol_code%TYPE);


PROCEDURE INSERT_PROC(
  p_usr_use_code         IN         user_roles.usr_use_code%TYPE,
  p_usr_rol_code         IN         user_roles.usr_rol_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY user_roles%ROWTYPE);

END USR_PACK;
/