CREATE OR REPLACE PACKAGE phenix.USE_OPERATION_PACK IS

FUNCTION COUNT_USERS_IN_MODULE_FUNC(
  p_module_name  IN VARCHAR2,
  p_use_whs_code IN users.use_whs_code%TYPE
) RETURN NUMBER;

FUNCTION GET_USE_PRN_CODE_FUNC(
  p_use_code IN users.use_code%TYPE
) RETURN VARCHAR2;

PROCEDURE LOGIN_PROC (   p_phx_user IN USERS.use_login%type,
                         p_password IN USERS.use_password%type
);

FUNCTION GET_USE_CODE_FUNC (    p_use_login IN USERS.use_login%type
)
RETURN USERS.use_code%type;

FUNCTION CHECK_PHENIX_LOGIN_FUNC(
    p_encode_use_code     IN VARCHAR2
) RETURN users.use_code%TYPE;

FUNCTION FIND_USE_NAME_FUNC(
  p_use_code                 IN NUMBER,
  p_last_name_first_switch   IN NUMBER DEFAULT 1
)
RETURN VARCHAR2;

FUNCTION get_current_phenix_user_func
RETURN users.use_code%TYPE;

FUNCTION GET_LOGIN_FOR_VR_PASSWORD_FUNC(
  p_use_code     IN users.use_code%TYPE,
  p_use_password IN users.use_vr_password%TYPE
)
RETURN users.use_login%TYPE;

FUNCTION GET_USER_LOC_FUNC(
  p_use_code IN users.use_code%TYPE
)
RETURN locations.loc_code%TYPE;

FUNCTION GET_URGENCY_LOC_FUNC(
  p_use_code IN users.use_code%TYPE
)
RETURN warehouses.whs_transit_loc_code%TYPE;

FUNCTION CHECK_USE_LOGIN_FUNC (
  p_use_login IN users.use_login%TYPE,
  p_use_code  IN users.use_code%TYPE
) RETURN BOOLEAN;

PROCEDURE UPDATE_TABLE_EMAIL_PROC(
  p_email_bd  IN VARCHAR2,
  p_use_email IN VARCHAR2
);

PROCEDURE UPDATE_PASSWORD_PROC(
  p_use_login       IN users.use_login%TYPE,
  p_crypt_password  IN VARCHAR2
);

FUNCTION AUTHENTICATE_FUNC(
  p_use_login            IN  users.use_login%TYPE,
  p_use_password         IN  users.use_password%TYPE,
  p_ula_host_name        IN  user_login_attemps.ula_host_name%TYPE,
  p_ula_user_name        IN  user_login_attemps.ula_user_name%TYPE,
  p_ula_ip_address       IN  user_login_attemps.ula_ip_address%TYPE,
  p_login_attemps_number IN  NUMBER,
  p_user_during_attemps  IN  NUMBER,
  p_use_code             OUT users.use_code%TYPE,
  p_use_name             OUT VARCHAR2,
  p_use_whs_code         OUT users.use_whs_code%TYPE,
  p_use_language         OUT users.use_language%TYPE,
  p_use_sgr_code         OUT users.use_sgr_code%TYPE,
  p_use_wms_user_switch  OUT users.use_wms_user_switch%TYPE
)
RETURN BOOLEAN;

FUNCTION AUTHENTICATE_FUNC(
  p_application_id       IN  VARCHAR2,
  p_application_key      IN  VARCHAR2
)
RETURN users.use_code%TYPE;

FUNCTION NEED_TO_CHANGE_PASSWORD_FUNC(
  p_use_code     IN  users.use_code%TYPE,
  p_reason       OUT VARCHAR2,
  p_nb_days_left OUT NUMBER
)
RETURN BOOLEAN;

PROCEDURE SET_LAST_CONNECTION_DATE_PROC(
  p_use_code IN users.use_code%TYPE
);

FUNCTION IS_ADMINISTRATOR_FUNC(
  p_use_code IN users.use_code%TYPE
)
RETURN BOOLEAN;

FUNCTION KNOCK_FUNC(
  p_use_login               IN  users.use_login%TYPE
)
RETURN varchar2; -- Always 36 characters

FUNCTION LOCK_FUNC(
  p_use_code IN users.use_code%TYPE
)
RETURN BOOLEAN;

FUNCTION RELEASE_FUNC(
  p_use_code IN users.use_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE IS_LOCKED_PROC(
  p_use_code IN users.use_code%TYPE
);

FUNCTION AUTHORIZE_FUNC(
  p_use_login    IN users.use_login%TYPE,
  p_use_password IN users.use_password%TYPE,
  p_usr_rol_code IN user_roles.usr_rol_code%TYPE
)
RETURN NUMBER;

END USE_OPERATION_PACK;
/