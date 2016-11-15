CREATE TABLE phenix.zero_inventory_sales_audits (
  zisa_id NUMBER(15) NOT NULL,
  zisa_whs_code VARCHAR2(2 BYTE) NOT NULL,
  zisa_cus_code NUMBER(10) NOT NULL,
  zisa_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  zisa_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  zisa_date DATE NOT NULL,
  zisa_inventory NUMBER(10,3) NOT NULL,
  zisa_sales NUMBER(10,3) NOT NULL,
  zisa_source VARCHAR2(50 BYTE) NOT NULL,
  CONSTRAINT zisa_pk PRIMARY KEY (zisa_id),
  CONSTRAINT zisa_cus_fk FOREIGN KEY (zisa_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT zisa_prf_fk FOREIGN KEY (zisa_prf_prd_code,zisa_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.zero_inventory_sales_audits IS 'Table des audits des quantités vendues supérieures à l''inventaire';
COMMENT ON COLUMN phenix.zero_inventory_sales_audits.zisa_id IS 'Indique l''identifiant unique de l''entête de la commande';
COMMENT ON COLUMN phenix.zero_inventory_sales_audits.zisa_whs_code IS 'Indique le code entrepot';
COMMENT ON COLUMN phenix.zero_inventory_sales_audits.zisa_cus_code IS 'Indique le numéro du client';
COMMENT ON COLUMN phenix.zero_inventory_sales_audits.zisa_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.zero_inventory_sales_audits.zisa_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.zero_inventory_sales_audits.zisa_date IS 'Indique la date de la transaction';
COMMENT ON COLUMN phenix.zero_inventory_sales_audits.zisa_inventory IS 'Indique le niveau d''inventaire au moment de la vente (quantité ou poids)';
COMMENT ON COLUMN phenix.zero_inventory_sales_audits.zisa_sales IS 'Indique le niveau d''inventaire au moment de la vente (quantité ou poids)';
COMMENT ON COLUMN phenix.zero_inventory_sales_audits.zisa_source IS 'Indique la source de création';