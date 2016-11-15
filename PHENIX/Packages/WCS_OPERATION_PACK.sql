CREATE OR REPLACE PACKAGE phenix.WCS_OPERATION_PACK IS

FUNCTION DO_WCS_YEAR_EXIST_FOR_CUS_FUNC(
  p_cus_code  IN weekly_customer_stats.wcs_cus_code%TYPE,
  p_year      IN weekly_customer_stats.wcs_fcw_fca_year%TYPE
)
RETURN BOOLEAN;

PROCEDURE CALCULATE_ALL_WCS_PROC(
  p_cus_code        IN weekly_customer_stats.wcs_cus_code%TYPE,
  p_fcw_fca_year    IN fiscal_calendar_weeks.fcw_fca_year%TYPE,
  p_fcw_fca_period  IN fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_week        IN fiscal_calendar_weeks.fcw_week%TYPE,
  r_wcs             IN OUT weekly_customer_stats%ROWTYPE
);

--procédure qui recalcule les valeurs d'une semaine (car des ventes/coutants ont changé)
PROCEDURE RECALC_WEEK_VALUES_PROC(
  p_cus_code        IN weekly_customer_stats.wcs_cus_code%TYPE,
  p_fcw_fca_year    IN fiscal_calendar_weeks.fcw_fca_year%TYPE,
  p_fcw_fca_period  IN fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_week        IN fiscal_calendar_weeks.fcw_week%TYPE
);

PROCEDURE INSERT_YEAR_FOR_CUS_PROC(
  p_cus_code  IN weekly_customer_stats.wcs_cus_code%TYPE,
  p_year      IN weekly_customer_stats.wcs_fcw_fca_year%TYPE
);

PROCEDURE PROJECT_SALES_PROC(
  p_jsc_id IN NUMBER
);

PROCEDURE GET_SUM_AMOUNT_PROC(
  p_cus_code              IN weekly_customer_stats.wcs_cus_code%TYPE,
  p_fcw_fca_year          IN fiscal_calendar_weeks.fcw_fca_year%TYPE,
  p_fcw_fca_period        IN fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_week              IN fiscal_calendar_weeks.fcw_week%TYPE,
  p_wcs_sum_sales         OUT weekly_customer_stats.wcs_sum_sales%TYPE,
  p_wcs_sum_costs         OUT weekly_customer_stats.wcs_sum_costs%TYPE,
  p_wcs_projected_sales   OUT weekly_customer_stats.wcs_projected_sales%TYPE,
  p_wcs_sum_deliv_charge  OUT weekly_customer_stats.wcs_sum_deliv_charge%TYPE,
  p_wcs_nb_deliveries     OUT weekly_customer_stats.wcs_nb_deliveries%TYPE
);

PROCEDURE ADD_AMOUNT_PROC(
  p_inh_rec invoice_headers%ROWTYPE
);

PROCEDURE RECALC_PROJECTED_SALES_PROC(
  p_jsc_id IN NUMBER
);

--ber7465 procédure pour mettre à jour le nombre de livraison de tout un regroupement
--doit être fait indépendamment des frais de livraison car les frais se basent sur la date de facturation, alors que le nombre de livraison se base sur la date de route
--et ces deux dates ne sont pas forcément au courant de la même semaine fiscale
PROCEDURE UPDATE_STORE_NB_DELIV_PROC(
  p_wcs_fcw_fca_year      IN weekly_customer_stats.wcs_fcw_fca_year%TYPE,
  p_wcs_fcw_fca_period    IN weekly_customer_stats.wcs_fcw_fca_period%TYPE,
  p_wcs_fcw_week          IN weekly_customer_stats.wcs_fcw_week%TYPE,
  p_cus_str_code          IN customers.cus_str_code%TYPE
);

--ber7465 procédure pour mettre à jour les frais de livraison de tout un regroupement
--doit être fait indépendamment du nombre de livraison car les frais se basent sur la date de facturation, alors que le nombre de livraison se base sur la date de route
--et ces deux dates ne sont pas forcément au courant de la même semaine fiscale
PROCEDURE UPDATE_STORE_DELIV_CHARGE_PROC(
  p_wcs_fcw_fca_year      IN weekly_customer_stats.wcs_fcw_fca_year%TYPE,
  p_wcs_fcw_fca_period    IN weekly_customer_stats.wcs_fcw_fca_period%TYPE,
  p_wcs_fcw_week          IN weekly_customer_stats.wcs_fcw_week%TYPE,
  p_cus_str_code          IN customers.cus_str_code%TYPE
);

--BER7465 procédure pour recalculer les frais de livraison et nombre de livraison des clients en fonction des regroupements
PROCEDURE RECALC_DELIVERIES_PROC;

--GCL9534 recalcul des valeurs de WCS qui sont calculé dans SCI (recalcul la table au complet..)
PROCEDURE RECALC_ALL_SCI_VALUES_PROC;

--GCL9534 recalcul des valeurs de WCS qui sont calculé dans SCI (pour lorsqu'il y a des reload de SCI) - recalcul par période
PROCEDURE RECALC_VALUES_FROM_SCI_PROC(
  p_fca_year    IN NUMBER,
  p_fca_period  IN NUMBER
);

PROCEDURE PURGE_PROC(
  p_wcs_cus_code IN weekly_customer_stats.wcs_cus_code%TYPE
);

END WCS_OPERATION_PACK;
/