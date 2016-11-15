CREATE TABLE phenix.alternate_product_codes (
  apc_code VARCHAR2(30 BYTE) NOT NULL,
  apc_prd_code VARCHAR2(10 BYTE) NOT NULL,
  CONSTRAINT apc_pk PRIMARY KEY (apc_code,apc_prd_code),
  CONSTRAINT apc_prd_fk FOREIGN KEY (apc_prd_code) REFERENCES phenix.products (prd_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.alternate_product_codes IS 'Définition des codes alternatifs pour identifier un produit.';
COMMENT ON COLUMN phenix.alternate_product_codes.apc_code IS 'Code alternatif pour identifier un produit, ou un produit format';
COMMENT ON COLUMN phenix.alternate_product_codes.apc_prd_code IS 'Code de produit identifié par le code alternatif';