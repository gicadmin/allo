CREATE TABLE phenix.show_products (
  spr_broker_ven_code VARCHAR2(5 BYTE),
  spr_broker_product_code VARCHAR2(10 BYTE),
  spr_product_description VARCHAR2(61 BYTE),
  spr_format_unit_multiplicant VARCHAR2(5 BYTE),
  spr_format_unit_description VARCHAR2(10 BYTE),
  spr_selling_price VARCHAR2(6 BYTE),
  spr_cost_price VARCHAR2(7 BYTE),
  spr_conversion_factor VARCHAR2(5 BYTE),
  spr_unitary_price VARCHAR2(6 BYTE),
  spr_profit_percent VARCHAR2(7 BYTE),
  spr_upc_code VARCHAR2(14 BYTE),
  spr_consignment_flag VARCHAR2(1 BYTE),
  spr_prd_code VARCHAR2(10 BYTE),
  spr_fmt_code VARCHAR2(7 BYTE),
  spr_ccr_code NUMBER(5),
  spr_federal_tax_flag VARCHAR2(1 BYTE),
  spr_provincial_tax_flag VARCHAR2(1 BYTE),
  spr_prd_ven_code NUMBER(5),
  spr_cost_per_kg VARCHAR2(6 BYTE),
  spr_product_group VARCHAR2(2 BYTE),
  spr_nb_item_special_orders VARCHAR2(6 BYTE),
  CONSTRAINT spr_ccr_fk FOREIGN KEY (spr_ccr_code) REFERENCES phenix.error_codes (ccr_code),
  CONSTRAINT spr_fmt_fk FOREIGN KEY (spr_fmt_code) REFERENCES phenix.formats (fmt_code),
  CONSTRAINT spr_prd_fk FOREIGN KEY (spr_prd_code) REFERENCES phenix.products (prd_code)
);
COMMENT ON TABLE phenix.show_products IS 'Sert à identifier et valider les produits du show colabor';
COMMENT ON COLUMN phenix.show_products.spr_broker_ven_code IS 'Code fournisseur chez Colabor';
COMMENT ON COLUMN phenix.show_products.spr_broker_product_code IS 'Code produit Colabor';
COMMENT ON COLUMN phenix.show_products.spr_product_description IS 'Description du produit';
COMMENT ON COLUMN phenix.show_products.spr_format_unit_multiplicant IS 'Indique le multiple du format';
COMMENT ON COLUMN phenix.show_products.spr_format_unit_description IS 'Description du format';
COMMENT ON COLUMN phenix.show_products.spr_selling_price IS 'Prix vendant du show';
COMMENT ON COLUMN phenix.show_products.spr_cost_price IS 'Coûtant du show';
COMMENT ON COLUMN phenix.show_products.spr_conversion_factor IS 'Facteur de conversion';
COMMENT ON COLUMN phenix.show_products.spr_unitary_price IS 'Prix unitaire';
COMMENT ON COLUMN phenix.show_products.spr_profit_percent IS 'Pourcentage de profit';
COMMENT ON COLUMN phenix.show_products.spr_upc_code IS 'Code CUP';
COMMENT ON COLUMN phenix.show_products.spr_consignment_flag IS 'Indique si le produit est consigné';
COMMENT ON COLUMN phenix.show_products.spr_prd_code IS 'Code Produit';
COMMENT ON COLUMN phenix.show_products.spr_fmt_code IS 'Code Format';
COMMENT ON COLUMN phenix.show_products.spr_ccr_code IS 'Code d''erreur';
COMMENT ON COLUMN phenix.show_products.spr_federal_tax_flag IS 'Indique si le champs est taxé au fédéral';
COMMENT ON COLUMN phenix.show_products.spr_provincial_tax_flag IS 'Indique si le champs est taxé au provincial';
COMMENT ON COLUMN phenix.show_products.spr_prd_ven_code IS 'Indique le code du manufacturier du produit';
COMMENT ON COLUMN phenix.show_products.spr_cost_per_kg IS 'Indique le coûtant au kilo du produit';
COMMENT ON COLUMN phenix.show_products.spr_product_group IS 'Indique le code du groupe de produit';
COMMENT ON COLUMN phenix.show_products.spr_nb_item_special_orders IS 'Indique le nombre d''éléments permis des commandes spéciales ';