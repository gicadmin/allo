CREATE OR REPLACE PACKAGE phenix.UPR_PACK IS

----------------------------------------------------------------------------------------------------
FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  user_program_roles%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_upr_id                         IN         user_program_roles.upr_id%TYPE,
  p_upr_rec                        OUT NOCOPY user_program_roles%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_upr_id                         IN         user_program_roles.upr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_upr_id                         IN         user_program_roles.upr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_upr_id                         IN         user_program_roles.upr_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_upr_id                         IN         user_program_roles.upr_id%TYPE);


FUNCTION INSERT_FUNC(
  p_upr_role_code        IN         user_program_roles.upr_role_code%TYPE,
  p_upr_pro_id           IN         user_program_roles.upr_pro_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY user_program_roles%ROWTYPE)
RETURN NUMBER;










----------------------------Ancien code ------------------------------------------------------------
--Fonction qui retourne la prochaine séquence de la table USER_PROGRAM_ROLES
FUNCTION GET_UPR_ID_FUNC
RETURN NUMBER;

----------------------------------------------------------------------------------------------------
--Procédure qui insère un enregistrement dans la table USER_PROGRAM_ROLES
PROCEDURE INSERT_UPR_PROC(
	p_upr_id        IN user_program_roles.upr_id%TYPE,
	p_upr_role_code IN user_program_roles.upr_role_code%TYPE,
	p_upr_pro_id    IN user_program_roles.upr_pro_id%TYPE
);

----------------------------------------------------------------------------------------------------
--Procédure qui supprime un enregistrement de la table USER_PROGRAM_ROLES
PROCEDURE DELETE_UPR_PROC(
	p_upr_id        IN user_program_roles.upr_id%TYPE,
	p_upr_role_code IN user_program_roles.upr_role_code%TYPE,
	p_upr_pro_id    IN user_program_roles.upr_pro_id%TYPE
);

END UPR_PACK;
/