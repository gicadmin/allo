CREATE TABLE phenix.delivery_charge_grids (
  dcg_code NUMBER(5) NOT NULL,
  dcg_description VARCHAR2(30 BYTE) NOT NULL,
  dcg_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT dcg_pk PRIMARY KEY (dcg_code)
);
COMMENT ON TABLE phenix.delivery_charge_grids IS 'Table permettant de définir une grille de frais de livraison';
COMMENT ON COLUMN phenix.delivery_charge_grids.dcg_code IS 'Indique le code de la grille de frais de livraison';
COMMENT ON COLUMN phenix.delivery_charge_grids.dcg_description IS 'Indique la description de la grille de frais de livraison';
COMMENT ON COLUMN phenix.delivery_charge_grids.dcg_alt_description IS 'Indique la description alternative de la grille de frais de livraison';