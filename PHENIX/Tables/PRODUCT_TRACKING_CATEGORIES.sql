CREATE TABLE phenix.product_tracking_categories (
  ptc_stc_stt_code VARCHAR2(6 BYTE) NOT NULL,
  ptc_stc_code VARCHAR2(6 BYTE) NOT NULL,
  ptc_prf_prd_inventory_code VARCHAR2(10 BYTE) NOT NULL,
  ptc_prf_fmt_inventory_code VARCHAR2(7 BYTE) NOT NULL,
  ptc_prf_prd_sales_code VARCHAR2(10 BYTE) NOT NULL,
  ptc_prf_fmt_sales_code VARCHAR2(7 BYTE) NOT NULL,
  CONSTRAINT ptc_product_ck CHECK ((PTC_PRF_PRD_INVENTORY_CODE = PTC_PRF_PRD_SALES_CODE)),
  CONSTRAINT ptc_pk PRIMARY KEY (ptc_stc_code,ptc_stc_stt_code,ptc_prf_prd_inventory_code),
  CONSTRAINT ptc_prf_inventory_fk FOREIGN KEY (ptc_prf_prd_inventory_code,ptc_prf_fmt_inventory_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT ptc_prf_sales_fk FOREIGN KEY (ptc_prf_prd_sales_code,ptc_prf_fmt_sales_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT ptc_stc_fk FOREIGN KEY (ptc_stc_stt_code,ptc_stc_code) REFERENCES phenix.statistics_tracking_categories (stc_stt_code,stc_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.product_tracking_categories IS 'Catégories de suivis des produits';
COMMENT ON COLUMN phenix.product_tracking_categories.ptc_stc_stt_code IS 'Code du type des statistiques de suivis';
COMMENT ON COLUMN phenix.product_tracking_categories.ptc_stc_code IS 'Code de la catégorie des statistiques de suivis';