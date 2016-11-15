CREATE OR REPLACE PACKAGE phenix.TSSS_OPERATION_PACK AS

PROCEDURE LOAD_CONTRACTS_PROC(
  p_from_site IN sites.sit_code%TYPE,
  p_to_site   IN sites.sit_code%TYPE,
  p_language  IN VARCHAR2
);

END TSSS_OPERATION_PACK;
/