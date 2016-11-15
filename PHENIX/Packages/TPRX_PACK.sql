CREATE OR REPLACE PACKAGE phenix.TPRX_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_price_changes%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_tprx_effective_date           IN         temporary_price_changes.tprx_effective_date%TYPE,
  p_tprx_prf_prd_code             IN         temporary_price_changes.tprx_prf_prd_code%TYPE,
  p_tprx_prf_fmt_code             IN         temporary_price_changes.tprx_prf_fmt_code%TYPE                  DEFAULT NULL,
  p_tprx_vpd_code                 IN         temporary_price_changes.tprx_vpd_code%TYPE                      DEFAULT NULL,
  p_tprx_vpd_prf_fmt_code         IN         temporary_price_changes.tprx_vpd_prf_fmt_code%TYPE              DEFAULT NULL,
  p_tprx_ven_code                 IN         temporary_price_changes.tprx_ven_code%TYPE                      DEFAULT NULL,
  p_tprx_old_cost                 IN         temporary_price_changes.tprx_old_cost%TYPE                      DEFAULT NULL,
  p_tprx_cost                     IN         temporary_price_changes.tprx_cost%TYPE                          DEFAULT NULL,
  p_tprx_old_cost_adjustment      IN         temporary_price_changes.tprx_old_cost_adjustment%TYPE           DEFAULT NULL,
  p_tprx_cost_adjustment          IN         temporary_price_changes.tprx_cost_adjustment%TYPE               DEFAULT NULL,
  p_tprx_old_cost_admin_1         IN         temporary_price_changes.tprx_old_cost_admin_1%TYPE              DEFAULT NULL,
  p_tprx_cost_admin_1             IN         temporary_price_changes.tprx_cost_admin_1%TYPE                  DEFAULT NULL,
  p_tprx_old_cost_admin_2_percen  IN         temporary_price_changes.tprx_old_cost_admin_2_percent%TYPE      DEFAULT NULL,
  p_tprx_cost_admin_2_percent     IN         temporary_price_changes.tprx_cost_admin_2_percent%TYPE          DEFAULT NULL,
  p_tprx_old_tobacco_tax          IN         temporary_price_changes.tprx_old_tobacco_tax%TYPE               DEFAULT NULL,
  p_tprx_tobacco_tax              IN         temporary_price_changes.tprx_tobacco_tax%TYPE                   DEFAULT NULL,
  p_tprx_old_profit_percent       IN         temporary_price_changes.tprx_old_profit_percent%TYPE            DEFAULT NULL,
  p_tprx_profit_percent           IN         temporary_price_changes.tprx_profit_percent%TYPE                DEFAULT NULL,
  p_tprx_old_sell_price           IN         temporary_price_changes.tprx_old_sell_price%TYPE                DEFAULT NULL,
  p_tprx_sell_price               IN         temporary_price_changes.tprx_sell_price%TYPE                    DEFAULT NULL,
  p_tprx_use_code                 IN         temporary_price_changes.tprx_use_code%TYPE                      DEFAULT NULL,
  p_tprx_minimum_sale_price       IN         temporary_price_changes.tprx_minimum_sale_price%TYPE            DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_price_changes%ROWTYPE);

END TPRX_PACK;
/