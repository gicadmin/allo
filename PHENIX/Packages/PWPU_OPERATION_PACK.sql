CREATE OR REPLACE PACKAGE phenix.PWPU_OPERATION_PACK IS

PROCEDURE DELETE_ALL_FOR_USER_PROC(
  p_use_code  IN NUMBER
);

PROCEDURE DELETE_PROC(
  p_use_code  IN NUMBER,
  p_pwph_id   IN NUMBER
);

END PWPU_OPERATION_PACK;
/