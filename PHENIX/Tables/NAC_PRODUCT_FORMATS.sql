CREATE TABLE phenix.nac_product_formats (
  npf_nac_code NUMBER(4) NOT NULL,
  npf_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  npf_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  npf_sequence NUMBER(6),
  npf_nch_id NUMBER(15),
  npf_nag_nac_code NUMBER(22),
  npf_nag_code VARCHAR2(6 BYTE),
  npf_product_code VARCHAR2(18 BYTE),
  npf_synchronization_id NUMBER(15),
  npf_unique_index NUMBER(22),
  CONSTRAINT nac_product_formats_ck CHECK ((NPF_NCH_ID IS NULL AND NPF_SEQUENCE IS NULL) OR
  (NPF_NCH_ID IS NOT NULL AND NPF_SEQUENCE IS NOT NULL )),
  CONSTRAINT npf_pk PRIMARY KEY (npf_nac_code,npf_prf_prd_code,npf_prf_fmt_code),
  CONSTRAINT npf_sequence_uk UNIQUE (npf_nch_id,npf_sequence),
  CONSTRAINT npf_nag_fk FOREIGN KEY (npf_nag_nac_code,npf_nag_code) REFERENCES phenix.national_account_groups (nag_nac_code,nag_code),
  CONSTRAINT npf_nch_fk FOREIGN KEY (npf_nch_id) REFERENCES phenix.nac_catalog_headers (nch_id),
  CONSTRAINT npf_prf_fk FOREIGN KEY (npf_prf_prd_code,npf_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.nac_product_formats IS 'Cette table contient les produits formats du compte national ';
COMMENT ON COLUMN phenix.nac_product_formats.npf_nac_code IS 'Code du compte national';
COMMENT ON COLUMN phenix.nac_product_formats.npf_prf_prd_code IS 'Code de produit';
COMMENT ON COLUMN phenix.nac_product_formats.npf_prf_fmt_code IS 'Code de format';
COMMENT ON COLUMN phenix.nac_product_formats.npf_sequence IS 'Séquence du produit format';
COMMENT ON COLUMN phenix.nac_product_formats.npf_nch_id IS 'Numéro de l''entête ';
COMMENT ON COLUMN phenix.nac_product_formats.npf_nag_nac_code IS 'Code du compte national';
COMMENT ON COLUMN phenix.nac_product_formats.npf_nag_code IS 'Code groupe du compte national';
COMMENT ON COLUMN phenix.nac_product_formats.npf_product_code IS 'Numéro de produit du compte national';
COMMENT ON COLUMN phenix.nac_product_formats.npf_synchronization_id IS 'Identifiant de synchronization';
COMMENT ON COLUMN phenix.nac_product_formats.npf_unique_index IS 'Identifiant unique';