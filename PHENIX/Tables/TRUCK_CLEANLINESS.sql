CREATE TABLE phenix.truck_cleanliness (
  tkc_code NUMBER(3) NOT NULL,
  tkc_description VARCHAR2(30 BYTE) NOT NULL,
  tkc_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT tkc_pk PRIMARY KEY (tkc_code)
);
COMMENT ON TABLE phenix.truck_cleanliness IS 'Table des propretés d''un camion de livraison';
COMMENT ON COLUMN phenix.truck_cleanliness.tkc_code IS 'Indique le code de la propreté du camion de livraison';
COMMENT ON COLUMN phenix.truck_cleanliness.tkc_description IS 'Indique la description de la propreté du camion de livraison';
COMMENT ON COLUMN phenix.truck_cleanliness.tkc_alt_description IS 'Indique la description alternative de la propreté du camion de livraison';