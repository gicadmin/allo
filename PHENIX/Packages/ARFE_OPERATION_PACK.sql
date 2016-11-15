CREATE OR REPLACE PACKAGE phenix.arfe_operation_pack AS

  PROCEDURE DETACH_ALL_PROC(
    p_arol_id                 IN          application_roles.arol_id%TYPE
    );

END;
/