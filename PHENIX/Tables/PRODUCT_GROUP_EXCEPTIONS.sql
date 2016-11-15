CREATE TABLE phenix.product_group_exceptions (
  pgre_id NUMBER(15) NOT NULL,
  pgre_pgr_code NUMBER(5) NOT NULL,
  pgre_cus_code NUMBER(10),
  pgre_qty_code NUMBER(5),
  pgre_cgr_code NUMBER(3),
  pgre_pug_code NUMBER(5),
  pgre_maximum_profit_percent NUMBER(6,3),
  pgre_minimum_profit_percent NUMBER(6,3),
  pgre_min_telemark_prof_percent NUMBER(6,3),
  pgre_max_telemark_prof_percent NUMBER(6,3),
  CONSTRAINT pgre_cus_cgr_qty_pug_ck CHECK (((PGRE_CUS_CODE IS NOT NULL AND PGRE_CGR_CODE IS NULL AND PGRE_QTY_CODE IS NULL AND PGRE_PUG_CODE IS NULL)
                                      OR (PGRE_CUS_CODE IS NULL AND PGRE_CGR_CODE IS NOT NULL AND PGRE_QTY_CODE IS NULL AND PGRE_PUG_CODE IS NULL)
                                      OR (PGRE_CUS_CODE IS NULL AND PGRE_CGR_CODE IS NULL AND PGRE_QTY_CODE IS NOT NULL AND PGRE_PUG_CODE IS NULL)
                                      OR (PGRE_CUS_CODE IS NULL AND PGRE_CGR_CODE IS NULL AND PGRE_QTY_CODE IS NULL AND PGRE_PUG_CODE IS NOT NULL))),
  CONSTRAINT pgre_pk PRIMARY KEY (pgre_id) USING INDEX (CREATE UNIQUE INDEX phenix.pgre_pk_i ON phenix.product_group_exceptions(pgre_id)    ),
  CONSTRAINT pgre_uk UNIQUE (pgre_pgr_code,pgre_cus_code,pgre_cgr_code,pgre_qty_code,pgre_pug_code),
  CONSTRAINT pgre_cgr_fk FOREIGN KEY (pgre_cgr_code) REFERENCES phenix.customer_groups (cgr_code),
  CONSTRAINT pgre_cus_fk FOREIGN KEY (pgre_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT pgre_pgr_fk FOREIGN KEY (pgre_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT pgre_pug_fk FOREIGN KEY (pgre_pug_code) REFERENCES phenix.purchasing_groups (pug_code),
  CONSTRAINT pgre_qty_fk FOREIGN KEY (pgre_qty_code) REFERENCES phenix.quotation_types (qty_code)
);
COMMENT ON TABLE phenix.product_group_exceptions IS 'Table des exceptions des groupes de produits';
COMMENT ON COLUMN phenix.product_group_exceptions.pgre_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.product_group_exceptions.pgre_pgr_code IS 'Indique le code du groupe de produit';
COMMENT ON COLUMN phenix.product_group_exceptions.pgre_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.product_group_exceptions.pgre_qty_code IS 'Indique le type de soumission';
COMMENT ON COLUMN phenix.product_group_exceptions.pgre_cgr_code IS 'Indique le groupe du client';
COMMENT ON COLUMN phenix.product_group_exceptions.pgre_pug_code IS 'Indique le code du regroupement d''achat';
COMMENT ON COLUMN phenix.product_group_exceptions.pgre_maximum_profit_percent IS 'Indique le pourcentage maximum de profit pour ce groupe';
COMMENT ON COLUMN phenix.product_group_exceptions.pgre_minimum_profit_percent IS 'Indique le pourcentage minimum de profit pour ce groupe partenaire';
COMMENT ON COLUMN phenix.product_group_exceptions.pgre_min_telemark_prof_percent IS 'Indique le pourcentage minimum de profit pour ce groupe au niveau de télévente';
COMMENT ON COLUMN phenix.product_group_exceptions.pgre_max_telemark_prof_percent IS 'Indique le pourcentage maximum de profit pour ce groupe au niveau de télévente';