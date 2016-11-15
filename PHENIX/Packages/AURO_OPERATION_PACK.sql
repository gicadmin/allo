CREATE OR REPLACE PACKAGE phenix.auro_operation_pack AS

  PROCEDURE parenting_proc(
    p_arol_id                 IN          application_roles.arol_id%TYPE,
    p_parent_arol_id          IN          application_roles.arol_id%TYPE );

  PROCEDURE ATTACH_PROC(
    p_upro_id                 IN          user_profiles.upro_id%TYPE,
    p_arol_id                 IN          application_roles.arol_id%TYPE
    );

  PROCEDURE DETACH_ALL_PROC(
    p_upro_id                 IN          user_profiles.upro_id%TYPE
    );

  PROCEDURE DETACH_PROC(
    p_upro_id                 IN          user_profiles.upro_id%TYPE,
    p_arol_id                 IN          application_roles.arol_id%TYPE
    );

END;
/