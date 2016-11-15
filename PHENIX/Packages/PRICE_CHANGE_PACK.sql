CREATE OR REPLACE PACKAGE phenix.PRICE_CHANGE_PACK IS

FUNCTION PRICE_CHANGE_ACTIVATION_FUNC(
  p_log_id            IN NUMBER,
  p_nb_lines_negatifs OUT NUMBER,
  p_nb_lines_cost     OUT NUMBER,
  p_nb_lines_sell     OUT NUMBER,
  p_nb_lines_pds      OUT NUMBER,
  p_nb_lines_whs      OUT NUMBER,
  p_nb_lines_del      OUT NUMBER
)
RETURN BOOLEAN;

FUNCTION PRICE_CHANGE_SELLING_FUNC(
  p_log_id                        IN NUMBER,
  p_super_distributor_switch      IN NUMBER, --Csc1292
  p_ctr_srp_perc_by_group_switch  IN NUMBER,  --cvi73
  p_nb_lines_sell                 IN OUT NUMBER,
  p_nb_lines_pds                  IN OUT NUMBER,  --rol1482
  p_nb_lines_del                  IN OUT NUMBER --csc4114
)
RETURN BOOLEAN;

FUNCTION PRICE_CHANGE_PDS_FUNC(   --Nouvelle fonction créer pour rol1482
  p_log_id        IN NUMBER,
  p_nb_lines_pds  IN OUT NUMBER
)
RETURN BOOLEAN;

--BER1442 nouvelle fonction servant à appliquer les changements de prix de transport sur les entrepots
FUNCTION PRICE_CHANGE_WAREHOUSE_FUNC(
  p_log_id        IN NUMBER,
  p_nb_lines_whs  IN OUT NUMBER
)
RETURN BOOLEAN;

FUNCTION UPDATE_SOLID_BACON_DINDE_FUNC(     --ber183
  p_log_id                        IN NUMBER,
  p_prd_code                      IN VARCHAR2,
  p_prd_fmt_solid_inventory_code  IN VARCHAR2,
  p_weighted_inv_new_price        IN NUMBER
)
RETURN BOOLEAN;

END PRICE_CHANGE_PACK;
/