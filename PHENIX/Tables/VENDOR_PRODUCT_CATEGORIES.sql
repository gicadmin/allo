CREATE TABLE phenix.vendor_product_categories (
  vcg_id NUMBER(15) NOT NULL,
  vcg_ven_code NUMBER(5) NOT NULL,
  vcg_category_code VARCHAR2(2 BYTE) NOT NULL,
  vcg_description VARCHAR2(30 BYTE) NOT NULL,
  vcg_collected_avr_percent NUMBER(6,3),
  vcg_distributed_avr_percent NUMBER(6,3),
  vcg_alt_description VARCHAR2(30 BYTE),
  vcg_drop_terms NUMBER(6,3) NOT NULL,
  vcg_quart_drop_ship_avr NUMBER(6,3),
  vcg_quart_warehouse_avr NUMBER(6,3),
  vcg_qualifier VARCHAR2(2 BYTE) DEFAULT 'IT' NOT NULL CONSTRAINT vcg_qualifier_ck CHECK (VCG_QUALIFIER IN ('IT', 'KG', 'LB', 'LT')),
  vcg_message VARCHAR2(100 BYTE),
  vcg_collected_avr_amount NUMBER(7,2),
  vcg_distributed_avr_amount NUMBER(7,2),
  vcg_quart_drop_ship_avr_amount NUMBER(7,2),
  vcg_quart_warehouse_avr_amount NUMBER(7,2),
  vcg_collect_distrib_qualifier VARCHAR2(2 BYTE) DEFAULT 'IT' NOT NULL CONSTRAINT vcg_collect_distrib_qual_ck CHECK (
  (VCG_COLLECT_DISTRIB_QUALIFIER IN ('IT', 'KG', 'LB', 'LT'))
),
  CONSTRAINT vcg_col_dist_amount_percent_ck CHECK (
  ((VCG_COLLECT_DISTRIB_QUALIFIER = 'IT' AND VCG_COLLECTED_AVR_AMOUNT IS NULL AND VCG_DISTRIBUTED_AVR_AMOUNT IS NULL AND VCG_COLLECTED_AVR_PERCENT IS NOT NULL AND VCG_DISTRIBUTED_AVR_PERCENT IS NOT NULL)
    OR (VCG_COLLECT_DISTRIB_QUALIFIER IN ('IT', 'KG', 'LB', 'LT') AND VCG_COLLECTED_AVR_AMOUNT IS NOT NULL AND VCG_DISTRIBUTED_AVR_AMOUNT IS NOT NULL AND VCG_COLLECTED_AVR_PERCENT IS NULL AND VCG_DISTRIBUTED_AVR_PERCENT IS NULL)
)),
  CONSTRAINT vcg_qualifier_amount_perc_ck CHECK (
  ((VCG_QUALIFIER = 'IT'
        AND VCG_QUART_DROP_SHIP_AVR_AMOUNT IS NULL
        AND VCG_QUART_WAREHOUSE_AVR_AMOUNT IS NULL
        AND VCG_QUART_DROP_SHIP_AVR IS NOT NULL
        AND VCG_QUART_WAREHOUSE_AVR IS NOT NULL )
    OR (VCG_QUALIFIER IN ('IT', 'KG', 'LB', 'LT')
        AND VCG_QUART_DROP_SHIP_AVR_AMOUNT IS NOT NULL
        AND VCG_QUART_WAREHOUSE_AVR_AMOUNT IS NOT NULL
        AND VCG_QUART_DROP_SHIP_AVR IS NULL
        AND VCG_QUART_WAREHOUSE_AVR IS NULL )
)),
  CONSTRAINT vcg_pk PRIMARY KEY (vcg_id),
  CONSTRAINT vcg_uk UNIQUE (vcg_ven_code,vcg_category_code) USING INDEX (CREATE INDEX phenix.vcg_ven_category_i ON phenix.vendor_product_categories(vcg_ven_code,vcg_category_code)    ),
  CONSTRAINT vcg_ven_fk FOREIGN KEY (vcg_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.vendor_product_categories IS 'Catégorie des produits chez le fournisseur';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_ven_code IS 'Code fournisseur';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_category_code IS 'Contient le code de la catégorie spécifique au fournisseur';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_description IS 'Description de la catégorie';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_collected_avr_percent IS 'Pourcentage des retours à collecter';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_distributed_avr_percent IS 'Pourcentage des retours distribuer aux membres';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_alt_description IS 'Description alternative de la catégorie';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_drop_terms IS 'Indique le pourcentage de rabais volume trimestriel pour les drops';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_quart_drop_ship_avr IS 'Indique le pourcentage de rabais volume trimestriel special';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_quart_warehouse_avr IS 'Indique le pourcentage de rabais volume trimestriel pour l''entrepot';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_qualifier IS 'Indique de quelle façon la remise est calculée';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_message IS 'Indique le message';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_collected_avr_amount IS 'Indique le montant des retour à collecter';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_distributed_avr_amount IS 'Indique le montant des retous à distribuer aux membres';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_quart_drop_ship_avr_amount IS 'Indique le montant du rabais volume trimestriel spécial';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_quart_warehouse_avr_amount IS 'Indique le montant du rabais volume trimestriel pour l''entrepôt';
COMMENT ON COLUMN phenix.vendor_product_categories.vcg_collect_distrib_qualifier IS 'Indique de quelle façon la remise trimestrielle est calculée';