CREATE OR REPLACE PACKAGE phenix.REPORT_ANALYZE_PROFIT_PACK IS

--USG519  création dune nouvelle procédure utilisée par le rapport d'analyse de profit
PROCEDURE RAP_ANALYSE_PROFIT_PROC (
  p_de_client                   IN NUMBER,
  p_a_client                    IN NUMBER,
  p_de_groupe_client            IN NUMBER,
  p_a_groupe_client             IN NUMBER,
  p_de_date                     IN DATE,
  p_a_date                      IN DATE,
  p_coutant_utilise             IN NUMBER,
  p_televendeur_ou_vendeur_flag IN VARCHAR2,
  p_de_vendeur                  IN NUMBER,    --ber7201
  p_a_vendeur                   IN NUMBER,    --ber7201
  p_de_televendeur              IN NUMBER,    --ber7201
  p_a_televendeur               IN NUMBER,    --ber7201
  p_de_region                   IN NUMBER,    --ber7201
  p_a_region                    IN NUMBER,    --ber7201
  p_group_by_store              IN VARCHAR2,  --ber7387 --OUI ou NON
  p_code_entrepot               IN VARCHAR2 DEFAULT NULL,  --CVI1697
  p_profit_total_flag           IN VARCHAR2 DEFAULT NULL,
  p_lang                        IN VARCHAR2 DEFAULT 'FR'
);

FUNCTION FIND_DROP_DISC_KNOWN_DET_FUNC(
  p_reference_number IN VARCHAR2,
  p_cus_code         IN NUMBER,
  p_vds_id           IN NUMBER,
  p_details_switch   IN NUMBER
)
RETURN NUMBER;

END REPORT_ANALYZE_PROFIT_PACK;
/