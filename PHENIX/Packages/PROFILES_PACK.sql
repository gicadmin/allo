CREATE OR REPLACE PACKAGE phenix.PROFILES_PACK AS

PROCEDURE COPY_CUSTOMER_PROFILE_PROC(
  p_jsc_id IN NUMBER
);

END PROFILES_PACK;
/