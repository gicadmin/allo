CREATE TABLE phenix.vendor_customer_lists (
  vcl_id NUMBER(15) NOT NULL,
  vcl_ven_code NUMBER(5) NOT NULL,
  vcl_cus_code NUMBER(10) NOT NULL,
  vcl_customer_code_for_vendor VARCHAR2(10 BYTE) NOT NULL,
  vcl_collection_type VARCHAR2(4 BYTE) CONSTRAINT vcl_collection_type_ck CHECK (VCL_COLLECTION_TYPE IN ('CASH','PSL')),
  CONSTRAINT vcl_pk PRIMARY KEY (vcl_id),
  CONSTRAINT vcl_ven_cus_uk UNIQUE (vcl_ven_code,vcl_cus_code),
  CONSTRAINT vcl_cus_fk FOREIGN KEY (vcl_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT vcl_ven_fk FOREIGN KEY (vcl_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.vendor_customer_lists IS 'Lien qui permet d''unir les fournisseurs et les clients';
COMMENT ON COLUMN phenix.vendor_customer_lists.vcl_id IS 'Identifiant unique de la table';
COMMENT ON COLUMN phenix.vendor_customer_lists.vcl_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.vendor_customer_lists.vcl_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.vendor_customer_lists.vcl_customer_code_for_vendor IS 'Indique le code client selon le fournisseur';
COMMENT ON COLUMN phenix.vendor_customer_lists.vcl_collection_type IS 'Indique le type de collection nécessaire par le livreur';