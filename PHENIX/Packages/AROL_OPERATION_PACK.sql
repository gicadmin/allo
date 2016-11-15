CREATE OR REPLACE PACKAGE phenix.arol_operation_pack AS

  PROCEDURE attach_to_parent_proc(
    p_arol_id                 IN          application_roles.arol_id%TYPE,
    p_parent_arol_id          IN          application_roles.arol_id%TYPE );

  FUNCTION CREATE_ROLE_FUNC(
    p_upro_id                 IN          user_profiles.upro_id%TYPE,
    p_arol_name               IN          multi_lang_messages.mlm_message%TYPE,
    p_arol_name_en            IN          multi_lang_messages.mlm_message%TYPE,
    p_arol_read_only          IN          application_roles.arol_read_only%TYPE default 0,
    p_arol_status             IN          application_roles.arol_status%TYPE default 'ACTIVE')
  RETURN application_roles.arol_id%TYPE;

  PROCEDURE MODIFY_ROLE_PROC(
    p_arol_id                 IN          application_roles.arol_id%TYPE,
    p_arol_name               IN          multi_lang_messages.mlm_message%TYPE,
    p_arol_name_en            IN          multi_lang_messages.mlm_message%TYPE
    );

  PROCEDURE DELETE_PROC(
    p_upro_id                 IN          user_profiles.upro_id%TYPE,
    p_arol_id                 IN          application_roles.arol_id%TYPE
    );

  PROCEDURE TOUCH_PROC(
    p_arol_id                 IN          application_roles.arol_id%TYPE
    );

END;
/