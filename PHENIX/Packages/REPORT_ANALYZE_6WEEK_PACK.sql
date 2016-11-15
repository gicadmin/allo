CREATE OR REPLACE PACKAGE phenix.REPORT_ANALYZE_6WEEK_PACK IS

PROCEDURE RAP_PROFIT_SIX_WEEKS_PROC (
  p_coutant_utilise             IN NUMBER,
  p_de_client                   IN NUMBER   DEFAULT NULL,
  p_a_client                    IN NUMBER   DEFAULT NULL,
  p_de_groupe_client            IN NUMBER   DEFAULT NULL,
  p_a_groupe_client             IN NUMBER   DEFAULT NULL,
  p_de_date                     IN DATE,
  p_a_date                      IN DATE,
  p_de_region                   IN NUMBER   DEFAULT NULL,
  p_a_region                    IN NUMBER   DEFAULT NULL,
  p_code_entrepot               IN VARCHAR2 DEFAULT NULL,
  p_de_vendeur                  IN NUMBER   DEFAULT NULL,
  p_a_vendeur                   IN NUMBER   DEFAULT NULL,
  p_de_televendeur              IN NUMBER   DEFAULT NULL,
  p_a_televendeur               IN NUMBER   DEFAULT NULL,
  p_type_seuil                  IN VARCHAR2 DEFAULT NULL, --BER7634 (P = pourcentage D = dollar)
  p_seuil                       IN NUMBER   DEFAULT NULL,
  p_group_by_store              IN VARCHAR2 DEFAULT 'NON',   --OUI ou NON
  p_language                    IN VARCHAR2 DEFAULT 'FR'
);

END REPORT_ANALYZE_6WEEK_PACK;
/