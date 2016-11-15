CREATE OR REPLACE PACKAGE phenix.TPL_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_pick_lists%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_tpl_cus_code                IN         temporary_pick_lists.tpl_cus_code%TYPE,
  p_tpl_cus_latitude            IN         temporary_pick_lists.tpl_cus_latitude%TYPE,
  p_tpl_cus_longitude           IN         temporary_pick_lists.tpl_cus_longitude%TYPE,
  p_tpl_rou_code                IN         temporary_pick_lists.tpl_rou_code%TYPE,
  p_tpl_number_lines            IN         temporary_pick_lists.tpl_number_lines%TYPE,
  p_tpl_number_orders           IN         temporary_pick_lists.tpl_number_orders%TYPE,
  p_tpl_number_pieces           IN         temporary_pick_lists.tpl_number_pieces%TYPE,
  p_tpl_position                IN         temporary_pick_lists.tpl_position%TYPE,
  p_tpl_sale_dollars            IN         temporary_pick_lists.tpl_sale_dollars%TYPE,
  p_tpl_volume                  IN         temporary_pick_lists.tpl_volume%TYPE,
  p_tpl_weight                  IN         temporary_pick_lists.tpl_weight%TYPE,
  p_tpl_included_switch         IN         temporary_pick_lists.tpl_included_switch%TYPE,
  p_tpl_selected_number_lines   IN         temporary_pick_lists.tpl_selected_number_lines%TYPE,
  p_tpl_selected_number_orders  IN         temporary_pick_lists.tpl_selected_number_orders%TYPE,
  p_tpl_selected_number_pieces  IN         temporary_pick_lists.tpl_selected_number_pieces%TYPE,
  p_tpl_selected_sale_dollars   IN         temporary_pick_lists.tpl_selected_sale_dollars%TYPE,
  p_tpl_selected_volume         IN         temporary_pick_lists.tpl_selected_volume%TYPE,
  p_tpl_selected_weight         IN         temporary_pick_lists.tpl_selected_weight%TYPE,
  p_tpl_selected_whc_code       IN         temporary_pick_lists.tpl_selected_whc_code%TYPE,
  p_tpl_loc_shipping_dock_code  IN         temporary_pick_lists.tpl_loc_shipping_dock_code%TYPE,
  p_tpl_number_of_cases         IN         temporary_pick_lists.tpl_number_of_cases%TYPE,
  p_tpl_visible_switch          IN         temporary_pick_lists.tpl_visible_switch%TYPE,
  p_tpl_whs_delivery_code       IN         temporary_pick_lists.tpl_whs_delivery_code%TYPE,
  p_tpl_whs_picking_code        IN         temporary_pick_lists.tpl_whs_picking_code%TYPE,
  p_tpl_transport_packages      IN         temporary_pick_lists.tpl_transport_packages%TYPE,
  p_tpl_transport_pallets       IN         temporary_pick_lists.tpl_transport_pallets%TYPE,
  p_tpl_transport_number_orders IN         temporary_pick_lists.tpl_transport_number_orders%TYPE,
  p_tpl_transport_number_lines  IN         temporary_pick_lists.tpl_transport_number_lines%TYPE,
  p_tpl_transport_sale_dollars  IN         temporary_pick_lists.tpl_transport_sale_dollars%TYPE,
  p_tpl_transport_weight        IN         temporary_pick_lists.tpl_transport_weight%TYPE,
  p_tpl_transport_volume        IN         temporary_pick_lists.tpl_transport_volume%TYPE,
  p_tpl_transport_only_switch   IN         temporary_pick_lists.tpl_transport_only_switch%TYPE        DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_pick_lists%ROWTYPE);

END TPL_PACK;
/