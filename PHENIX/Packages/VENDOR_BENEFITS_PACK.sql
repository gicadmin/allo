CREATE OR REPLACE PACKAGE phenix.VENDOR_BENEFITS_PACK IS

PROCEDURE CREATE_BENEFIT_FILE_PROC(
  p_jsc_id IN NUMBER);

END VENDOR_BENEFITS_PACK;
/