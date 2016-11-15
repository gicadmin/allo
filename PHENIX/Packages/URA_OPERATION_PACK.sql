CREATE OR REPLACE PACKAGE phenix.URA_OPERATION_PACK IS

PROCEDURE KNOCK_KNOCK_PROC(
  p_use_login       IN users.use_login%TYPE,
  p_passcode        IN varchar2 -- 36 characters exactly
);

function whos_there_func(
  p_application_id  IN  varchar2,
  p_encrypted_key   IN  varchar2)
  return USER_REMOTE_APPLICATIONS.URA_USE_CODE%TYPE;

END URA_OPERATION_PACK;
/