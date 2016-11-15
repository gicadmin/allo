CREATE TABLE phenix.inventory_count_transactions (
  ict_id NUMBER(15) NOT NULL,
  ict_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  ict_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  ict_original_quantity NUMBER(7),
  ict_count_quantity NUMBER(7),
  ict_original_weight NUMBER(10,3),
  ict_count_weight NUMBER(10,3),
  ict_use_code NUMBER(5) NOT NULL,
  ict_loc_code VARCHAR2(12 BYTE) NOT NULL,
  ict_start_date DATE NOT NULL,
  ict_end_date DATE NOT NULL,
  ict_expiry_date DATE,
  ict_cah_id NUMBER(15),
  ict_type VARCHAR2(1 BYTE) CONSTRAINT ict_type_ck CHECK (ict_type IN ('E','R','I','V','L','D','P','N','Z','S','C','T','M','A')),
  ict_iat_code NUMBER(3),
  ict_adj_comment VARCHAR2(100 BYTE),
  ict_ide_id NUMBER(12),
  ict_dmr_code NUMBER(3),
  ict_trh_id NUMBER(8),
  ict_whs_code VARCHAR2(2 BYTE) NOT NULL,
  ict_fifo_date DATE,
  ict_used_inventory_switch NUMBER(1) DEFAULT 0 NOT NULL,
  ict_quantity_left NUMBER(7),
  ict_weight_left NUMBER(10,3),
  CONSTRAINT ict_pk PRIMARY KEY (ict_id),
  CONSTRAINT ict_dmr_fk FOREIGN KEY (ict_dmr_code) REFERENCES phenix.damaged_reasons (dmr_code),
  CONSTRAINT ict_iat_fk FOREIGN KEY (ict_iat_code) REFERENCES phenix.inventory_adjustment_types (iat_code),
  CONSTRAINT ict_prf_fk FOREIGN KEY (ict_prf_prd_code,ict_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT ict_use_fk FOREIGN KEY (ict_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT ict_whs_fk FOREIGN KEY (ict_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.inventory_count_transactions IS 'La table des historiques des décomptes est utilisée pour le décompte et l''ajustement d''inventaire';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_prf_prd_code IS 'Code de produit';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_prf_fmt_code IS 'Code de format';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_original_quantity IS 'Quantité existante dans la localisation avant la procédure de décompte';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_count_quantity IS 'Quantité après la procédure de décompte';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_original_weight IS 'Poids existant dans la localisation avant la procédure de décompte';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_count_weight IS 'Poids après la procédure de décompte';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_use_code IS 'Code de l''usager';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_loc_code IS 'Localisation du décompte';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_start_date IS 'Date/heure du début du décompte';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_end_date IS 'Date/heure de fin du décompte';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_expiry_date IS 'Date d''expiration trouvée pendant ce décompte';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_cah_id IS 'Numéro de RMA relié au décompte';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_type IS 'Type de décompte';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_iat_code IS 'Code indiquant le type de crédit relié au décompte';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_adj_comment IS 'Commentaire';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_ide_id IS 'Indique le numéro d''identifiant';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_dmr_code IS 'Indique le numéro de la raison de bris';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_trh_id IS 'Indique le numéro de référence du transfert';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_whs_code IS 'Indique l''entrepôt où le décompte a eu lieu';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_fifo_date IS 'Indique la date FIFO du produit ajusté';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_used_inventory_switch IS 'Indique si la transaction de décompte a été utilisée dans l''inventaire';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_quantity_left IS 'Indique la quantité restante pour la transaction de décompte';
COMMENT ON COLUMN phenix.inventory_count_transactions.ict_weight_left IS 'Indique le poids restant pour la transaction de décompte';