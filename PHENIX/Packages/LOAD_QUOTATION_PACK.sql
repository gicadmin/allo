CREATE OR REPLACE PACKAGE phenix.LOAD_QUOTATION_PACK IS

PROCEDURE LOAD_COKE_PROC(
  p_jsc_id IN NUMBER
);

END LOAD_QUOTATION_PACK;
/