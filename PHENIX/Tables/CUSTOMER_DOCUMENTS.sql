CREATE TABLE phenix.customer_documents (
  cdo_id NUMBER(15) NOT NULL,
  cdo_doc_code NUMBER(10) NOT NULL,
  cdo_cus_code NUMBER(10),
  cdo_cgr_code NUMBER(3),
  cdo_all_customers_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cdo_all_customers_switch_ck CHECK (CDO_ALL_CUSTOMERS_SWITCH IN (0, 1)),
  CONSTRAINT cdo_cus_cgr_ck CHECK ((CDO_CUS_CODE IS NOT NULL AND CDO_CGR_CODE IS NULL AND CDO_ALL_CUSTOMERS_SWITCH = 0) OR
         (CDO_CUS_CODE IS NULL AND CDO_CGR_CODE IS NOT NULL AND CDO_ALL_CUSTOMERS_SWITCH = 0) OR
         (CDO_CUS_CODE IS NULL AND CDO_CGR_CODE IS NULL AND CDO_ALL_CUSTOMERS_SWITCH = 1)),
  CONSTRAINT cdo_pk PRIMARY KEY (cdo_id),
  CONSTRAINT cdo_cgr_fk FOREIGN KEY (cdo_cgr_code) REFERENCES phenix.customer_groups (cgr_code),
  CONSTRAINT cdo_cus_fk FOREIGN KEY (cdo_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT cdo_doc_fk FOREIGN KEY (cdo_doc_code) REFERENCES phenix.documents (doc_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.customer_documents IS 'Table permettant de lier les clients aux documents';
COMMENT ON COLUMN phenix.customer_documents.cdo_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.customer_documents.cdo_doc_code IS 'Indique le code du document';
COMMENT ON COLUMN phenix.customer_documents.cdo_cus_code IS 'Indique le code de client pour le document';
COMMENT ON COLUMN phenix.customer_documents.cdo_cgr_code IS 'Indique le code de groupe de clients pour le document';
COMMENT ON COLUMN phenix.customer_documents.cdo_all_customers_switch IS 'Indique si le document est pour tous les clients';