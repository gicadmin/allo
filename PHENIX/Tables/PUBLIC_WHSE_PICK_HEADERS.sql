CREATE TABLE phenix.public_whse_pick_headers (
  pwph_id NUMBER(15) NOT NULL,
  pwph_pwo_code VARCHAR2(10 BYTE) NOT NULL,
  pwph_whs_code VARCHAR2(2 BYTE) NOT NULL,
  pwph_picking_number VARCHAR2(15 BYTE) NOT NULL,
  pwph_requested_ship_date DATE,
  pwph_creation_date DATE DEFAULT SYSDATE NOT NULL,
  pwph_order_number VARCHAR2(22 BYTE),
  pwph_site_number VARCHAR2(10 BYTE),
  pwph_enterprise_name VARCHAR2(35 BYTE),
  pwph_account_id VARCHAR2(15 BYTE),
  pwph_address VARCHAR2(45 BYTE),
  pwph_city VARCHAR2(30 BYTE),
  pwph_prv_code VARCHAR2(2 BYTE),
  pwph_postal_code VARCHAR2(10 BYTE),
  pwph_transport_method VARCHAR2(2 BYTE),
  pwph_closed_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pwph_closed_switch_ck CHECK (PWPH_CLOSED_SWITCH IN (0,1)),
  CONSTRAINT pwph_pk PRIMARY KEY (pwph_id),
  CONSTRAINT pwph_pwo_pick_uk UNIQUE (pwph_pwo_code,pwph_picking_number),
  CONSTRAINT pwph_prv_fk FOREIGN KEY (pwph_prv_code) REFERENCES phenix.provinces (prv_code),
  CONSTRAINT pwph_pwo_fk FOREIGN KEY (pwph_pwo_code) REFERENCES phenix.public_whse_owners (pwo_code),
  CONSTRAINT pwph_whs_fk FOREIGN KEY (pwph_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_id IS 'Indique la clé unique de la table';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_pwo_code IS 'Indique le code du propriétaire';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_picking_number IS 'Indique le numéro de référence de cueillette';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_requested_ship_date IS 'Indique la date requise pour expédier la marchandise';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_creation_date IS 'Indique la date de création de l''enregistrement';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_order_number IS 'Indique le numéro de référence';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_site_number IS 'Indique l''entrepôt ou magasin de destination';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_enterprise_name IS 'Indique le nom du destinataire';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_account_id IS 'Indique le code de l''entreprise de destination, chez le propriétaire';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_address IS 'Indique l''adresse de destination';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_city IS 'Indique la ville de destination';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_prv_code IS 'Indique la province de destination';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_postal_code IS 'Indique le code postal de destination';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_transport_method IS 'Indique la méthode de transport';
COMMENT ON COLUMN phenix.public_whse_pick_headers.pwph_closed_switch IS 'Indique si la cueillette est fermée';