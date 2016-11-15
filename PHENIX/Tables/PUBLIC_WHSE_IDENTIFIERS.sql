CREATE TABLE phenix.public_whse_identifiers (
  pwid_id NUMBER(15) NOT NULL,
  pwid_pwrd_id NUMBER(15) NOT NULL,
  pwid_lot_code VARCHAR2(20 BYTE),
  pwid_expiry_date DATE,
  pwid_identifier NUMBER(12) NOT NULL,
  pwid_loc_code VARCHAR2(12 BYTE) NOT NULL,
  pwid_quantity NUMBER(7) NOT NULL,
  pwid_use_reception_code NUMBER(5) NOT NULL,
  pwid_reception_date DATE NOT NULL,
  pwid_pwpd_id NUMBER(15),
  pwid_pick_date DATE,
  pwid_use_pick_code NUMBER(5),
  CONSTRAINT pwid_identifier_uk UNIQUE (pwid_identifier),
  CONSTRAINT pwid_pk PRIMARY KEY (pwid_id),
  CONSTRAINT pwid_pwpd_fk FOREIGN KEY (pwid_pwpd_id) REFERENCES phenix.public_whse_pick_details (pwpd_id),
  CONSTRAINT pwid_pwrd_fk FOREIGN KEY (pwid_pwrd_id) REFERENCES phenix.public_whse_receipt_details (pwrd_id),
  CONSTRAINT pwid_use_pick_fk FOREIGN KEY (pwid_use_pick_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT pwid_use_reception_fk FOREIGN KEY (pwid_use_reception_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON COLUMN phenix.public_whse_identifiers.pwid_id IS 'Indique la clé unique de la table';
COMMENT ON COLUMN phenix.public_whse_identifiers.pwid_pwrd_id IS 'Indique l''identifiant de la ligne de réception';
COMMENT ON COLUMN phenix.public_whse_identifiers.pwid_lot_code IS 'Indique le numéro de lot';
COMMENT ON COLUMN phenix.public_whse_identifiers.pwid_expiry_date IS 'Indique la date d''expiration';
COMMENT ON COLUMN phenix.public_whse_identifiers.pwid_identifier IS 'Indique l''identifiant de la palette';
COMMENT ON COLUMN phenix.public_whse_identifiers.pwid_loc_code IS 'Indique le code de la localisation de l''entreposage';
COMMENT ON COLUMN phenix.public_whse_identifiers.pwid_quantity IS 'Indique la quantité sur la palette';
COMMENT ON COLUMN phenix.public_whse_identifiers.pwid_use_reception_code IS 'Indique le code de l''utilisateur qui a fait la réception';
COMMENT ON COLUMN phenix.public_whse_identifiers.pwid_reception_date IS 'Indique la date de la réception';
COMMENT ON COLUMN phenix.public_whse_identifiers.pwid_pwpd_id IS 'Indique l''identifiant de la ligne de cueillette';
COMMENT ON COLUMN phenix.public_whse_identifiers.pwid_pick_date IS 'Indique la date de cueillette';
COMMENT ON COLUMN phenix.public_whse_identifiers.pwid_use_pick_code IS 'Indique le code de l''utilisateur qui a fait la cueillette';