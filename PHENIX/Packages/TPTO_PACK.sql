CREATE OR REPLACE PACKAGE phenix.TPTO_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_products_to_order%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_tpto_prd_code                 IN         temporary_products_to_order.tpto_prd_code%TYPE                      DEFAULT NULL,
  p_tpto_prd_description          IN         temporary_products_to_order.tpto_prd_description%TYPE               DEFAULT NULL,
  p_tpto_prd_definition           IN         temporary_products_to_order.tpto_prd_definition%TYPE                DEFAULT NULL,
  p_tpto_prd_special_order_switc  IN         temporary_products_to_order.tpto_prd_special_order_switch%TYPE      DEFAULT NULL,
  p_tpto_prd_season_start         IN         temporary_products_to_order.tpto_prd_season_start%TYPE              DEFAULT NULL,
  p_tpto_prd_season_end           IN         temporary_products_to_order.tpto_prd_season_end%TYPE                DEFAULT NULL,
  p_tpto_prd_availability_date    IN         temporary_products_to_order.tpto_prd_availability_date%TYPE         DEFAULT NULL,
  p_tpto_brn_description          IN         temporary_products_to_order.tpto_brn_description%TYPE               DEFAULT NULL,
  p_tpto_prd_ven_code             IN         temporary_products_to_order.tpto_prd_ven_code%TYPE                  DEFAULT NULL,
  p_tpto_prd_ven_name             IN         temporary_products_to_order.tpto_prd_ven_name%TYPE                  DEFAULT NULL,
  p_tpto_prf_description          IN         temporary_products_to_order.tpto_prf_description%TYPE               DEFAULT NULL,
  p_tpto_prf_conversion_to_base   IN         temporary_products_to_order.tpto_prf_conversion_to_base%TYPE        DEFAULT NULL,
  p_tpto_ven_use_code             IN         temporary_products_to_order.tpto_ven_use_code%TYPE                  DEFAULT NULL,
  p_tpto_ven_use_name             IN         temporary_products_to_order.tpto_ven_use_name%TYPE                  DEFAULT NULL,
  p_tpto_pod_prf_fmt_code         IN         temporary_products_to_order.tpto_pod_prf_fmt_code%TYPE              DEFAULT NULL,
  p_tpto_pod_fmt_short_code       IN         temporary_products_to_order.tpto_pod_fmt_short_code%TYPE            DEFAULT NULL,
  p_tpto_pwi_whs_code             IN         temporary_products_to_order.tpto_pwi_whs_code%TYPE                  DEFAULT NULL,
  p_tpto_vwh_ship_days            IN         temporary_products_to_order.tpto_vwh_ship_days%TYPE                 DEFAULT NULL,
  p_tpto_qty_min                  IN         temporary_products_to_order.tpto_qty_min%TYPE                       DEFAULT NULL,
  p_tpto_qty_available            IN         temporary_products_to_order.tpto_qty_available%TYPE                 DEFAULT NULL,
  p_tpto_qty_order                IN         temporary_products_to_order.tpto_qty_order%TYPE                     DEFAULT NULL,
  p_tpto_qty_order_by_customer    IN         temporary_products_to_order.tpto_qty_order_by_customer%TYPE         DEFAULT NULL,
  p_tpto_qty_in_inventory         IN         temporary_products_to_order.tpto_qty_in_inventory%TYPE              DEFAULT NULL,
  p_tpto_average                  IN         temporary_products_to_order.tpto_average%TYPE                       DEFAULT NULL,
  p_tpto_cycle_order_date         IN         temporary_products_to_order.tpto_cycle_order_date%TYPE              DEFAULT NULL,
  p_tpto_today_delivery_date      IN         temporary_products_to_order.tpto_today_delivery_date%TYPE           DEFAULT NULL,
  p_tpto_cycle_delivery_date      IN         temporary_products_to_order.tpto_cycle_delivery_date%TYPE           DEFAULT NULL,
  p_tpto_customer_delivery_date   IN         temporary_products_to_order.tpto_customer_delivery_date%TYPE        DEFAULT NULL,
  p_tpto_sales_days               IN         temporary_products_to_order.tpto_sales_days%TYPE                    DEFAULT NULL,
  p_tpto_sales_days_per_week      IN         temporary_products_to_order.tpto_sales_days_per_week%TYPE           DEFAULT NULL,
  p_tpto_cycle_purchase_days      IN         temporary_products_to_order.tpto_cycle_purchase_days%TYPE           DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_products_to_order%ROWTYPE);

END TPTO_PACK;
/