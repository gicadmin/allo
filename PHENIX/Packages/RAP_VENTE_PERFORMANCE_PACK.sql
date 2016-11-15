CREATE OR REPLACE PACKAGE phenix.RAP_VENTE_PERFORMANCE_PACK IS

PROCEDURE GEN_RAP_VENTE_PERFORMANCE_PROC(
  p_date_debut    IN DATE,
  p_date_fin      IN DATE,
  p_zone          IN VARCHAR2,
  p_code_entrepot IN VARCHAR2 DEFAULT NULL,  --BER1481
  p_language      IN VARCHAR2 DEFAULT 'FR'   --GCL8337
);

END RAP_VENTE_PERFORMANCE_PACK;
/