CREATE OR REPLACE PACKAGE phenix.VENDOR_FREEGOOD_INVOICING_PACK IS

PROCEDURE FREEGOOD_INVOICING_PROC(
  p_jsc_id IN NUMBER
 );

END VENDOR_FREEGOOD_INVOICING_PACK;
/