CREATE TABLE phenix.public_whse_receipt_headers (
  pwrh_id NUMBER(15) NOT NULL,
  pwrh_pwo_code VARCHAR2(10 BYTE) NOT NULL,
  pwrh_whs_code VARCHAR2(2 BYTE) NOT NULL,
  pwrh_receipt_number VARCHAR2(22 BYTE) NOT NULL,
  pwrh_po_number VARCHAR2(22 BYTE),
  pwrh_project_reception_date DATE,
  pwrh_creation_date DATE DEFAULT SYSDATE NOT NULL,
  pwrh_site_number VARCHAR2(10 BYTE),
  pwrh_account_id VARCHAR2(15 BYTE),
  pwrh_enterprise_name VARCHAR2(35 BYTE),
  pwrh_address VARCHAR2(45 BYTE),
  pwrh_city VARCHAR2(30 BYTE),
  pwrh_prv_code VARCHAR2(2 BYTE),
  pwrh_postal_code VARCHAR2(10 BYTE),
  pwrh_transport_method VARCHAR2(2 BYTE),
  pwrh_scac_code VARCHAR2(4 BYTE),
  pwrh_seal_number VARCHAR2(15 BYTE),
  pwrh_seal_status VARCHAR2(2 BYTE),
  pwrh_closed_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pwrh_closed_switch_ck CHECK (PWRH_CLOSED_SWITCH IN (0,1)),
  CONSTRAINT pwrh_pk PRIMARY KEY (pwrh_id),
  CONSTRAINT pwrh_pwo_receipt_uk UNIQUE (pwrh_pwo_code,pwrh_receipt_number),
  CONSTRAINT pwrh_prv_fk FOREIGN KEY (pwrh_prv_code) REFERENCES phenix.provinces (prv_code),
  CONSTRAINT pwrh_pwo_fk FOREIGN KEY (pwrh_pwo_code) REFERENCES phenix.public_whse_owners (pwo_code),
  CONSTRAINT pwrh_whs_fk FOREIGN KEY (pwrh_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_id IS 'Indique la clé unique de la table';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_pwo_code IS 'Indique le code du propriétaire';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_receipt_number IS 'Indique le numéro de réception (PPP)';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_po_number IS 'Indique le numéro de commande';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_project_reception_date IS 'Indique la date prévue pour la réception';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_creation_date IS 'Indique la date de création de l''enregistrement';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_site_number IS 'Indique l''entrepôt d''origine';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_account_id IS 'Indique le code de l''entreprise source, chez le propriétaire';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_enterprise_name IS 'Indique le nom de l''entreprise d''origine, chez le propriétaire';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_address IS 'Indique l''adresse d''origine';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_city IS 'Indique la ville d''origine';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_prv_code IS 'Indique la province d''origine';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_postal_code IS 'Indique le code postal d''origine';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_transport_method IS 'Indique la méthode de transport';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_scac_code IS 'Indique le code de transporteur standard';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_seal_number IS 'Indique le numéro du scellé';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_seal_status IS 'Indique la condition du scellé';
COMMENT ON COLUMN phenix.public_whse_receipt_headers.pwrh_closed_switch IS 'Indique si la réception est fermée';