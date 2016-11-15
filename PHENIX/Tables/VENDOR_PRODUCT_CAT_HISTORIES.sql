CREATE TABLE phenix.vendor_product_cat_histories (
  vcgh_vcg_id NUMBER(15) NOT NULL,
  vcgh_start_date DATE NOT NULL,
  vcgh_end_date DATE NOT NULL,
  vcgh_vcg_qualifier VARCHAR2(2 BYTE) DEFAULT 'IT' NOT NULL CONSTRAINT vcgh_vcg_qualifier_ck CHECK (VCGH_VCG_QUALIFIER IN ('IT','KG','LB','LT')),
  vcgh_vcg_collect_distrib_quali VARCHAR2(2 BYTE) DEFAULT 'IT' NOT NULL CONSTRAINT vcgh_vcg_collect_distrib_qu_ck CHECK (VCGH_VCG_COLLECT_DISTRIB_QUALI IN ('IT','KG','LB','LT')),
  vcgh_vcg_collected_avr_percent NUMBER(6,3),
  vcgh_vcg_collected_avr_amount NUMBER(7,2),
  vcgh_vcg_distributed_avr_perc NUMBER(6,3),
  vcgh_vcg_distributed_avr_amoun NUMBER(7,2),
  vcgh_vcg_quart_drop_avr_perc NUMBER(6,3),
  vcgh_vcg_quart_drop_avr_amount NUMBER(7,2),
  vcgh_vcg_quart_whouse_avr_perc NUMBER(6,3),
  vcgh_vcg_quart_whouse_avr_amou NUMBER(7,2),
  vcgh_vcg_category_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT vcgh_pk PRIMARY KEY (vcgh_vcg_id,vcgh_start_date,vcgh_end_date),
  CONSTRAINT vcgh_vcg_fk FOREIGN KEY (vcgh_vcg_id) REFERENCES phenix.vendor_product_categories (vcg_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.vendor_product_cat_histories IS 'Table des historiques';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_vcg_id IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_start_date IS 'Indique la date debut';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_end_date IS 'Indique la date fin';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_vcg_qualifier IS 'Indique de quelle façon la remise est calculée';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_vcg_collect_distrib_quali IS 'Indique de quelle façon la remise trimestrielle est calculée';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_vcg_collected_avr_percent IS 'Indique le pourcentage des retours à collecter';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_vcg_collected_avr_amount IS 'Indique le montant des retour à collecter';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_vcg_distributed_avr_perc IS 'indique le pourcentage des retours distribuer aux membres';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_vcg_distributed_avr_amoun IS 'Indique le montant des retous à distribuer aux membres';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_vcg_quart_drop_avr_perc IS 'Indique le pourcentage de rabais volume trimestriel special';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_vcg_quart_drop_avr_amount IS 'Indique le montant du rabais volume trimestriel spécial';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_vcg_quart_whouse_avr_perc IS 'Indique le pourcentage de rabais volume trimestriel pour l''entrepot';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_vcg_quart_whouse_avr_amou IS 'Indique le montant du rabais volume trimestriel pour l''entrepôt';
COMMENT ON COLUMN phenix.vendor_product_cat_histories.vcgh_vcg_category_code IS 'indique le code de la catégorie spécifique au fournisseur';