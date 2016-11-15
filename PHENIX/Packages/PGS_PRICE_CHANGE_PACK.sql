CREATE OR REPLACE PACKAGE phenix.PGS_PRICE_CHANGE_PACK IS

--Fonction qui recoit les valeurs permettant  de créer/mettre à jour un changement de prix
-- et RETURN  détails de décomptes  VARCHAR2
FUNCTION  SET_PRICE_CHANGE_FUNC (
  lohid                   IN NUMBER,    -- loh_id
  prxprf_prd_code         IN VARCHAR2,  -- prx_prf_prd_code
  prxprf_fmt_short_code   IN VARCHAR2,  -- prx_prf_fmt_code
  prxeffective_date       IN DATE,      -- prx_effective_date
  prxposted_switch        IN NUMBER,    -- prx_posted_switch
  prxsell_price           IN NUMBER,    -- prx_sell_price
  prxtobacco_tax          IN NUMBER,    -- prx_tobacco_tax
  prxcreation_date        IN DATE,      -- prx_creation_date
  prxmodification_date    IN DATE,      -- prx_modification_date
  prxelimination_date     IN DATE,      -- prx_elimination_date
  prxinvoiced_by_weight   IN NUMBER,    -- prd_invoiced_by_weight
  prxminimum_sale_price   IN NUMBER     -- prx_minimum_sale_price
)
RETURN VARCHAR2;

PROCEDURE DELETE_TEMP_CHANG_PRIX_PROC;

PROCEDURE SEND_RAP_CHANG_PRIX_SYNC_PROC;
PROCEDURE INSERT_TRS_PROC(
  p_trs_prd_ven_code      IN price_changes.prx_vpd_ven_code%TYPE,
  p_trs_prf_prd_code      IN price_changes.prx_prf_prd_code%TYPE,
  p_trs_prf_fmt_code      IN price_changes.prx_prf_fmt_code%TYPE,
  p_trs_vpd_code          IN price_changes.prx_vpd_code%TYPE,
  p_trs_new_cost_price    IN price_changes.prx_cost%TYPE,
  p_trs_effective_date    IN price_changes.prx_effective_date%TYPE,
  p_trs_update_or_insert  IN VARCHAR2
  );

END PGS_PRICE_CHANGE_PACK;
/