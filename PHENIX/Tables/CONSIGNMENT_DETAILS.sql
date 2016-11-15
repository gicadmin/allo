CREATE TABLE phenix.consignment_details (
  cnd_cns_code NUMBER(3) NOT NULL,
  cnd_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  cnd_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  cnd_sequence NUMBER(2) NOT NULL,
  cnd_prv_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT cnd_pk PRIMARY KEY (cnd_prf_prd_code,cnd_prf_fmt_code,cnd_cns_code,cnd_prv_code),
  CONSTRAINT cnd_uk UNIQUE (cnd_cns_code,cnd_prv_code,cnd_sequence),
  CONSTRAINT cnd_cns_fk FOREIGN KEY (cnd_cns_code) REFERENCES phenix.consignments (cns_code) ON DELETE CASCADE,
  CONSTRAINT cnd_prf_fk FOREIGN KEY (cnd_prf_prd_code,cnd_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT cnd_prv_fk FOREIGN KEY (cnd_prv_code) REFERENCES phenix.provinces (prv_code)
);
COMMENT ON TABLE phenix.consignment_details IS 'Cette table contient tout les produits/formats qui appartienent à un paquet de consignes';
COMMENT ON COLUMN phenix.consignment_details.cnd_cns_code IS 'Numéro d''ensemble des consignes';
COMMENT ON COLUMN phenix.consignment_details.cnd_prf_prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.consignment_details.cnd_prf_fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.consignment_details.cnd_sequence IS 'Séquence des consignes dans d''ensemble';
COMMENT ON COLUMN phenix.consignment_details.cnd_prv_code IS 'Indique le code de province relié à la consigne.';