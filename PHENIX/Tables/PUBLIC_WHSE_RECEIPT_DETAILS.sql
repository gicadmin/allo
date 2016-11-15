CREATE TABLE phenix.public_whse_receipt_details (
  pwrd_id NUMBER(15) NOT NULL,
  pwrd_pwrh_id NUMBER(15) NOT NULL,
  pwrd_line_number NUMBER(5),
  pwrd_owner_product_code VARCHAR2(15 BYTE) NOT NULL,
  pwrd_format_code VARCHAR2(2 BYTE),
  pwrd_product_description VARCHAR2(45 BYTE),
  pwrd_quantity_ordered NUMBER(7) DEFAULT 0 NOT NULL,
  pwrd_rows_per_pallet NUMBER(3),
  pwrd_items_per_row NUMBER(3),
  pwrd_item_pack NUMBER(6),
  pwrd_vendor_product_code VARCHAR2(15 BYTE),
  pwrd_upc_code VARCHAR2(18 BYTE),
  CONSTRAINT pwrd_pk PRIMARY KEY (pwrd_id),
  CONSTRAINT pwrd_pwrh_fk FOREIGN KEY (pwrd_pwrh_id) REFERENCES phenix.public_whse_receipt_headers (pwrh_id)
);
COMMENT ON COLUMN phenix.public_whse_receipt_details.pwrd_id IS 'Indique la clé unique de la table';
COMMENT ON COLUMN phenix.public_whse_receipt_details.pwrd_pwrh_id IS 'Indique le numéro de l''en-tête de réception';
COMMENT ON COLUMN phenix.public_whse_receipt_details.pwrd_line_number IS 'Indique le numéro de ligne';
COMMENT ON COLUMN phenix.public_whse_receipt_details.pwrd_owner_product_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.public_whse_receipt_details.pwrd_format_code IS 'Indique le code de format';
COMMENT ON COLUMN phenix.public_whse_receipt_details.pwrd_product_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.public_whse_receipt_details.pwrd_quantity_ordered IS 'Indique la quantité totale à réceptionner';
COMMENT ON COLUMN phenix.public_whse_receipt_details.pwrd_rows_per_pallet IS 'Indique le nombre de rangées par palette';
COMMENT ON COLUMN phenix.public_whse_receipt_details.pwrd_items_per_row IS 'Indique le nombre d''items par rangée de palette';
COMMENT ON COLUMN phenix.public_whse_receipt_details.pwrd_item_pack IS 'Indique le nombre d''item dans le format';
COMMENT ON COLUMN phenix.public_whse_receipt_details.pwrd_vendor_product_code IS 'Indique le code de produit fournisseur';
COMMENT ON COLUMN phenix.public_whse_receipt_details.pwrd_upc_code IS 'Indique le code upc/ean/sku';