CREATE TABLE phenix.avr_customer_exceptions (
  ace_id NUMBER(15) NOT NULL,
  ace_vcg_id NUMBER(15) NOT NULL,
  ace_cus_code NUMBER(10) NOT NULL,
  ace_warehouse_percent NUMBER(6,3),
  ace_drop_percent NUMBER(6,3),
  ace_warehouse_amount NUMBER(7,2),
  ace_drop_amount NUMBER(7,2),
  CONSTRAINT ace_amount_percent_ck CHECK (
  ((ACE_DROP_PERCENT IS NULL
        AND ACE_WAREHOUSE_PERCENT IS NULL
        AND ACE_DROP_AMOUNT IS NOT NULL
        AND ACE_WAREHOUSE_AMOUNT IS NOT NULL )
    OR (ACE_DROP_PERCENT IS NOT NULL
        AND ACE_WAREHOUSE_PERCENT IS NOT NULL
        AND ACE_DROP_AMOUNT IS NULL
        AND ACE_WAREHOUSE_AMOUNT IS NULL)
)),
  CONSTRAINT ace_pk PRIMARY KEY (ace_id),
  CONSTRAINT ace_cus_fk FOREIGN KEY (ace_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT ace_vcg_fk FOREIGN KEY (ace_vcg_id) REFERENCES phenix.vendor_product_categories (vcg_id)
);
COMMENT ON TABLE phenix.avr_customer_exceptions IS 'Table utilisée pour entrer les exceptions des rabais volume, celles qui pourraient être créditées à la facturation';
COMMENT ON COLUMN phenix.avr_customer_exceptions.ace_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.avr_customer_exceptions.ace_vcg_id IS 'Indique la catégorie de produit du fournisseur concernée par l''exception';
COMMENT ON COLUMN phenix.avr_customer_exceptions.ace_cus_code IS 'Indique le code du client concerné par l''exception';
COMMENT ON COLUMN phenix.avr_customer_exceptions.ace_warehouse_percent IS 'Indique le pourcentage de rabais volume sur les ventes d''entrepôt';
COMMENT ON COLUMN phenix.avr_customer_exceptions.ace_drop_percent IS 'Indique le pourcentage de rabais volume sur les ventes indirectes';
COMMENT ON COLUMN phenix.avr_customer_exceptions.ace_warehouse_amount IS 'Indique le pourcentage d''allocation de croissance';
COMMENT ON COLUMN phenix.avr_customer_exceptions.ace_drop_amount IS 'Indique le pourcentage d''allocation additionnel (marque privée)';