CREATE TABLE phenix.ber8159_temp_potential_picks (
  tpp_cus_code NUMBER(10),
  tpp_rou_code NUMBER(5),
  tpp_position NUMBER(7,2),
  tpp_trk_code VARCHAR2(8 BYTE),
  tpp_trk_use_code NUMBER(5),
  tpp_trk_use_aide_code NUMBER(5),
  tpp_number_lines NUMBER(7),
  tpp_number_orders NUMBER(7),
  tpp_number_pieces NUMBER(7),
  tpp_sale_dollars NUMBER(12,2),
  tpp_volume NUMBER(12,3),
  tpp_weight NUMBER(12,3),
  tpp_cus_latitude NUMBER(7,4),
  tpp_cus_longitude NUMBER(7,4),
  tpp_selected_number_lines NUMBER(7),
  tpp_selected_number_orders NUMBER(7),
  tpp_selected_number_pieces NUMBER(7),
  tpp_selected_sale_dollars NUMBER(12,2),
  tpp_selected_volume NUMBER(12,3),
  tpp_selected_weight NUMBER(9,3),
  tpp_selected_whc_code VARCHAR2(4 BYTE),
  tpp_whs_delivery_code VARCHAR2(2 BYTE),
  tpp_whs_picking_code VARCHAR2(2 BYTE),
  tpp_loc_dock_code VARCHAR2(12 BYTE)
);