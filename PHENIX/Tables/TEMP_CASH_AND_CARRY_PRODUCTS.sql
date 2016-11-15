CREATE TABLE phenix.temp_cash_and_carry_products (
  tcc_sid NUMBER,
  tcc_prf_prd_code VARCHAR2(10 BYTE),
  tcc_prf_fmt_code VARCHAR2(7 BYTE),
  tcc_quantity NUMBER(7),
  tcc_weight NUMBER(10,3),
  tcc_loc_code VARCHAR2(12 BYTE)
);
COMMENT ON TABLE phenix.temp_cash_and_carry_products IS 'Table tempraire utilisée pour les commandes cash and carry des produits formats qui ne se trouvent pas dans une localisation destinée au cash and carry';
COMMENT ON COLUMN phenix.temp_cash_and_carry_products.tcc_sid IS 'Indique le numéro identifiant l''usager(session)';
COMMENT ON COLUMN phenix.temp_cash_and_carry_products.tcc_prf_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.temp_cash_and_carry_products.tcc_prf_fmt_code IS 'Indique le code de format du produit';
COMMENT ON COLUMN phenix.temp_cash_and_carry_products.tcc_quantity IS 'Indique la quantité à commander';
COMMENT ON COLUMN phenix.temp_cash_and_carry_products.tcc_weight IS 'Indique le poids à commander';
COMMENT ON COLUMN phenix.temp_cash_and_carry_products.tcc_loc_code IS 'Indique la localisation du produit format';