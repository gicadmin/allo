CREATE TABLE phenix.receipt_headers (
  rch_ven_code NUMBER(5) NOT NULL,
  rch_number VARCHAR2(15 BYTE) NOT NULL,
  rch_source VARCHAR2(1 BYTE) NOT NULL CONSTRAINT rch_source_ck CHECK (RCH_SOURCE in ('I', 'S', 'L')),
  rch_lock_switch NUMBER(1) NOT NULL CONSTRAINT rch_lock_switch_ck CHECK (RCH_LOCK_SWITCH IN (0, 1)),
  rch_open_switch NUMBER(1) NOT NULL CONSTRAINT rch_open_switch_ck CHECK (RCH_OPEN_SWITCH IN (0, 1)),
  rch_use_code NUMBER(5),
  rch_date DATE NOT NULL,
  rch_use_lock_code NUMBER(5),
  rch_rth_id NUMBER(15),
  rch_status VARCHAR2(1 BYTE) NOT NULL CONSTRAINT rch_status_ck CHECK (rch_status IN ('O', 'R', 'A', 'F')),
  rch_whs_code VARCHAR2(2 BYTE) NOT NULL,
  rch_on_error_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT rch_on_error_switch_ck CHECK (RCH_ON_ERROR_SWITCH IN (0,1)),
  CONSTRAINT rch_pk PRIMARY KEY (rch_ven_code,rch_number,rch_source),
  CONSTRAINT rch_rth_fk FOREIGN KEY (rch_rth_id) REFERENCES phenix.receipt_transaction_headers (rth_id),
  CONSTRAINT rch_use_fk FOREIGN KEY (rch_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT rch_use_lock_fk FOREIGN KEY (rch_use_lock_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT rch_ven_fk FOREIGN KEY (rch_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT rch_whs_fk FOREIGN KEY (rch_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.receipt_headers IS 'Entête de réception';
COMMENT ON COLUMN phenix.receipt_headers.rch_ven_code IS 'Numéro de fournisseur';
COMMENT ON COLUMN phenix.receipt_headers.rch_number IS 'Numéro de réception';
COMMENT ON COLUMN phenix.receipt_headers.rch_source IS 'Indique si l''enregistrement fut créé électroniquement ou via l''application';
COMMENT ON COLUMN phenix.receipt_headers.rch_lock_switch IS 'Indique le record est utilisé par un autre usager';
COMMENT ON COLUMN phenix.receipt_headers.rch_open_switch IS 'Indique si la réception est ouverte';
COMMENT ON COLUMN phenix.receipt_headers.rch_use_code IS 'Numéro de l''usager (Vérificateur)';
COMMENT ON COLUMN phenix.receipt_headers.rch_date IS 'Date de création de l''enregistrement';
COMMENT ON COLUMN phenix.receipt_headers.rch_use_lock_code IS 'Code usager qui block accès à l''enregistrement';
COMMENT ON COLUMN phenix.receipt_headers.rch_rth_id IS 'Numéro d''en-tête des historiques de réception';
COMMENT ON COLUMN phenix.receipt_headers.rch_status IS 'Statut';
COMMENT ON COLUMN phenix.receipt_headers.rch_whs_code IS 'Indique l''entrepôt où a eu  lieu la réception';
COMMENT ON COLUMN phenix.receipt_headers.rch_on_error_switch IS 'Indique si le ASN re]u par EDI est erroné partiellement';