CREATE TABLE phenix.stats_tracking_warehouses (
  stw_stt_code VARCHAR2(6 BYTE) NOT NULL,
  stw_whs_code VARCHAR2(10 BYTE) NOT NULL,
  stw_ship_to_id VARCHAR2(10 BYTE),
  stw_sender_id VARCHAR2(3 BYTE),
  stw_sequence_number NUMBER(6) DEFAULT 1,
  stw_use_contact_code NUMBER(5),
  CONSTRAINT stw_pk PRIMARY KEY (stw_stt_code,stw_whs_code) USING INDEX (CREATE INDEX phenix.stw_pk ON phenix.stats_tracking_warehouses(stw_stt_code,stw_whs_code)    ),
  CONSTRAINT stw_stt_fk FOREIGN KEY (stw_stt_code) REFERENCES phenix.statistics_tracking_types (stt_code),
  CONSTRAINT stw_use_fk FOREIGN KEY (stw_use_contact_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT stw_whs_fk FOREIGN KEY (stw_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.stats_tracking_warehouses IS 'Table pour les types des statistiques par entrepôt';
COMMENT ON COLUMN phenix.stats_tracking_warehouses.stw_stt_code IS 'Indique le code du type des statistiques';
COMMENT ON COLUMN phenix.stats_tracking_warehouses.stw_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.stats_tracking_warehouses.stw_ship_to_id IS 'Indique le code d''identification de l'' expéditeur pour le suivi des statistiques';
COMMENT ON COLUMN phenix.stats_tracking_warehouses.stw_sender_id IS 'Indique le code expéditeur du type de suivi des statistiques';
COMMENT ON COLUMN phenix.stats_tracking_warehouses.stw_sequence_number IS 'Indique la sequence pour fichier d extraction';
COMMENT ON COLUMN phenix.stats_tracking_warehouses.stw_use_contact_code IS 'Indique le code utilisateur du contact de l''expéditeur';