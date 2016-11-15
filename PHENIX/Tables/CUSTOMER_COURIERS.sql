CREATE TABLE phenix.customer_couriers (
  cuc_cus_code NUMBER(10) NOT NULL,
  cuc_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  cuc_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  cuc_sent_switch NUMBER(1) NOT NULL CONSTRAINT cuc_sent_switch_ck CHECK (CUC_SENT_SWITCH IN (0, 1)),
  CONSTRAINT cuc_pk PRIMARY KEY (cuc_cus_code,cuc_prf_prd_code,cuc_prf_fmt_code),
  CONSTRAINT cuc_cus_fk FOREIGN KEY (cuc_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT cuc_prf_fk FOREIGN KEY (cuc_prf_prd_code,cuc_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.customer_couriers IS 'Lien qui permet de savoir si les pamphlets ont été envoyés aux clients';
COMMENT ON COLUMN phenix.customer_couriers.cuc_cus_code IS 'Numéro de client';
COMMENT ON COLUMN phenix.customer_couriers.cuc_prf_prd_code IS 'Code de produit';
COMMENT ON COLUMN phenix.customer_couriers.cuc_prf_fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.customer_couriers.cuc_sent_switch IS 'Indique si le pamphlet a été envoyé';