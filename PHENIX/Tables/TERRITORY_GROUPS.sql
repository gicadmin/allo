CREATE TABLE phenix.territory_groups (
  trg_id NUMBER(15) NOT NULL,
  trg_trt_code NUMBER(2) NOT NULL,
  trg_pgr_code NUMBER(5) NOT NULL,
  trg_ar_sales VARCHAR2(40 BYTE) NOT NULL,
  trg_sales_cogs VARCHAR2(40 BYTE) NOT NULL,
  CONSTRAINT trg_pk PRIMARY KEY (trg_id),
  CONSTRAINT trg_uk UNIQUE (trg_trt_code,trg_pgr_code),
  CONSTRAINT trg_pgr_fk FOREIGN KEY (trg_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT trg_trt_fk FOREIGN KEY (trg_trt_code) REFERENCES phenix.territories (trt_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.territory_groups IS 'Table utilisée pour définir différent compte GL par combinaison de région et groupe de produit';
COMMENT ON COLUMN phenix.territory_groups.trg_id IS 'Indique l''identifiant unique de la table (ID)';
COMMENT ON COLUMN phenix.territory_groups.trg_trt_code IS 'Indique le code de région';
COMMENT ON COLUMN phenix.territory_groups.trg_pgr_code IS 'Indique le groupe de produit';
COMMENT ON COLUMN phenix.territory_groups.trg_ar_sales IS 'Indique le compte GL utilisé pour la combinaison de région et groupe de produit en cours';
COMMENT ON COLUMN phenix.territory_groups.trg_sales_cogs IS 'Indique le compte GL utilisé des coûtants des marchandises pour la combinaison de région et groupe de produit en cours';