CREATE TABLE phenix.temporary_placement_table (
  tpt_id NUMBER(15) NOT NULL,
  tpt_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  tpt_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  tpt_loc_code VARCHAR2(12 BYTE) NOT NULL,
  tpt_date DATE NOT NULL,
  tpt_rth_id VARCHAR2(10 BYTE) NOT NULL,
  tpt_total_reception_pallets NUMBER(2) NOT NULL,
  tpt_pallets_placed NUMBER(2) NOT NULL,
  tpt_pallets_to_place NUMBER(2) NOT NULL,
  CONSTRAINT tpt_pk PRIMARY KEY (tpt_id),
  CONSTRAINT tpt_loc_fk FOREIGN KEY (tpt_loc_code) REFERENCES phenix.locations (loc_code),
  CONSTRAINT tpt_prf_fk FOREIGN KEY (tpt_prf_prd_code,tpt_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.temporary_placement_table IS 'Table identifiant l''endroit où une palette sera placée dans les palettiers ouvert sur une face';
COMMENT ON COLUMN phenix.temporary_placement_table.tpt_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.temporary_placement_table.tpt_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.temporary_placement_table.tpt_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.temporary_placement_table.tpt_loc_code IS 'Indique le code de la localisation';
COMMENT ON COLUMN phenix.temporary_placement_table.tpt_date IS 'Indique la date de réception ou la date d''expiration';
COMMENT ON COLUMN phenix.temporary_placement_table.tpt_total_reception_pallets IS 'Indique le nombre total de palettes à placer';
COMMENT ON COLUMN phenix.temporary_placement_table.tpt_pallets_placed IS 'Indique le nombre de palettes placées';
COMMENT ON COLUMN phenix.temporary_placement_table.tpt_pallets_to_place IS 'Indique le nombre de palette à placer';