CREATE OR REPLACE PACKAGE phenix.REO_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  roadnet_ext_orders%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_reo_location_id      IN         roadnet_ext_orders.reo_location_id%TYPE,
  p_reo_location_type    IN         roadnet_ext_orders.reo_location_type%TYPE,
  p_reo_order_id         IN         roadnet_ext_orders.reo_order_id%TYPE,
  p_reo_origin_id        IN         roadnet_ext_orders.reo_origin_id%TYPE,
  p_reo_origin_type      IN         roadnet_ext_orders.reo_origin_type%TYPE,
  p_reo_volume           IN         roadnet_ext_orders.reo_volume%TYPE,
  p_reo_preferred_route  IN         roadnet_ext_orders.reo_preferred_route%TYPE       DEFAULT NULL,
  p_reo_quantity         IN         roadnet_ext_orders.reo_quantity%TYPE              DEFAULT NULL,
  p_reo_weight           IN         roadnet_ext_orders.reo_weight%TYPE                DEFAULT NULL,
  p_reo_void_flag        IN         roadnet_ext_orders.reo_void_flag%TYPE             DEFAULT NULL,
  p_reo_creation_date    IN         roadnet_ext_orders.reo_creation_date%TYPE         DEFAULT SYSTIMESTAMP 	,
  p_reo_type             IN         roadnet_ext_orders.reo_type%TYPE                  DEFAULT 'EXP'          ,
  p_reo_items            IN         roadnet_ext_orders.reo_items%TYPE                 DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY roadnet_ext_orders%ROWTYPE);

END REO_PACK;
/