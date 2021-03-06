CREATE OR REPLACE PACKAGE phenix.WMS_TOTE_BOX_PACK IS

PROCEDURE CREATE_TOTE_OUTPUT_PROC(
  p_pmh_id    IN  NUMBER,
  p_tot_code  IN  VARCHAR2,
  p_quantity  IN  NUMBER
);

PROCEDURE CHECK_TOTE_OUTPUT_PROC(
  p_pmh_id IN NUMBER
);

END WMS_TOTE_BOX_PACK;
/