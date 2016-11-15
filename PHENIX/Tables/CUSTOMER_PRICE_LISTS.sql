CREATE TABLE phenix.customer_price_lists (
  cpl_cus_code NUMBER(10),
  cpl_cgr_code NUMBER(3),
  cpl_prf_prd_code VARCHAR2(15 BYTE) NOT NULL,
  cpl_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  cpl_prd_selling_retail NUMBER(7,2) NOT NULL,
  cpl_modification_date DATE NOT NULL,
  cpl_profil_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cpl_profil_switch_ck CHECK (CPL_PROFIL_SWITCH IN (0,1)),
  CONSTRAINT cpl_cus_cgr_ck CHECK ( (CPL_CUS_CODE IS NOT NULL AND CPL_CGR_CODE IS NULL) OR (CPL_CUS_CODE IS NULL AND CPL_CGR_CODE IS NOT NULL) ),
  CONSTRAINT cpl_uk UNIQUE (cpl_cus_code,cpl_cgr_code,cpl_prf_prd_code,cpl_prf_fmt_code) USING INDEX (CREATE UNIQUE INDEX phenix.cpl_uk_i ON phenix.customer_price_lists(cpl_cus_code,cpl_cgr_code,cpl_prf_prd_code,cpl_prf_fmt_code)    ),
  CONSTRAINT cpl_cgr_fk FOREIGN KEY (cpl_cgr_code) REFERENCES phenix.customer_groups (cgr_code) ON DELETE CASCADE,
  CONSTRAINT cpl_cus_fk FOREIGN KEY (cpl_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT cpl_prf_fk FOREIGN KEY (cpl_prf_prd_code,cpl_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.customer_price_lists IS 'Table contenant les dernières listes de prix des produits pour un client ou un groupe de client';
COMMENT ON COLUMN phenix.customer_price_lists.cpl_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.customer_price_lists.cpl_cgr_code IS 'Indique le code du groupe de clients';
COMMENT ON COLUMN phenix.customer_price_lists.cpl_prf_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.customer_price_lists.cpl_prf_fmt_code IS 'Indique le code de format du produit';
COMMENT ON COLUMN phenix.customer_price_lists.cpl_prd_selling_retail IS 'Indique le prix de vente';
COMMENT ON COLUMN phenix.customer_price_lists.cpl_modification_date IS 'Indique la date du traitement';
COMMENT ON COLUMN phenix.customer_price_lists.cpl_profil_switch IS 'Indique si l enregistrement provient du profil ';