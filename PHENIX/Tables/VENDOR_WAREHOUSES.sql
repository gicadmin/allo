CREATE TABLE phenix.vendor_warehouses (
  vwh_ven_code NUMBER(5) NOT NULL,
  vwh_whs_code VARCHAR2(2 BYTE) NOT NULL,
  vwh_ship_days NUMBER(3) DEFAULT 0 NOT NULL,
  vwh_caps_processing_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vwh_caps_processing_switch_ck CHECK (vwh_caps_processing_switch IN (0,1)),
  vwh_caps_last_verified DATE,
  vwh_caps_tch_locking_id NUMBER(15),
  vwh_add_transport_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vwh_add_transport_switch_ck CHECK (VWH_ADD_TRANSPORT_SWITCH IN (0, 1)),
  vwh_rou_code NUMBER(5),
  vwh_rou_position NUMBER(5),
  vwh_pickup_switch NUMBER(1) DEFAULT 0 NOT NULL,
  vwh_avail_in_inventory_days NUMBER(3) DEFAULT 0 NOT NULL,
  vwh_round_per_pallet_percent NUMBER(6,3),
  vwh_round_per_row_percent NUMBER(6,3),
  vwh_replenish_nb_of_week NUMBER(3,1),
  vwh_transport_days NUMBER(1),
  CONSTRAINT vwh_pk PRIMARY KEY (vwh_ven_code,vwh_whs_code),
  CONSTRAINT vwh_caps_tch_fk FOREIGN KEY (vwh_caps_tch_locking_id) REFERENCES phenix.temporary_caps_headers (tch_id) ON DELETE SET NULL,
  CONSTRAINT vwh_ven_fk FOREIGN KEY (vwh_ven_code) REFERENCES phenix.vendors (ven_code) ON DELETE CASCADE,
  CONSTRAINT vwh_whs_fk FOREIGN KEY (vwh_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.vendor_warehouses IS 'Table contenant les informations spécifique à un entrepôt';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_ship_days IS 'Indique le nombre de jours prévu pour la livraison';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_caps_processing_switch IS 'Indique que le fournisseur est traité présentement dans CAPS pour cet entrepôt';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_caps_last_verified IS 'Indique la date du dernier traitement dans CAPS pour ce fournisseur pour cet entrepôt';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_add_transport_switch IS 'Indique si on calculer le transport sur les achats';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_rou_code IS 'Indique le numéro de la route de ramassage du fournisseur';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_rou_position IS 'Indique le numéro de la route de ramassage du fournisseur';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_pickup_switch IS 'Indique si la commande faut être ramassée chez le fournisseur';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_avail_in_inventory_days IS 'Indique le nombre de jour entre la prise de possession et la disponibilité en inventaire';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_round_per_pallet_percent IS 'Indique le pourcentage maximum pouvant être ajouté à la quantité suggérée s''il permet l''arrondissement à la palette suivante lors des commandes d''achat';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_round_per_row_percent IS 'Indique le pourcentage maximum pouvant être ajouté à la quantité suggérée s''il permet l''arrondissement à la rangée suivante lors des commandes d''achat';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_replenish_nb_of_week IS 'Indique le nombre de semaines d''inventaire nécessaire en entrepôt pour ne pas commander';
COMMENT ON COLUMN phenix.vendor_warehouses.vwh_transport_days IS 'Indique le nombre de jours qui sépare le ramassage de la livraison (indice au transporteur)';