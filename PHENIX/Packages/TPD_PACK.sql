CREATE OR REPLACE PACKAGE phenix.TPD_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_pick_details%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_tpd_cod_coh_id                IN         temporary_pick_details.tpd_cod_coh_id%TYPE,
  p_tpd_cod_line_number           IN         temporary_pick_details.tpd_cod_line_number%TYPE,
  p_tpd_ordered_quantity          IN         temporary_pick_details.tpd_ordered_quantity%TYPE,
  p_tpd_ordered_weight            IN         temporary_pick_details.tpd_ordered_weight%TYPE,
  p_tpd_leftover_quantity         IN         temporary_pick_details.tpd_leftover_quantity%TYPE,
  p_tpd_leftover_weight           IN         temporary_pick_details.tpd_leftover_weight%TYPE,
  p_tpd_suggested_quantity        IN         temporary_pick_details.tpd_suggested_quantity%TYPE,
  p_tpd_suggested_weight          IN         temporary_pick_details.tpd_suggested_weight%TYPE,
  p_tpd_to_deliver_quantity       IN         temporary_pick_details.tpd_to_deliver_quantity%TYPE,
  p_tpd_to_deliver_weight         IN         temporary_pick_details.tpd_to_deliver_weight%TYPE,
  p_tpd_cod_process_flag          IN         temporary_pick_details.tpd_cod_process_flag%TYPE,
  p_tpd_cus_code                  IN         temporary_pick_details.tpd_cus_code%TYPE,
  p_tpd_cod_order_type            IN         temporary_pick_details.tpd_cod_order_type%TYPE,
  p_tpd_cod_prebook_method        IN         temporary_pick_details.tpd_cod_prebook_method%TYPE,
  p_tpd_cod_prf_prd_code          IN         temporary_pick_details.tpd_cod_prf_prd_code%TYPE,
  p_tpd_cod_prf_fmt_code          IN         temporary_pick_details.tpd_cod_prf_fmt_code%TYPE,
  p_tpd_cod_selling_retail        IN         temporary_pick_details.tpd_cod_selling_retail%TYPE,
  p_tpd_prd_description           IN         temporary_pick_details.tpd_prd_description%TYPE,
  p_tpd_prd_definition            IN         temporary_pick_details.tpd_prd_definition%TYPE,
  p_tpd_prf_description           IN         temporary_pick_details.tpd_prf_description%TYPE,
  p_tpd_prf_conversion_to_base    IN         temporary_pick_details.tpd_prf_conversion_to_base%TYPE,
  p_tpd_prf_height                IN         temporary_pick_details.tpd_prf_height%TYPE,
  p_tpd_prf_width                 IN         temporary_pick_details.tpd_prf_width%TYPE,
  p_tpd_prf_length                IN         temporary_pick_details.tpd_prf_length%TYPE,
  p_tpd_marque_manuf              IN         temporary_pick_details.tpd_marque_manuf%TYPE,
  p_tpd_prf_purchase_weight       IN         temporary_pick_details.tpd_prf_purchase_weight%TYPE,
  p_tpd_cod_pty_code              IN         temporary_pick_details.tpd_cod_pty_code%TYPE,
  p_tpd_cod_spec_order_status     IN         temporary_pick_details.tpd_cod_spec_order_status%TYPE,
  p_tpd_fmt_short_code            IN         temporary_pick_details.tpd_fmt_short_code%TYPE,
  p_tpd_coh_was_chosen_switch     IN         temporary_pick_details.tpd_coh_was_chosen_switch%TYPE,
  p_tpd_cod_customer_po_number    IN         temporary_pick_details.tpd_cod_customer_po_number%TYPE,
  p_tpd_coh_message               IN         temporary_pick_details.tpd_coh_message%TYPE,
  p_tpd_whc_code                  IN         temporary_pick_details.tpd_whc_code%TYPE,
  p_tpd_cod_customer_po_line      IN         temporary_pick_details.tpd_cod_customer_po_line%TYPE,
  p_tpd_coh_whs_delivery_code     IN         temporary_pick_details.tpd_coh_whs_delivery_code%TYPE,
  p_tpd_cod_whs_picking_code      IN         temporary_pick_details.tpd_cod_whs_picking_code%TYPE,
  p_tpd_cod_project_delivery_dat  IN         temporary_pick_details.tpd_cod_project_delivery_date%TYPE,
  p_tpd_jumelle_line_switch       IN         temporary_pick_details.tpd_jumelle_line_switch%TYPE            DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_pick_details%ROWTYPE);

END TPD_PACK;
/