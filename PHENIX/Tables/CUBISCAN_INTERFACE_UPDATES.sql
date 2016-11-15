CREATE TABLE phenix.cubiscan_interface_updates (
  ciu_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  ciu_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  ciu_prf_height NUMBER(8,3) NOT NULL,
  ciu_prf_width NUMBER(8,3) NOT NULL,
  ciu_prf_length NUMBER(8,3) NOT NULL,
  ciu_prf_purchase_weight NUMBER(8,3) NOT NULL,
  ciu_prf_upc_code VARCHAR2(18 BYTE),
  ciu_attribute_last_update_date DATE DEFAULT SYSDATE NOT NULL,
  ciu_loc_code VARCHAR2(12 BYTE),
  CONSTRAINT ciu_pk PRIMARY KEY (ciu_prf_prd_code,ciu_prf_fmt_code) USING INDEX (CREATE INDEX phenix.ciu_pk ON phenix.cubiscan_interface_updates(ciu_prf_prd_code,ciu_prf_fmt_code)    ),
  CONSTRAINT ciu_prf_fk FOREIGN KEY (ciu_prf_prd_code,ciu_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.cubiscan_interface_updates IS 'Table pour les données du cubiscan à valider';
COMMENT ON COLUMN phenix.cubiscan_interface_updates.ciu_prf_prd_code IS 'Indique le code du produit ';
COMMENT ON COLUMN phenix.cubiscan_interface_updates.ciu_prf_fmt_code IS 'Indique le format du produit';
COMMENT ON COLUMN phenix.cubiscan_interface_updates.ciu_prf_height IS 'Indique la hauteur du produit';
COMMENT ON COLUMN phenix.cubiscan_interface_updates.ciu_prf_width IS 'Indique la largeur du produit';
COMMENT ON COLUMN phenix.cubiscan_interface_updates.ciu_prf_length IS 'Indique la longueur du produit';
COMMENT ON COLUMN phenix.cubiscan_interface_updates.ciu_prf_purchase_weight IS 'Indique le poids du produit';
COMMENT ON COLUMN phenix.cubiscan_interface_updates.ciu_prf_upc_code IS 'Indique le code UPC du produit';
COMMENT ON COLUMN phenix.cubiscan_interface_updates.ciu_attribute_last_update_date IS 'Indique la date de la dernière pesée du produit format avec le cubiscan ';
COMMENT ON COLUMN phenix.cubiscan_interface_updates.ciu_loc_code IS 'Indique la localisation de cueillette du produit.';