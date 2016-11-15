CREATE TABLE phenix.inventory_movements (
  inm_id NUMBER(15) NOT NULL,
  inm_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  inm_use_code NUMBER(5) NOT NULL,
  inm_from_loc_code VARCHAR2(12 BYTE) NOT NULL,
  inm_to_loc_code VARCHAR2(12 BYTE),
  inm_start_date DATE NOT NULL,
  inm_end_date DATE,
  inm_expiry_date DATE,
  inm_fifo_date DATE,
  inm_planned_switch NUMBER(1) NOT NULL CONSTRAINT inm_planned_switch_ck CHECK (INM_PLANNED_SWITCH IN (0,1)),
  inm_lot_switch NUMBER(1) NOT NULL CONSTRAINT inm_lot_switch_ck CHECK (inm_lot_switch IN (0, 1)),
  inm_prf_source_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  inm_prf_destination_fmt_code VARCHAR2(7 BYTE),
  inm_moved_quantity_in NUMBER(7),
  inm_moved_quantity_out NUMBER(7) NOT NULL,
  inm_moved_weight_in NUMBER(10,3),
  inm_moved_weight_out NUMBER(10,3) NOT NULL,
  inm_trans_type VARCHAR2(3 BYTE) NOT NULL CONSTRAINT inm_trans_type_ck CHECK (inm_trans_type IN ('MV2', 'MV1', 'RPZ', 'RRZ', 'RMM', 'RZN', 'RPR','RUR','RPV','TRP','SYS','CHG','CUE')),
  inm_src_loc_quantity_on_hand NUMBER(10),
  inm_dest_loc_quantity_on_hand NUMBER(10),
  inm_src_loc_weight_on_hand NUMBER(10,3),
  inm_dest_loc_weight_on_hand NUMBER(10,3),
  inm_source_ide_id NUMBER(12),
  inm_destination_ide_id NUMBER(12),
  inm_dmr_code NUMBER(3),
  inm_group_id NUMBER(15),
  inm_prf_destination_prd_code VARCHAR2(10 BYTE),
  inm_whs_code VARCHAR2(2 BYTE) NOT NULL,
  inm_used_inventory_switch NUMBER(1) DEFAULT 0 NOT NULL,
  inm_quantity_left NUMBER(7),
  inm_weight_left NUMBER(10,3),
  CONSTRAINT inm_pk PRIMARY KEY (inm_id),
  CONSTRAINT inm_dest_prf_fk FOREIGN KEY (inm_prf_destination_prd_code,inm_prf_destination_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT inm_dmr_fk FOREIGN KEY (inm_dmr_code) REFERENCES phenix.damaged_reasons (dmr_code),
  CONSTRAINT inm_source_prf_fk FOREIGN KEY (inm_prf_prd_code,inm_prf_source_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT inm_use_fk FOREIGN KEY (inm_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT inm_whs_fk FOREIGN KEY (inm_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.inventory_movements IS 'La table des historiques des déplacements est utilisée pour garder une trace des déplacements et des réapprovisionnements d''inventaires';
COMMENT ON COLUMN phenix.inventory_movements.inm_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.inventory_movements.inm_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.inventory_movements.inm_use_code IS 'Indique le code de l''utilisateur relié à cette transaction';
COMMENT ON COLUMN phenix.inventory_movements.inm_from_loc_code IS 'Indique le code de la localisation d''origine';
COMMENT ON COLUMN phenix.inventory_movements.inm_to_loc_code IS 'Indique le code de la localisation de destination';
COMMENT ON COLUMN phenix.inventory_movements.inm_start_date IS 'Indique la date du début de la transaction';
COMMENT ON COLUMN phenix.inventory_movements.inm_end_date IS 'Indique la date de fin de la transaction';
COMMENT ON COLUMN phenix.inventory_movements.inm_expiry_date IS 'Indique la date d''expiration reliée à la transaction de déplacement';
COMMENT ON COLUMN phenix.inventory_movements.inm_fifo_date IS 'Indique la date pour gérer la rotation de l''inventaire';
COMMENT ON COLUMN phenix.inventory_movements.inm_planned_switch IS 'Indique si le mouvement d''inventaire est planifié';
COMMENT ON COLUMN phenix.inventory_movements.inm_lot_switch IS 'Indique la gestion par LOT';
COMMENT ON COLUMN phenix.inventory_movements.inm_prf_source_fmt_code IS 'Indique le code du format du produit sortant';
COMMENT ON COLUMN phenix.inventory_movements.inm_prf_destination_fmt_code IS 'Indique le code du format du produit entrant';
COMMENT ON COLUMN phenix.inventory_movements.inm_moved_quantity_in IS 'Indique la quantité déplacée à la localisation';
COMMENT ON COLUMN phenix.inventory_movements.inm_moved_quantity_out IS 'Indique la quantité déplacée de la localisation';
COMMENT ON COLUMN phenix.inventory_movements.inm_moved_weight_in IS 'Indique le poids déplacé à la localisation';
COMMENT ON COLUMN phenix.inventory_movements.inm_moved_weight_out IS 'Indique le poids déplacé de la localisation';
COMMENT ON COLUMN phenix.inventory_movements.inm_trans_type IS 'Indique le type du déplacement';
COMMENT ON COLUMN phenix.inventory_movements.inm_src_loc_quantity_on_hand IS 'Indique la quantité en inventaire de ce produit dans la localisation source';
COMMENT ON COLUMN phenix.inventory_movements.inm_dest_loc_quantity_on_hand IS 'Indique la quantité en inventaire de ce produit dans la localisation destination';
COMMENT ON COLUMN phenix.inventory_movements.inm_src_loc_weight_on_hand IS 'Indique le poids en inventaire de ce produit dans la localisation source';
COMMENT ON COLUMN phenix.inventory_movements.inm_dest_loc_weight_on_hand IS 'Indique le poids en inventaire de ce produit dans la localisation destination';
COMMENT ON COLUMN phenix.inventory_movements.inm_source_ide_id IS 'Indique l''identifiant de la localisation source';
COMMENT ON COLUMN phenix.inventory_movements.inm_destination_ide_id IS 'Indique l''identifiant de la localisation de destination';
COMMENT ON COLUMN phenix.inventory_movements.inm_dmr_code IS 'Indique le numéro de la raison de bris';
COMMENT ON COLUMN phenix.inventory_movements.inm_group_id IS 'Indique l''identifiant pour regrouper les mêmes transactions';
COMMENT ON COLUMN phenix.inventory_movements.inm_prf_destination_prd_code IS 'Indique le produit de destination';
COMMENT ON COLUMN phenix.inventory_movements.inm_whs_code IS 'Indique l''entrepôt où le mouvement(déplacement) a eu lieu';
COMMENT ON COLUMN phenix.inventory_movements.inm_used_inventory_switch IS 'Indique si la transaction de déplacement a été utilisée dans l''inventaire';
COMMENT ON COLUMN phenix.inventory_movements.inm_quantity_left IS 'Indique la quantité restante pour la transaction de déplacement';
COMMENT ON COLUMN phenix.inventory_movements.inm_weight_left IS 'Indique le poids restant pour la transaction de déplacement';