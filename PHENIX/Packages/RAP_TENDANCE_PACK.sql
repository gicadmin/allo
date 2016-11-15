CREATE OR REPLACE PACKAGE phenix.RAP_TENDANCE_PACK IS

PROCEDURE RAP_TENDANCE_GROUP_PROC(
  p_coutant_utilise   IN NUMBER,
  p_periode           IN NUMBER,
  p_whs_code          IN warehouses.whs_code%TYPE,
  p_language_rapport  IN VARCHAR2,
  p_switch_carry      IN VARCHAR2 DEFAULT 'N'
);

PROCEDURE RAP_TENDANCE_VENTE_PROC(
  p_date                        IN DATE,
  p_coutant_utilise             IN NUMBER,
  p_whs_code                    IN WAREHOUSES.whs_code%TYPE,
  p_language_rapport            IN VARCHAR2,
  p_switch_carry                IN VARCHAR2 DEFAULT 'N',
  p_televendeur_ou_vendeur_flag IN VARCHAR2 DEFAULT 'V'  --BER7483
);

END RAP_TENDANCE_PACK;
/