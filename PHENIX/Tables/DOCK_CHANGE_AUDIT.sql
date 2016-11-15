CREATE TABLE phenix.dock_change_audit (
  sda_id NUMBER(15) NOT NULL,
  sda_orig_dock_code VARCHAR2(12 BYTE) NOT NULL,
  sda_cus_code NUMBER,
  sda_ven_code NUMBER,
  sda_change_date DATE DEFAULT SYSDATE NOT NULL,
  sda_trans_type VARCHAR2(3 BYTE) NOT NULL,
  sda_new_dock_code VARCHAR2(12 BYTE) NOT NULL,
  CONSTRAINT sda_pk PRIMARY KEY (sda_id) USING INDEX (CREATE UNIQUE INDEX phenix.sda_pk_i ON phenix.dock_change_audit(sda_id)    )
);
COMMENT ON TABLE phenix.dock_change_audit IS 'Table des traces de modification de conteneur';
COMMENT ON COLUMN phenix.dock_change_audit.sda_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.dock_change_audit.sda_orig_dock_code IS 'Indique le code de quai avant transaction';
COMMENT ON COLUMN phenix.dock_change_audit.sda_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.dock_change_audit.sda_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.dock_change_audit.sda_change_date IS 'Indique la date de changement du conteneur';
COMMENT ON COLUMN phenix.dock_change_audit.sda_trans_type IS 'Indique la type de transaction';
COMMENT ON COLUMN phenix.dock_change_audit.sda_new_dock_code IS 'Indique le Code de quai après transaction';