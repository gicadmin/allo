CREATE OR REPLACE PACKAGE phenix.PCI_MANAGEMENT_PACK IS

  PROCEDURE SET_IDENTIFIER_PROC(
    p_login                     IN          application_users.ause_login%TYPE
  );

  PROCEDURE SET_IDENTIFIER_PROC(
    p_ause_id                   IN          application_users.ause_id%TYPE
  );

  PROCEDURE RESET_IDENTIFIER_PROC;

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

  PROCEDURE change_user_status_proc(
    p_username                IN          application_users.ause_login%TYPE,
    p_status                  IN          application_users.ause_status%TYPE);

  PROCEDURE unlock_user_proc(
    p_username                IN          application_users.ause_login%TYPE);

  PROCEDURE delete_user_proc(
    p_username                IN          application_users.ause_login%TYPE);

  PROCEDURE modify_user_proc(
    p_ause_id                 IN          application_users.ause_id%TYPE,
    p_ause_login              IN          application_users.ause_login%TYPE,
    p_ause_first_name         IN          application_users.ause_first_name%TYPE,
    p_ause_last_name          IN          application_users.ause_last_name%TYPE,
    p_ause_email              IN          application_users.ause_email%TYPE);

  FUNCTION create_role_func(
    p_upro_id                 IN          user_profiles.upro_id%TYPE,
    p_arol_name               IN          multi_lang_messages.mlm_message%TYPE,
    p_arol_name_en            IN          multi_lang_messages.mlm_message%TYPE,
    p_arol_status             IN          application_roles.arol_status%TYPE default 'ACTIVE')
  RETURN application_roles.arol_id%TYPE;

  FUNCTION create_profile_func(
    p_ause_id                 IN          application_users.ause_id%TYPE,
    p_cus_code                IN          user_profiles.upro_cus_code%TYPE,
    p_ven_code                IN          user_profiles.upro_cus_code%TYPE)
  RETURN user_profiles.upro_id%TYPE;

  PROCEDURE modify_role_proc(
    p_arol_id                 IN          application_roles.arol_id%TYPE,
    p_arol_name               IN          multi_lang_messages.mlm_message%TYPE,
    p_arol_name_en            IN          multi_lang_messages.mlm_message%TYPE
    );

  PROCEDURE ATTACH_ROLE_TO_USER_PROC(
    p_upro_id                 IN          user_profiles.upro_id%TYPE,
    p_arol_id                 IN          application_roles.arol_id%TYPE
    );

  PROCEDURE ATTACH_ROLE_TO_ROLE_PROC(
    p_arol_id                 IN          application_roles.arol_id%TYPE,
    p_parent_arol_id          IN          application_roles.arol_id%TYPE
    );

  PROCEDURE DETACH_ALL_ROLE_PROC(
    p_upro_id                 IN          user_profiles.upro_id%TYPE
    );

  PROCEDURE ATTACH_FEATURE_PROC(
    p_arol_id                 IN          application_roles.arol_id%TYPE,
    p_afea_id                 IN          application_features.afea_id%TYPE
    );

  PROCEDURE DETACH_ALL_FEATURE_PROC(
    p_arol_id                 IN          application_roles.arol_id%TYPE
    );

  PROCEDURE DELETE_ROLE_PROC(
    p_upro_id                 IN          user_profiles.upro_id%TYPE,
    p_arol_id                 IN          application_roles.arol_id%TYPE
    );

  PROCEDURE DELETE_PROFILE_PROC(
    p_upro_id                 IN          user_profiles.upro_id%TYPE
    );

  FUNCTION CREATE_APPL_MESSAGE_FUNC(
    p_start_date              IN          application_messages.AMES_START_DATE%TYPE,
    p_end_date                IN          application_messages.AMES_END_DATE%TYPE,
    p_status                  IN          application_messages.AMES_STATUS%TYPE,
    p_type                    IN          application_messages.ames_type%TYPE,
    p_mess_text               IN          multi_lang_messages.MLM_MESSAGE%TYPE,
    p_mess_text_en            IN          multi_lang_messages.MLM_MESSAGE%TYPE)
   return application_messages.AMES_ID%TYPE;

  PROCEDURE delete_appl_message_proc(
    p_ames_id                 IN          application_messages.AMES_ID%TYPE);

  PROCEDURE change_message_status_proc(
    p_ames_id                 IN          application_messages.AMES_ID%TYPE,
    p_status                  IN          application_messages.AMES_STATUS%TYPE);

  PROCEDURE modify_message_proc(
    p_ames_id                 IN          application_messages.ames_id%TYPE,
    p_start_date              IN          application_messages.AMES_START_DATE%TYPE,
    p_end_date                IN          application_messages.AMES_END_DATE%TYPE,
    p_type                    IN          application_messages.ames_type%TYPE,
    p_mess_text               IN          multi_lang_messages.MLM_MESSAGE%TYPE,
    p_mess_text_en            IN          multi_lang_messages.MLM_MESSAGE%TYPE
    );

  FUNCTION GET_FULL_MESSAGE_FUNC(
    p_sqlerrm                   VARCHAR2,
    p_code_lang                 VARCHAR2)
    RETURN VARCHAR2;

  FUNCTION GET_MESSAGE_FUNC(
    p_sqlerrm                   VARCHAR2,
    p_code_lang                 VARCHAR2)
    RETURN VARCHAR2;

  FUNCTION GET_ERROR_NUMBER_FUNC(
    p_sqlerrm                   VARCHAR2)
    RETURN NUMBER;

  FUNCTION GET_ERROR_CODE_FUNC(
    p_sqlerrm                   VARCHAR2)
    RETURN VARCHAR2;

  FUNCTION CHECK_SPJ_NAME_CONTEXT_FUNC(
    p_spj_name    IN system_projects.spj_name%TYPE,
    p_spj_context IN system_projects.spj_context%TYPE
  )
  RETURN NUMBER;

  FUNCTION GET_CONF_BY_NAME_CONTEXT_FUNC(
    p_spj_name    IN system_projects.spj_name%TYPE,
    p_spj_context IN system_projects.spj_context%TYPE
  )
  RETURN SYS_REFCURSOR;

  FUNCTION DECRYPT_FUNC(
    p_password IN VARCHAR2
  )
  RETURN VARCHAR2;

END PCI_MANAGEMENT_PACK;
/