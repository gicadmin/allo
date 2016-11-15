CREATE OR REPLACE PACKAGE phenix.UPRO_OPERATION_PACK IS

  PROCEDURE DELETE_PROC(
    p_upro_id                 IN          user_profiles.upro_id%TYPE
    );

END UPRO_OPERATION_PACK;
/