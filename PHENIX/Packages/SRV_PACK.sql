CREATE OR REPLACE PACKAGE phenix.SRV_PACK AS

PROCEDURE SET_IDENTIFIER_PROC(
  p_use_login IN users.use_login%TYPE
);

PROCEDURE OPEN_SESSION_PROC(
  p_use_code      IN  users.use_code%TYPE,
  p_use_password  IN  users.use_password%TYPE,
  p_use_login     OUT users.use_login%TYPE
);

PROCEDURE CLOSE_SESSION_PROC(
  p_use_code       IN  NUMBER,
  p_language_flag  IN  VARCHAR2,
  p_vocal_switch   IN  NUMBER,
  p_error_code     OUT NUMBER,
  p_error_message  OUT VARCHAR2
);

END SRV_PACK;
/