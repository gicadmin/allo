CREATE OR REPLACE PACKAGE phenix.RAP_VENTE_SOMM_SIX_WEEK_PACK IS

PROCEDURE FILL_TABLE_SIX_WEEKS_PROC(
  p_period              IN NUMBER,
  p_year                IN NUMBER,
  p_de_client           IN NUMBER,
  p_a_client            IN NUMBER,
  p_type_d_utilisateur  IN VARCHAR2,
  p_de_l_utilisateur    IN NUMBER,
  p_a_l_utilisateur     IN NUMBER,
  p_groupe_ou_manuf     IN VARCHAR2,
  p_start_week_5        IN DATE,
  p_start_week_4        IN DATE,
  p_start_week_3        IN DATE,
  p_start_week_2        IN DATE,
  p_start_week_1        IN DATE,
  p_start_week_current  IN DATE,
  p_end_week_current    IN DATE ,
  p_code_entrepot       IN VARCHAR2 DEFAULT NULL          --BER1481
);

END RAP_VENTE_SOMM_SIX_WEEK_PACK;
/