CREATE TABLE phenix.product_families (
  ppf_code NUMBER(5) NOT NULL,
  ppf_description VARCHAR2(30 BYTE) NOT NULL,
  ppf_cost_price NUMBER(7,2) NOT NULL,
  ppf_ven_code NUMBER(5) NOT NULL,
  ppf_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT ppf_pk PRIMARY KEY (ppf_code),
  CONSTRAINT ppf_ven_fk FOREIGN KEY (ppf_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.product_families IS 'Famille de produit';
COMMENT ON COLUMN phenix.product_families.ppf_code IS 'Numéro de famille';
COMMENT ON COLUMN phenix.product_families.ppf_description IS 'Description';
COMMENT ON COLUMN phenix.product_families.ppf_cost_price IS 'Coûtant';
COMMENT ON COLUMN phenix.product_families.ppf_ven_code IS 'Numéro de fournisseur';
COMMENT ON COLUMN phenix.product_families.ppf_alt_description IS 'Description alternative';