CREATE TABLE phenix.temporary_pick_lists (
  tpl_cus_code NUMBER(10),
  tpl_cus_latitude NUMBER(7,4),
  tpl_cus_longitude NUMBER(7,4),
  tpl_rou_code NUMBER(5),
  tpl_number_lines NUMBER(7),
  tpl_number_orders NUMBER(7),
  tpl_number_pieces NUMBER(7),
  tpl_position NUMBER(7,2),
  tpl_sale_dollars NUMBER(12,2),
  tpl_volume NUMBER(12,3),
  tpl_weight NUMBER(9,3),
  tpl_included_switch NUMBER(1),
  tpl_selected_number_lines NUMBER(7),
  tpl_selected_number_orders NUMBER(7),
  tpl_selected_number_pieces NUMBER(7),
  tpl_selected_sale_dollars NUMBER(12,2),
  tpl_selected_volume NUMBER(12,3),
  tpl_selected_weight NUMBER(9,3),
  tpl_selected_whc_code VARCHAR2(4 BYTE),
  tpl_loc_shipping_dock_code VARCHAR2(12 BYTE),
  tpl_number_of_cases NUMBER(7),
  tpl_visible_switch NUMBER(1),
  tpl_whs_delivery_code VARCHAR2(2 BYTE),
  tpl_whs_picking_code VARCHAR2(2 BYTE),
  tpl_transport_packages NUMBER(7),
  tpl_transport_pallets NUMBER(7),
  tpl_transport_only_switch NUMBER(1) DEFAULT 0 CONSTRAINT tpl_transport_only_switch_ck CHECK (tpl_transport_only_switch IN (0, 1)),
  tpl_transport_number_orders NUMBER(7),
  tpl_transport_number_lines NUMBER(7),
  tpl_transport_sale_dollars NUMBER(12,2),
  tpl_transport_weight NUMBER(12,3),
  tpl_transport_volume NUMBER(9,3),
  tpl_cus_cdk_code VARCHAR2(4 BYTE)
);
COMMENT ON TABLE phenix.temporary_pick_lists IS 'Table temporaire pour les bons de cueillette';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_cus_code IS 'Code client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_cus_latitude IS 'Latitude du client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_cus_longitude IS 'Longitude du client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_rou_code IS 'Numéro de la route';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_number_lines IS 'Nombre de lignes';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_number_orders IS 'Nombre de commandes';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_number_pieces IS 'Nombre de pièces';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_position IS 'Position';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_sale_dollars IS 'Prix de vente';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_volume IS 'Volume';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_weight IS 'Poids';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_selected_number_lines IS 'Indique le nombre de ligne de commande sélectionnée pour le client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_selected_number_orders IS 'Indique le nombre de commande sélectionnée pour le client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_selected_number_pieces IS 'Indique le nombre de morceaux sélectionnée pour le client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_selected_sale_dollars IS 'Indique le montant total des lignes sélectionnées pour le client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_selected_volume IS 'Indique le volume total des lignes sélectionnées pour le client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_selected_weight IS 'Indique le poids total des lignes sélectionnées pour le client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_selected_whc_code IS 'Indique la zone sélectionnée pour la génération de pick list';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_loc_shipping_dock_code IS 'Indique le quai d''expédition';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_number_of_cases IS 'Indique le nombre de format manufacturier inclus dans la route';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_visible_switch IS 'Indique si ce client doit être visible ou pas dans l''écran de génération';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_whs_delivery_code IS 'Indique le code de l''entrepôt de livraison';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_whs_picking_code IS 'Indique le code de l''entrepôt de cueillette';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_transport_packages IS 'Indique le nombre de morceaux parmi les transactions de transport pour le client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_transport_pallets IS 'Indique le nombre de palettes parmi les transactions de transport pour le client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_transport_only_switch IS 'Indique si cette ligne existe uniquement suite à des transactions de transport';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_transport_number_orders IS 'Indique le nombre de commande de transport pour le client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_transport_number_lines IS 'Indique le nombre de ligne de commande transport pour le client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_transport_sale_dollars IS 'Indique le montant total des lignes de transport pour le client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_transport_weight IS 'Indique le poids total des lignes de transport pour le client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_transport_volume IS 'Indique le volume total des lignes de transport pour le client';
COMMENT ON COLUMN phenix.temporary_pick_lists.tpl_cus_cdk_code IS 'Indique le code de transbordement du client';