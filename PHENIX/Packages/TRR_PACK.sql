CREATE OR REPLACE PACKAGE phenix.TRR_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_route_rentability%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_trr_rou_code                 IN         temporary_route_rentability.trr_rou_code%TYPE                      DEFAULT NULL,
  p_trr_rou_description          IN         temporary_route_rentability.trr_rou_description%TYPE               DEFAULT NULL,
  p_trr_rou_date                 IN         temporary_route_rentability.trr_rou_date%TYPE                      DEFAULT NULL,
  p_trr_rod_position             IN         temporary_route_rentability.trr_rod_position%TYPE                  DEFAULT NULL,
  p_trr_rod_trk_code             IN         temporary_route_rentability.trr_rod_trk_code%TYPE                  DEFAULT NULL,
  p_trr_cus_code                 IN         temporary_route_rentability.trr_cus_code%TYPE                      DEFAULT NULL,
  p_trr_cus_name                 IN         temporary_route_rentability.trr_cus_name%TYPE                      DEFAULT NULL,
  p_trr_cus_address              IN         temporary_route_rentability.trr_cus_address%TYPE                   DEFAULT NULL,
  p_trr_cus_city                 IN         temporary_route_rentability.trr_cus_city%TYPE                      DEFAULT NULL,
  p_trr_inh_id                   IN         temporary_route_rentability.trr_inh_id%TYPE                        DEFAULT NULL,
  p_trr_inh_cost_price_total     IN         temporary_route_rentability.trr_inh_cost_price_total%TYPE          DEFAULT NULL,
  p_trr_inh_sale_price_total     IN         temporary_route_rentability.trr_inh_sale_price_total%TYPE          DEFAULT NULL,
  p_trr_inh_delivery_charge      IN         temporary_route_rentability.trr_inh_delivery_charge%TYPE           DEFAULT NULL,
  p_trr_nb_package               IN         temporary_route_rentability.trr_nb_package%TYPE                    DEFAULT NULL,
  p_trr_nb_cigaretes             IN         temporary_route_rentability.trr_nb_cigaretes%TYPE                  DEFAULT NULL,
  p_trr_profit_amount            IN         temporary_route_rentability.trr_profit_amount%TYPE                 DEFAULT NULL,
  p_trr_profit_percent           IN         temporary_route_rentability.trr_profit_percent%TYPE                DEFAULT NULL,
  p_trr_profit_by_package        IN         temporary_route_rentability.trr_profit_by_package%TYPE             DEFAULT NULL,
  p_trr_nb_of_arret              IN         temporary_route_rentability.trr_nb_of_arret%TYPE                   DEFAULT NULL,
  p_trr_pgr_report_nb_caisses    IN         temporary_route_rentability.trr_pgr_report_nb_caisses%TYPE         DEFAULT NULL,
  p_trr_pgr_report_sales         IN         temporary_route_rentability.trr_pgr_report_sales%TYPE              DEFAULT NULL,
  p_trr_pgr_report_costs         IN         temporary_route_rentability.trr_pgr_report_costs%TYPE              DEFAULT NULL,
  p_trr_cus_prv_code             IN         temporary_route_rentability.trr_cus_prv_code%TYPE                  DEFAULT NULL,
  p_trr_cus_ranking              IN         temporary_route_rentability.trr_cus_ranking%TYPE                   DEFAULT NULL,
  p_trr_cus_use_telemark_code    IN         temporary_route_rentability.trr_cus_use_telemark_code%TYPE         DEFAULT NULL,
  p_trr_nb_ven_for_vtt           IN         temporary_route_rentability.trr_nb_ven_for_vtt%TYPE                DEFAULT NULL,
  p_trr_vtt_invoiced_fuel_amount IN         temporary_route_rentability.trr_vtt_invoiced_fuel_amount%TYPE      DEFAULT NULL,
  P_trr_transport_profit         IN         temporary_route_rentability.trr_transport_profit%TYPE              DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_route_rentability%ROWTYPE);

END TRR_PACK;
/