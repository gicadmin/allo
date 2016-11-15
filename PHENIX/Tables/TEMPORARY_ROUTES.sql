CREATE TABLE phenix.temporary_routes (
  tro_cus_code NUMBER(10),
  tro_cus_latitude NUMBER(7,4),
  tro_cus_longitude NUMBER(7,4),
  tro_rou_code NUMBER(5),
  tro_number_lines NUMBER(7),
  tro_number_orders NUMBER(7),
  tro_number_pieces NUMBER(7),
  tro_position NUMBER(7,2),
  tro_sale_dollars NUMBER(10,2),
  tro_volume NUMBER(9,3),
  tro_weight NUMBER(12,3),
  tro_excluded_switch NUMBER(1),
  tro_visible_switch NUMBER(1),
  tro_not_yet_invoiced_switch NUMBER(1),
  tro_includes_transport_switch NUMBER(1) DEFAULT 0 NOT NULL,
  tro_whs_delivery_code VARCHAR2(2 BYTE)
);
COMMENT ON TABLE phenix.temporary_routes IS 'Table temporaire pour les routes';
COMMENT ON COLUMN phenix.temporary_routes.tro_cus_code IS 'Code client';
COMMENT ON COLUMN phenix.temporary_routes.tro_cus_latitude IS 'Latitude du client';
COMMENT ON COLUMN phenix.temporary_routes.tro_cus_longitude IS 'Longitude du client';
COMMENT ON COLUMN phenix.temporary_routes.tro_rou_code IS 'Numéro de la route';
COMMENT ON COLUMN phenix.temporary_routes.tro_number_lines IS 'Nombre de lignes';
COMMENT ON COLUMN phenix.temporary_routes.tro_number_orders IS 'Nombre de commandes';
COMMENT ON COLUMN phenix.temporary_routes.tro_number_pieces IS 'Nombre de pièces';
COMMENT ON COLUMN phenix.temporary_routes.tro_position IS 'Position';
COMMENT ON COLUMN phenix.temporary_routes.tro_sale_dollars IS 'Prix de vente';
COMMENT ON COLUMN phenix.temporary_routes.tro_volume IS 'Volume';
COMMENT ON COLUMN phenix.temporary_routes.tro_weight IS 'Poids';
COMMENT ON COLUMN phenix.temporary_routes.tro_excluded_switch IS 'Indique si la liste de cueillette est inclus dans une route';
COMMENT ON COLUMN phenix.temporary_routes.tro_visible_switch IS 'Indique si le client est visible dans la génération des routes';
COMMENT ON COLUMN phenix.temporary_routes.tro_not_yet_invoiced_switch IS 'Indique si le client a tout ce qu''il faut pour être sur la route, mais sa facture n''est pas encore générée';
COMMENT ON COLUMN phenix.temporary_routes.tro_includes_transport_switch IS 'Indique si cette route inclus des transports';
COMMENT ON COLUMN phenix.temporary_routes.tro_whs_delivery_code IS 'Indique le code de l''entrepôt de livraison';