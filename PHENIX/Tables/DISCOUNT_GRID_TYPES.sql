CREATE TABLE phenix.discount_grid_types (
  dgt_code NUMBER(5) NOT NULL,
  dgt_description VARCHAR2(30 BYTE) NOT NULL,
  dgt_alt_description VARCHAR2(30 BYTE),
  dgt_whs_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT dgt_pk PRIMARY KEY (dgt_code),
  CONSTRAINT dgt_whs_code_fk FOREIGN KEY (dgt_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.discount_grid_types IS 'Type de grille d''escomptes';
COMMENT ON COLUMN phenix.discount_grid_types.dgt_code IS 'Numéro de grille d''escompte';
COMMENT ON COLUMN phenix.discount_grid_types.dgt_description IS 'Description';
COMMENT ON COLUMN phenix.discount_grid_types.dgt_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.discount_grid_types.dgt_whs_code IS 'Indique quel entrepôt est utilisé pour le calcul des coûtants';