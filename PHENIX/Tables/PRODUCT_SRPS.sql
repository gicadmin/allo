CREATE TABLE phenix.product_srps (
  psr_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  psr_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  psr_srt_code NUMBER(3) NOT NULL,
  psr_price NUMBER(7,2) NOT NULL,
  psr_profit_percent NUMBER(6,3) NOT NULL,
  psr_quantity NUMBER(6,3) NOT NULL,
  psr_fixed_srp_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT psr_fixed_srp_switch_ck CHECK (PSR_FIXED_SRP_SWITCH in (0, 1)),
  CONSTRAINT psr_pk PRIMARY KEY (psr_prf_prd_code,psr_prf_fmt_code,psr_srt_code),
  CONSTRAINT psr_prf_fk FOREIGN KEY (psr_prf_prd_code,psr_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT psr_srt_fk FOREIGN KEY (psr_srt_code) REFERENCES phenix.suggested_retail_price_types (srt_code)
);
COMMENT ON TABLE phenix.product_srps IS 'Indique les pourcentages attribués à chaque produit format et type de prix de détail suggéré';
COMMENT ON COLUMN phenix.product_srps.psr_prf_prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.product_srps.psr_prf_fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.product_srps.psr_srt_code IS 'Numéro d''identifiant de prix de détaille suggéré';
COMMENT ON COLUMN phenix.product_srps.psr_price IS 'Prix de détail suggéré';
COMMENT ON COLUMN phenix.product_srps.psr_profit_percent IS 'Pourcentage additionné créant le prix de détail suggéré';
COMMENT ON COLUMN phenix.product_srps.psr_quantity IS 'Quantité alloué au prix de détail suggéré';
COMMENT ON COLUMN phenix.product_srps.psr_fixed_srp_switch IS 'Indique si le prix du PDS est fixe ou pas';