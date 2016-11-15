CREATE TABLE phenix.transaction_by_lot_log_modifs (
  tlm_id NUMBER(15) NOT NULL,
  tlm_tbl_id NUMBER(15) NOT NULL,
  tlm_name_field VARCHAR2(30 BYTE) NOT NULL,
  tlm_before_modif VARCHAR2(100 BYTE),
  tlm_after_modif VARCHAR2(100 BYTE),
  tlm_modification_date DATE NOT NULL,
  tlm_modification_source VARCHAR2(50 BYTE) NOT NULL,
  tlm_use_code NUMBER(5) NOT NULL,
  CONSTRAINT tlm_pk PRIMARY KEY (tlm_id),
  CONSTRAINT tlm_tbl_fk FOREIGN KEY (tlm_tbl_id) REFERENCES phenix.transaction_by_lot (tbl_id),
  CONSTRAINT tlm_use_fk FOREIGN KEY (tlm_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.transaction_by_lot_log_modifs IS 'Table contenant les log de modification des transactions par lot';
COMMENT ON COLUMN phenix.transaction_by_lot_log_modifs.tlm_id IS 'Indique l''identifiant du log de modification';
COMMENT ON COLUMN phenix.transaction_by_lot_log_modifs.tlm_tbl_id IS 'Indique l''identifiant de la transaction par lot';
COMMENT ON COLUMN phenix.transaction_by_lot_log_modifs.tlm_name_field IS 'Indique le nom de la rubrique modifiée';
COMMENT ON COLUMN phenix.transaction_by_lot_log_modifs.tlm_before_modif IS 'Indique la valeur de la rubrique avant la modification';
COMMENT ON COLUMN phenix.transaction_by_lot_log_modifs.tlm_after_modif IS 'Indique la valeur de la rubrique après la modification';
COMMENT ON COLUMN phenix.transaction_by_lot_log_modifs.tlm_modification_date IS 'Indique la date de la modification';
COMMENT ON COLUMN phenix.transaction_by_lot_log_modifs.tlm_modification_source IS 'Indique la source de la modification';
COMMENT ON COLUMN phenix.transaction_by_lot_log_modifs.tlm_use_code IS 'Indique l''usager qui a fait la modification';