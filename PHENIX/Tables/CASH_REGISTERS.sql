CREATE TABLE phenix.cash_registers (
  cre_code NUMBER(2) NOT NULL,
  cre_description VARCHAR2(30 BYTE) NOT NULL,
  cre_alt_description VARCHAR2(30 BYTE),
  cre_prn_id NUMBER(15),
  cre_drawer_prn_id NUMBER(15),
  cre_open_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cre_open_switch_ck CHECK (CRE_OPEN_SWITCH IN (0,1)),
  cre_latest_open_date DATE,
  cre_latest_close_date DATE,
  cre_latest_use_code NUMBER(5),
  cre_actual_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  cre_limit_amount_flag VARCHAR2(1 BYTE) DEFAULT 'N' NOT NULL CONSTRAINT cre_limit_amount_flag_ck CHECK (CRE_LIMIT_AMOUNT_FLAG IN ('D','L','N')),
  cre_whs_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT cre_pk PRIMARY KEY (cre_code),
  CONSTRAINT cre_drawer_prn_id_fk FOREIGN KEY (cre_drawer_prn_id) REFERENCES phenix.printers (prn_id),
  CONSTRAINT cre_latest_use_fk FOREIGN KEY (cre_latest_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT cre_prn_id_fk FOREIGN KEY (cre_prn_id) REFERENCES phenix.printers (prn_id),
  CONSTRAINT cre_whs_fk FOREIGN KEY (cre_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON COLUMN phenix.cash_registers.cre_code IS 'Indique le code de la caisse enregistreuse';
COMMENT ON COLUMN phenix.cash_registers.cre_description IS 'Indique la description de la caisse enregistreuse';
COMMENT ON COLUMN phenix.cash_registers.cre_alt_description IS 'Indique la description alternative de la caisse enregistreuse';
COMMENT ON COLUMN phenix.cash_registers.cre_prn_id IS 'Indique le code de l’imprimente liée à la caisse enregistreuse';
COMMENT ON COLUMN phenix.cash_registers.cre_drawer_prn_id IS 'Indique l’imprimante liée au tiroir de la caisse enregistreuse';
COMMENT ON COLUMN phenix.cash_registers.cre_open_switch IS 'Indique le statut de la caisse enregistreuse';
COMMENT ON COLUMN phenix.cash_registers.cre_latest_open_date IS 'Indique la dernière date d’ouverture de la caisse enregistreuse';
COMMENT ON COLUMN phenix.cash_registers.cre_latest_close_date IS 'Indique la dernière date de férmeture de la caisse enregistreuse';
COMMENT ON COLUMN phenix.cash_registers.cre_latest_use_code IS 'Indique le dernier utulisateur qui a fait une transaction sur la caisse enregistreuse';
COMMENT ON COLUMN phenix.cash_registers.cre_actual_amount IS 'Indique le solde actuel présent dans la caisse en espèce.';
COMMENT ON COLUMN phenix.cash_registers.cre_limit_amount_flag IS 'Indique si la caisse a atteint la limite pour dépot,bloquée ou normal.';
COMMENT ON COLUMN phenix.cash_registers.cre_whs_code IS 'Indique le code d''entrepôt de la caisse enregistreuse';