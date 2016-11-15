CREATE OR REPLACE PACKAGE phenix.SLAU_OPERATION_PACK IS

PROCEDURE AUDIT_LOGIN_PROC(
  p_slau_status                 IN         security_login_audits.slau_status%TYPE,
  p_slau_ause_login             IN         security_login_audits.slau_ause_login%TYPE                  DEFAULT NULL,
  p_slau_connection_information IN         security_login_audits.slau_connection_information%TYPE      DEFAULT NULL);

END SLAU_OPERATION_PACK;
/