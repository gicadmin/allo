CREATE OR REPLACE PACKAGE phenix.ULA_OPERATION_PACK AS

FUNCTION COUNT_FUNC(
  p_ula_station IN user_login_attemps.ula_station%TYPE
)
RETURN NUMBER;

FUNCTION COUNT_FUNC(
  p_ula_use_code IN user_login_attemps.ula_use_code%TYPE
)
RETURN NUMBER;

FUNCTION COUNT_USER_LOCKED_FUNC(
  p_ula_station IN user_login_attemps.ula_station%TYPE
)
RETURN NUMBER;

FUNCTION COUNT_USER_LOCKED_FUNC
RETURN NUMBER;

FUNCTION COUNT_STATION_LOCKED_FUNC
RETURN NUMBER;

PROCEDURE LOCK_PROC(
  p_ula_use_code IN user_login_attemps.ula_use_code%TYPE
);

PROCEDURE LOCK_PROC(
  p_ula_station IN user_login_attemps.ula_station%TYPE
);

PROCEDURE LOCK_STATION_BY_USER_PROC(
  p_ula_station         IN user_login_attemps.ula_station%TYPE,
  p_ula_host_name       IN user_login_attemps.ula_host_name%TYPE,
  p_ula_user_name       IN user_login_attemps.ula_user_name%TYPE,
  p_ula_ip_address      IN user_login_attemps.ula_ip_address%TYPE,
  p_user_during_attemps IN  NUMBER
);

PROCEDURE DELETE_PROC(
  p_ula_station  IN user_login_attemps.ula_station%TYPE,
  p_ula_use_code IN user_login_attemps.ula_use_code%TYPE
);

PROCEDURE UNLOCK_STATION_PROC(
  p_ula_station IN user_login_attemps.ula_station%TYPE
);

PROCEDURE UNLOCK_USER_PROC(
  p_ula_use_code IN user_login_attemps.ula_use_code%TYPE
);

PROCEDURE INSERT_PROC(
  p_ula_station    IN user_login_attemps.ula_station%TYPE,
  p_ula_use_code   IN user_login_attemps.ula_use_code%TYPE,
  p_ula_host_name  IN user_login_attemps.ula_host_name%TYPE,
  p_ula_user_name  IN user_login_attemps.ula_user_name%TYPE,
  p_ula_ip_address IN user_login_attemps.ula_ip_address%TYPE,
  p_ula_login      IN user_login_attemps.ula_login%TYPE,
  p_ula_confirmed  IN user_login_attemps.ula_confirmed%TYPE DEFAULT 'N'
);

FUNCTION IS_LOCKED_FUNC(
  p_ula_station IN user_login_attemps.ula_station%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_LOCKED_FUNC(
  p_use_login IN users.use_login%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_LOCKED_FUNC(
  p_ula_station IN user_login_attemps.ula_station%TYPE,
  p_use_login   IN users.use_login%TYPE
)
RETURN BOOLEAN;

END ULA_OPERATION_PACK;
/