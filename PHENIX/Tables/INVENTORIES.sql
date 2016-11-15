CREATE TABLE phenix.inventories (
  inv_id NUMBER(15) NOT NULL,
  inv_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  inv_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  inv_loc_code VARCHAR2(12 BYTE) NOT NULL,
  inv_quantity_on_hand NUMBER(7),
  inv_weight_on_hand NUMBER(10,3),
  inv_quantity_in NUMBER(7),
  inv_weight_in NUMBER(10,3),
  inv_quantity_out NUMBER(7),
  inv_weight_out NUMBER(10,3),
  inv_quantity_on_hold NUMBER(7),
  inv_weight_on_hold NUMBER(10,3),
  inv_in_date DATE,
  inv_quantity_max NUMBER(7),
  inv_last_pick_date DATE,
  inv_last_count_date DATE,
  inv_fifo_date DATE,
  inv_expiry_date DATE,
  inv_quantity_min NUMBER(7),
  inv_weight_max NUMBER(10,3),
  inv_weight_min NUMBER(10,3),
  inv_out_date DATE,
  inv_quantity_moved_in NUMBER(7),
  inv_quantity_moved_out NUMBER(7),
  inv_weight_moved_out NUMBER(10,3),
  inv_trans_type VARCHAR2(3 BYTE) CONSTRAINT inv_trans_type_ck CHECK (inv_trans_type IN ('RPO','RMA','PIC','MV1','MV2','RUR','RPV','RPR', 'TRP')),
  inv_creation_date DATE DEFAULT SYSDATE NOT NULL,
  inv_last_modification_date DATE DEFAULT SYSDATE NOT NULL,
  inv_on_hold_date DATE,
  CONSTRAINT inv_pk PRIMARY KEY (inv_id),
  CONSTRAINT inv_uk UNIQUE (inv_prf_prd_code,inv_prf_fmt_code,inv_loc_code),
  CONSTRAINT inv_loc_fk FOREIGN KEY (inv_loc_code) REFERENCES phenix.locations (loc_code),
  CONSTRAINT inv_prf_fk FOREIGN KEY (inv_prf_prd_code,inv_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.inventories IS 'La table d''inventaire';
COMMENT ON COLUMN phenix.inventories.inv_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.inventories.inv_prf_prd_code IS 'Code du produit';
COMMENT ON COLUMN phenix.inventories.inv_prf_fmt_code IS 'Code du format';
COMMENT ON COLUMN phenix.inventories.inv_loc_code IS 'Numéro de la localisation';
COMMENT ON COLUMN phenix.inventories.inv_quantity_on_hand IS 'Quantité en inventaire';
COMMENT ON COLUMN phenix.inventories.inv_weight_on_hand IS 'Poids en inventaire';
COMMENT ON COLUMN phenix.inventories.inv_quantity_in IS 'Quantité entrante';
COMMENT ON COLUMN phenix.inventories.inv_weight_in IS 'Poids entrant';
COMMENT ON COLUMN phenix.inventories.inv_quantity_out IS 'Quantité sortante';
COMMENT ON COLUMN phenix.inventories.inv_weight_out IS 'Poids sortant';
COMMENT ON COLUMN phenix.inventories.inv_quantity_on_hold IS 'Quantité en retenue';
COMMENT ON COLUMN phenix.inventories.inv_weight_on_hold IS 'Poids en retenu';
COMMENT ON COLUMN phenix.inventories.inv_in_date IS 'Date de la dernière mise en localisation';
COMMENT ON COLUMN phenix.inventories.inv_quantity_max IS 'Quantité maximum pour la localisation';
COMMENT ON COLUMN phenix.inventories.inv_last_pick_date IS 'Date de la dernière cueillette';
COMMENT ON COLUMN phenix.inventories.inv_last_count_date IS 'Date du dernier décompte';
COMMENT ON COLUMN phenix.inventories.inv_fifo_date IS 'Date de la réception';
COMMENT ON COLUMN phenix.inventories.inv_expiry_date IS 'Date d''expiration du produit';
COMMENT ON COLUMN phenix.inventories.inv_quantity_min IS 'Quantité minimum pour la localisation';
COMMENT ON COLUMN phenix.inventories.inv_weight_max IS 'Poids maximum pour la localisation';
COMMENT ON COLUMN phenix.inventories.inv_weight_min IS 'Poids minimum pour la localisation';
COMMENT ON COLUMN phenix.inventories.inv_out_date IS 'Date de la dernière sortie de localisation';
COMMENT ON COLUMN phenix.inventories.inv_quantity_moved_in IS 'Quantité entrée à la localisation';
COMMENT ON COLUMN phenix.inventories.inv_quantity_moved_out IS 'Quantité sortie de la localisation';
COMMENT ON COLUMN phenix.inventories.inv_weight_moved_out IS 'Poids sorti de la localisation';
COMMENT ON COLUMN phenix.inventories.inv_trans_type IS 'Indique la transaction pour une localisation d''utilisateur';
COMMENT ON COLUMN phenix.inventories.inv_creation_date IS 'Indique la date de création de la ligne d''inventaire';
COMMENT ON COLUMN phenix.inventories.inv_last_modification_date IS 'Indique la date de modification de la ligne d''inventaire';
COMMENT ON COLUMN phenix.inventories.inv_on_hold_date IS 'Indique la date à laquelle la localisation a été mise en retenue';