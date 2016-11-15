CREATE GLOBAL TEMPORARY TABLE phenix.temporary_potential_picks (
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
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_potential_picks IS 'Table temporaire utilisée par l''enquête des cueillettes potentielles';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_rou_code IS 'Indique le code de la route';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_position IS 'Indique la position du client sur la route';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_trk_code IS 'Indique le code du camion associé à la route';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_trk_use_code IS 'Indique le code du chauffeur du camion';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_trk_use_aide_code IS 'Indique le code de l''aide chauffeur';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_number_lines IS 'Indique le nombre de ligne de commande pour le client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_number_orders IS 'Indique la nombre de commandes pour le client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_number_pieces IS 'Indique le nombre d''éléments pour le client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_sale_dollars IS 'Indique le montant total des commandes pour le client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_volume IS 'Indique le volume total des commandes pour le client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_weight IS 'Indique le poids total des commandes pour le client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_cus_latitude IS 'Indique la latitude du client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_cus_longitude IS 'Indique la longitude du client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_selected_number_lines IS 'Indique le nombre de lignes de commande sélectionnées pour le client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_selected_number_orders IS 'Indique le nombre de commandes sélectionnées pour le client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_selected_number_pieces IS 'Indique le nombre d''éléments sélectionnés pour le client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_selected_sale_dollars IS 'Indique le montant total des commandes sélectionnées pour le client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_selected_volume IS 'Indique le volume total des commandes sélectionnées pour le client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_selected_weight IS 'Indique le poids total des commandes sélectionnées pour le client';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_selected_whc_code IS 'Indique le code d''entreposage sélectionné';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_whs_delivery_code IS 'Indique le code de l''entrepôt de livraison';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_whs_picking_code IS 'Indique le code de l''entrepôt de cueillette';
COMMENT ON COLUMN phenix.temporary_potential_picks.tpp_loc_dock_code IS 'Indique le quai d''expédition qui sera utilisé lors du chargement "par route"';