CREATE TABLE phenix.suggested_retail_price_groups (
  srg_srt_code NUMBER(3) NOT NULL,
  srg_pgr_code NUMBER(5) NOT NULL,
  srg_profit_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  CONSTRAINT srg_pk PRIMARY KEY (srg_srt_code,srg_pgr_code),
  CONSTRAINT srg_pgr_fk FOREIGN KEY (srg_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT srg_srt_fk FOREIGN KEY (srg_srt_code) REFERENCES phenix.suggested_retail_price_types (srt_code)
);
COMMENT ON TABLE phenix.suggested_retail_price_groups IS 'Table contenant les pourcentages de profit appliqués aux PDS des différents groupes de produits';
COMMENT ON COLUMN phenix.suggested_retail_price_groups.srg_srt_code IS 'Indique le code du type de PDS';
COMMENT ON COLUMN phenix.suggested_retail_price_groups.srg_pgr_code IS 'Indique le code du groupe de produit';
COMMENT ON COLUMN phenix.suggested_retail_price_groups.srg_profit_percent IS 'Indique le pourcentage de profit des PDS du groupe de produits';