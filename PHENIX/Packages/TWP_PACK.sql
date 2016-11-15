CREATE OR REPLACE PACKAGE phenix.TWP_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_weekly_cus_profits%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_twp_cus_code                   IN         temporary_weekly_cus_profits.twp_cus_code%TYPE                        DEFAULT NULL,
  p_twp_fcd_fcw_fca_year           IN         temporary_weekly_cus_profits.twp_fcd_fcw_fca_year%TYPE                DEFAULT NULL,
  p_twp_fcd_fcw_fca_period         IN         temporary_weekly_cus_profits.twp_fcd_fcw_fca_period%TYPE              DEFAULT NULL,
  p_twp_fcd_fcw_week               IN         temporary_weekly_cus_profits.twp_fcd_fcw_week%TYPE                    DEFAULT NULL,
  p_twp_cus_name                   IN         temporary_weekly_cus_profits.twp_cus_name%TYPE                        DEFAULT NULL,
  p_twp_cus_city                   IN         temporary_weekly_cus_profits.twp_cus_city%TYPE                        DEFAULT NULL,
  p_twp_cus_str_code               IN         temporary_weekly_cus_profits.twp_cus_str_code%TYPE                    DEFAULT NULL,
  p_twp_cus_transport_contributi   IN         temporary_weekly_cus_profits.twp_cus_transport_contribution%TYPE      DEFAULT NULL,
  p_twp_cus_minimum_profit_amoun   IN         temporary_weekly_cus_profits.twp_cus_minimum_profit_amount%TYPE       DEFAULT NULL,
  p_twp_cus_minimum_profit_perce   IN         temporary_weekly_cus_profits.twp_cus_minimum_profit_percent%TYPE      DEFAULT NULL,
  p_twp_telemark_use_code          IN         temporary_weekly_cus_profits.twp_telemark_use_code%TYPE               DEFAULT NULL,
  p_twp_telemark_use_first_name    IN         temporary_weekly_cus_profits.twp_telemark_use_first_name%TYPE         DEFAULT NULL,
  p_twp_telemark_use_last_name     IN         temporary_weekly_cus_profits.twp_telemark_use_last_name%TYPE          DEFAULT NULL,
  p_twp_use_code                   IN         temporary_weekly_cus_profits.twp_use_code%TYPE                        DEFAULT NULL,
  p_twp_use_first_name             IN         temporary_weekly_cus_profits.twp_use_first_name%TYPE                  DEFAULT NULL,
  p_twp_use_last_name              IN         temporary_weekly_cus_profits.twp_use_last_name%TYPE                   DEFAULT NULL,
  p_twp_inh_delivery_charge        IN         temporary_weekly_cus_profits.twp_inh_delivery_charge%TYPE             DEFAULT NULL,
  p_twp_nb_of_deliveries           IN         temporary_weekly_cus_profits.twp_nb_of_deliveries%TYPE                DEFAULT NULL,
  p_twp_wkly_transp_contrib_amou   IN         temporary_weekly_cus_profits.twp_wkly_transp_contrib_amount%TYPE      DEFAULT NULL,
  p_twp_wkly_bursary_amount        IN         temporary_weekly_cus_profits.twp_wkly_bursary_amount%TYPE             DEFAULT NULL,
  p_twp_wkly_loan_interest         IN         temporary_weekly_cus_profits.twp_wkly_loan_interest%TYPE              DEFAULT NULL,
  p_twp_transport                  IN         temporary_weekly_cus_profits.twp_transport%TYPE                       DEFAULT NULL,
  p_twp_not_drop_offinv_vol_reb    IN         temporary_weekly_cus_profits.twp_not_drop_offinv_vol_reb%TYPE         DEFAULT NULL,
  p_twp_not_drop_amount_cost       IN         temporary_weekly_cus_profits.twp_not_drop_amount_cost%TYPE            DEFAULT NULL,
  p_twp_not_drop_amount_sales      IN         temporary_weekly_cus_profits.twp_not_drop_amount_sales%TYPE           DEFAULT NULL,
  p_twp_not_drop_profit_dollar     IN         temporary_weekly_cus_profits.twp_not_drop_profit_dollar%TYPE          DEFAULT NULL,
  p_twp_drop_amount_cost           IN         temporary_weekly_cus_profits.twp_drop_amount_cost%TYPE                DEFAULT NULL,
  p_twp_drop_amount_sales          IN         temporary_weekly_cus_profits.twp_drop_amount_sales%TYPE               DEFAULT NULL,
  p_twp_drop_profit_dollar         IN         temporary_weekly_cus_profits.twp_drop_profit_dollar%TYPE              DEFAULT NULL,
  p_twp_wkly_profit_dollar         IN         temporary_weekly_cus_profits.twp_wkly_profit_dollar%TYPE              DEFAULT NULL,
  p_twp_wkly_profit_percent        IN         temporary_weekly_cus_profits.twp_wkly_profit_percent%TYPE             DEFAULT NULL,
  p_twp_nb_of_distinct_cus         IN         temporary_weekly_cus_profits.twp_nb_of_distinct_cus%TYPE              DEFAULT NULL,
  p_twp_cus_ranking                IN         temporary_weekly_cus_profits.twp_cus_ranking%TYPE                     DEFAULT NULL,
  p_twp_profit_reached_switch      IN         temporary_weekly_cus_profits.twp_profit_reached_switch%TYPE           DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_weekly_cus_profits%ROWTYPE);

END TWP_PACK;
/