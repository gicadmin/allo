CREATE TABLE phenix.identifiers (
  ide_id NUMBER(12) NOT NULL,
  ide_prf_prd_code VARCHAR2(10 BYTE),
  ide_prf_fmt_code VARCHAR2(7 BYTE),
  ide_quantity NUMBER(5) CONSTRAINT ide_quantity_ck CHECK (IDE_QUANTITY > 0),
  ide_actual_loc_code VARCHAR2(12 BYTE),
  ide_destination_loc_code VARCHAR2(12 BYTE),
  ide_weight NUMBER(10,3),
  ide_expiry_date DATE,
  ide_fifo_date DATE,
  CONSTRAINT ide_pk PRIMARY KEY (ide_id),
  CONSTRAINT ide_actual_loc_fk FOREIGN KEY (ide_actual_loc_code) REFERENCES phenix.locations (loc_code),
  CONSTRAINT ide_destination_loc_fk FOREIGN KEY (ide_destination_loc_code) REFERENCES phenix.locations (loc_code),
  CONSTRAINT ide_prf_fk FOREIGN KEY (ide_prf_prd_code,ide_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.identifiers IS 'Table des identifiants  ';
COMMENT ON COLUMN phenix.identifiers.ide_id IS 'Indique le numéro de séquence  ';
COMMENT ON COLUMN phenix.identifiers.ide_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.identifiers.ide_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.identifiers.ide_quantity IS 'Indique la quantité associée à l''identifiant';
COMMENT ON COLUMN phenix.identifiers.ide_actual_loc_code IS 'Indique le code de la localisation courante';
COMMENT ON COLUMN phenix.identifiers.ide_destination_loc_code IS 'Indique le code de localisation quand l''identifiant est stocké';
COMMENT ON COLUMN phenix.identifiers.ide_weight IS 'Indique le poids du produit ';
COMMENT ON COLUMN phenix.identifiers.ide_expiry_date IS 'Indique la date d''expiration du produit associé à l''identifiant';
COMMENT ON COLUMN phenix.identifiers.ide_fifo_date IS 'Indique la date FIFO du produit associé à l''identifiant';