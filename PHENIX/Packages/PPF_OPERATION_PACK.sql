CREATE OR REPLACE PACKAGE phenix.PPF_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_ppf_ven_code IN product_families.ppf_ven_code%TYPE
);

END PPF_OPERATION_PACK;
/