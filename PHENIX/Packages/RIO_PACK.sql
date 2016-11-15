CREATE OR REPLACE PACKAGE phenix.RIO_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  roadnet_imp_orders%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_rio_location_id      IN         roadnet_imp_orders.rio_location_id%TYPE,
  p_rio_location_type    IN         roadnet_imp_orders.rio_location_type%TYPE,
  p_rio_route            IN         roadnet_imp_orders.rio_route%TYPE,
  p_rio_position         IN         roadnet_imp_orders.rio_position%TYPE,
  p_rio_priority         IN         roadnet_imp_orders.rio_priority%TYPE,
  p_rio_delivery_date    IN         roadnet_imp_orders.rio_delivery_date%TYPE,
  p_rio_truck_code       IN         roadnet_imp_orders.rio_truck_code%TYPE            DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY roadnet_imp_orders%ROWTYPE);

END RIO_PACK;
/