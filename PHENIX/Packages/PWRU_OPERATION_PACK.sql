CREATE OR REPLACE PACKAGE phenix.PWRU_OPERATION_PACK IS

PROCEDURE DELETE_ALL_FOR_USER_PROC(
  p_use_code  IN NUMBER
);

PROCEDURE DELETE_PROC(
  p_use_code  IN NUMBER,
  p_pwrh_id   IN NUMBER
);

END PWRU_OPERATION_PACK;
/