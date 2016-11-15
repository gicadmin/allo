CREATE TABLE phenix.fuel_surcharge_grids (
  fsg_code NUMBER(5) NOT NULL,
  fsg_description VARCHAR2(30 BYTE) NOT NULL,
  fsg_alt_description VARCHAR2(30 BYTE),
  fsg_surcharge_method VARCHAR2(1 BYTE) DEFAULT 'D' NOT NULL CONSTRAINT fsg_surcharge_method_ck CHECK (fsg_surcharge_method IN ('D', 'P')),
  CONSTRAINT fsg_pk PRIMARY KEY (fsg_code)
);
COMMENT ON TABLE phenix.fuel_surcharge_grids IS 'Table permettant de définir une grille de surcharge de carburant';
COMMENT ON COLUMN phenix.fuel_surcharge_grids.fsg_code IS 'Indique le code de la grille de surcharge de carburant';
COMMENT ON COLUMN phenix.fuel_surcharge_grids.fsg_description IS 'Indique la description de la grille de surcharge de carburant';
COMMENT ON COLUMN phenix.fuel_surcharge_grids.fsg_alt_description IS 'Indique la description alternative de la grille de surcharge de carburant';
COMMENT ON COLUMN phenix.fuel_surcharge_grids.fsg_surcharge_method IS 'Indique si les surcharges de carburant de cette grille sont saisies en dollar ou en pourcentage';