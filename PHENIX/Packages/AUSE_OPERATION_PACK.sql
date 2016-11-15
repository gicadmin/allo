CREATE OR REPLACE PACKAGE phenix.ause_operation_pack AS

  FUNCTION CREATE_USER_FUNC(
    p_ause_login              IN          application_users.ause_login%TYPE,
    p_ause_status             IN          application_users.ause_status%TYPE,
    p_ause_first_name         IN          application_users.ause_first_name%TYPE,
    p_ause_last_name          IN          application_users.ause_last_name%TYPE,
    p_ause_email              IN          application_users.ause_email%TYPE,
    p_ause_password           IN          application_users.ause_password%TYPE )
  RETURN user_profiles.upro_id%TYPE; -- retoure l'ID du profile par defaut de l'usager

  PROCEDURE change_password_proc(
    p_username                IN          application_users.ause_login%TYPE,
    p_old_password            IN          application_users.ause_password%TYPE,
    p_new_password            IN          application_users.ause_password%TYPE,
    p_connection_info         IN          security_login_audits.SLAU_CONNECTION_INFORMATION%TYPE         DEFAULT NULL);

  PROCEDURE valid_user_proc(
    p_username                IN          application_users.ause_login%TYPE,
    p_password                IN          application_users.ause_password%TYPE,
    p_connection_info         IN          security_login_audits.SLAU_CONNECTION_INFORMATION%TYPE         DEFAULT NULL);

  FUNCTION valid_user_func(
    p_username                IN          application_users.ause_login%TYPE,
    p_password                IN          application_users.ause_password%TYPE,
    p_connection_info         IN          security_login_audits.SLAU_CONNECTION_INFORMATION%TYPE         DEFAULT NULL)
    RETURN BOOLEAN;

  PROCEDURE change_status_proc(
    p_username                IN          application_users.ause_login%TYPE,
    p_status                  IN          application_users.ause_status%TYPE);

  PROCEDURE unlock_proc(
    p_username                IN          application_users.ause_login%TYPE);

  PROCEDURE delete_proc(
    p_username                IN          application_users.ause_login%TYPE);

  PROCEDURE MODIFY_USER_PROC(
    p_ause_id                 IN          application_users.ause_id%TYPE,
    p_ause_login              IN          application_users.ause_login%TYPE,
    p_ause_first_name         IN          application_users.ause_first_name%TYPE,
    p_ause_last_name          IN          application_users.ause_last_name%TYPE,
    p_ause_email              IN          application_users.ause_email%TYPE);

END;
/