CREATE TABLE phenix.product_format_warehouses (
  pfw_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pfw_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  pfw_whs_code VARCHAR2(2 BYTE) NOT NULL,
  pfw_whz_code VARCHAR2(2 BYTE) NOT NULL,
  pfw_pof_code NUMBER(2),
  CONSTRAINT pfw_pk PRIMARY KEY (pfw_prf_prd_code,pfw_prf_fmt_code,pfw_whs_code),
  CONSTRAINT pfw_pof_fk FOREIGN KEY (pfw_pof_code) REFERENCES phenix.positioning_families (pof_code),
  CONSTRAINT pfw_prf_fk FOREIGN KEY (pfw_prf_prd_code,pfw_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code) ON DELETE CASCADE,
  CONSTRAINT pfw_whs_fk FOREIGN KEY (pfw_whs_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT pfw_whz_fk FOREIGN KEY (pfw_whz_code) REFERENCES phenix.warehouse_zones (whz_code)
);
COMMENT ON TABLE phenix.product_format_warehouses IS 'Table contenant les propriétés d''un produit/format dans un entrepôt';
COMMENT ON COLUMN phenix.product_format_warehouses.pfw_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.product_format_warehouses.pfw_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.product_format_warehouses.pfw_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.product_format_warehouses.pfw_whz_code IS 'Indique la zone d''entreposage du produit/format dans cet entrepôt';
COMMENT ON COLUMN phenix.product_format_warehouses.pfw_pof_code IS 'Indique le code de la famille de positionnement';