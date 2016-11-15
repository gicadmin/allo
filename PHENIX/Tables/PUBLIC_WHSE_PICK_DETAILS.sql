CREATE TABLE phenix.public_whse_pick_details (
  pwpd_id NUMBER(15) NOT NULL,
  pwpd_pwph_id NUMBER(15) NOT NULL,
  pwpd_line_number NUMBER(5),
  pwpd_owner_product_code VARCHAR2(15 BYTE) NOT NULL,
  pwpd_format_code VARCHAR2(2 BYTE),
  pwpd_product_description VARCHAR2(45 BYTE),
  pwpd_quantity_to_pick NUMBER(7) DEFAULT 0 NOT NULL,
  pwpd_item_pack NUMBER(6),
  pwpd_vendor_product_code VARCHAR2(15 BYTE),
  pwpd_upc_code VARCHAR2(18 BYTE),
  CONSTRAINT pwpd_pk PRIMARY KEY (pwpd_id),
  CONSTRAINT pwpd_pwph_fk FOREIGN KEY (pwpd_pwph_id) REFERENCES phenix.public_whse_pick_headers (pwph_id)
);
COMMENT ON COLUMN phenix.public_whse_pick_details.pwpd_id IS 'Indique la clé unique de la table';
COMMENT ON COLUMN phenix.public_whse_pick_details.pwpd_pwph_id IS 'Indique le numéro de cueillette';
COMMENT ON COLUMN phenix.public_whse_pick_details.pwpd_line_number IS 'Indique le numéro de ligne';
COMMENT ON COLUMN phenix.public_whse_pick_details.pwpd_owner_product_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.public_whse_pick_details.pwpd_format_code IS 'Indique le code de format';
COMMENT ON COLUMN phenix.public_whse_pick_details.pwpd_product_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.public_whse_pick_details.pwpd_quantity_to_pick IS 'Indique la quantité totale à cueillir';
COMMENT ON COLUMN phenix.public_whse_pick_details.pwpd_item_pack IS 'Indique le nombre d''item dans le format';
COMMENT ON COLUMN phenix.public_whse_pick_details.pwpd_vendor_product_code IS 'Indique le code de produit fournisseur';
COMMENT ON COLUMN phenix.public_whse_pick_details.pwpd_upc_code IS 'Indique le code upc/ean/sku';