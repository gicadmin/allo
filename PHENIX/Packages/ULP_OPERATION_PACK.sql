CREATE OR REPLACE PACKAGE phenix.ULP_OPERATION_PACK IS

PROCEDURE VALIDATE_USED_PASSWORD_PROC(
  p_use_code          IN users.use_code%TYPE,
  p_password    IN VARCHAR2,
  p_password_used     OUT BOOLEAN,
  p_ulp_id_to_delete  OUT user_last_passwords.ulp_id%TYPE
) ;

PROCEDURE DELETE_ULP_PROC(
  p_ulp_id        IN user_last_passwords.ulp_id%TYPE,
  p_ulp_use_code  IN user_last_passwords.ulp_use_code%TYPE
);

PROCEDURE CHANGE_PASSWORD_PROC(
  p_use_code          IN users.use_code%TYPE,
  p_password          IN VARCHAR2,
  p_use_login         IN users.use_login%TYPE,
  p_ulp_id_to_delete  IN NUMBER
);

FUNCTION GET_LAST_PASSWORD_FUNC(
  p_use_code IN         users.use_code%TYPE,
  p_ulp_rec  OUT NOCOPY user_last_passwords%ROWTYPE
)
RETURN BOOLEAN;

END ULP_OPERATION_PACK;
/