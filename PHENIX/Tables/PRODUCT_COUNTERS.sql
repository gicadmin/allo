CREATE TABLE phenix.product_counters (
  pct_id NUMBER(15) NOT NULL,
  pct_ctt_code NUMBER(3) NOT NULL,
  pct_prd_code VARCHAR2(10 BYTE),
  pct_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  pct_dollar_switch NUMBER(1) NOT NULL CONSTRAINT pct_dollar_switch_ck CHECK (PCT_DOLLAR_SWITCH IN (0, 1)),
  pct_end_date DATE NOT NULL,
  pct_rebate_amount NUMBER(7,2) NOT NULL,
  pct_start_date DATE NOT NULL,
  pct_pgr_code NUMBER(5),
  CONSTRAINT pct_product_group_ck CHECK ((PCT_PRD_CODE is not NULL and
PCT_PGR_CODE is NULL) or
(PCT_PRD_CODE is NULL and
PCT_PGR_CODE is not NULL)),
  CONSTRAINT pct_pk PRIMARY KEY (pct_id),
  CONSTRAINT pct_ctt_fk FOREIGN KEY (pct_ctt_code) REFERENCES phenix.counter_types (ctt_code) ON DELETE CASCADE,
  CONSTRAINT pct_fmt_fk FOREIGN KEY (pct_fmt_code) REFERENCES phenix.formats (fmt_code),
  CONSTRAINT pct_pgr_fk FOREIGN KEY (pct_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT pct_prd_fk FOREIGN KEY (pct_prd_code) REFERENCES phenix.products (prd_code)
);
COMMENT ON TABLE phenix.product_counters IS 'Table de jonction entre les types de compteur et les produits/formats';
COMMENT ON COLUMN phenix.product_counters.pct_id IS 'Identifiant de la table';
COMMENT ON COLUMN phenix.product_counters.pct_ctt_code IS 'Type de compteur';
COMMENT ON COLUMN phenix.product_counters.pct_prd_code IS 'Code produit';
COMMENT ON COLUMN phenix.product_counters.pct_fmt_code IS 'Code format';
COMMENT ON COLUMN phenix.product_counters.pct_dollar_switch IS 'Indique si le rabais du compteur est en points ou en dollars';
COMMENT ON COLUMN phenix.product_counters.pct_end_date IS 'Date de fin';
COMMENT ON COLUMN phenix.product_counters.pct_rebate_amount IS 'Montant du rabais';
COMMENT ON COLUMN phenix.product_counters.pct_start_date IS 'Date de début';
COMMENT ON COLUMN phenix.product_counters.pct_pgr_code IS 'Code du groupe de produit';