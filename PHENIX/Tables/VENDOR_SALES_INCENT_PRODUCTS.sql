CREATE TABLE phenix.vendor_sales_incent_products (
  vsip_id NUMBER(15) NOT NULL,
  vsip_vsi_code NUMBER(10) NOT NULL,
  vsip_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  vsip_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  vsip_prod_coefficient_percent NUMBER(6,3) DEFAULT 0 NOT NULL CONSTRAINT vsip_prod_coefficient_ck CHECK (VSIP_PROD_COEFFICIENT_PERCENT > 0 AND VSIP_PROD_COEFFICIENT_PERCENT <=100 ),
  CONSTRAINT vsip_pk PRIMARY KEY (vsip_id),
  CONSTRAINT vsip_vsi_prf_uk UNIQUE (vsip_vsi_code,vsip_prf_prd_code,vsip_prf_fmt_code),
  CONSTRAINT vsip_prf_fk FOREIGN KEY (vsip_prf_prd_code,vsip_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT vsip_vsi_fk FOREIGN KEY (vsip_vsi_code) REFERENCES phenix.vendor_sales_incentives (vsi_code)
);
COMMENT ON COLUMN phenix.vendor_sales_incent_products.vsip_id IS 'Indique l''indentifiant de la table';
COMMENT ON COLUMN phenix.vendor_sales_incent_products.vsip_vsi_code IS 'Indique le code de la prime à la vente';
COMMENT ON COLUMN phenix.vendor_sales_incent_products.vsip_prf_prd_code IS 'Indique le code produit inclus dans la prime';
COMMENT ON COLUMN phenix.vendor_sales_incent_products.vsip_prf_fmt_code IS 'Indique le code format du produit inclus dans la prime';
COMMENT ON COLUMN phenix.vendor_sales_incent_products.vsip_prod_coefficient_percent IS 'Indique le pourcentage de la representation du produit/format par rapport à la prime';