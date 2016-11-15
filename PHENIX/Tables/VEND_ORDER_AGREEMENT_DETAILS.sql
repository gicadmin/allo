CREATE TABLE phenix.vend_order_agreement_details (
  voad_id NUMBER(15) NOT NULL,
  voad_voah_id NUMBER(15) NOT NULL,
  voad_cus_code NUMBER(10) NOT NULL,
  voad_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  voad_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  voad_start_date DATE NOT NULL,
  voad_end_date DATE NOT NULL,
  voad_sales_allowance NUMBER(6,2) NOT NULL,
  voad_creation_date DATE DEFAULT SYSDATE NOT NULL,
  voad_modification_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT voad_pk PRIMARY KEY (voad_id) USING INDEX (CREATE UNIQUE INDEX phenix.voad_pk_i ON phenix.vend_order_agreement_details(voad_id)    ),
  CONSTRAINT voad_cus_fk FOREIGN KEY (voad_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT voad_prf_fk FOREIGN KEY (voad_prf_prd_code,voad_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT voad_voah_fk FOREIGN KEY (voad_voah_id) REFERENCES phenix.vend_order_agreement_headers (voah_id)
);
COMMENT ON TABLE phenix.vend_order_agreement_details IS 'Table de détails des ententes partenaires';
COMMENT ON COLUMN phenix.vend_order_agreement_details.voad_id IS 'Indique l''identifiant unique de la ligne';
COMMENT ON COLUMN phenix.vend_order_agreement_details.voad_voah_id IS 'Indique l''identifiant unique de l''en-tête de l''entente partenaire';
COMMENT ON COLUMN phenix.vend_order_agreement_details.voad_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.vend_order_agreement_details.voad_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.vend_order_agreement_details.voad_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.vend_order_agreement_details.voad_start_date IS 'Indique la date de début de l''entente partenaire';
COMMENT ON COLUMN phenix.vend_order_agreement_details.voad_end_date IS 'Indique la date de fin de l''entente partenaire';
COMMENT ON COLUMN phenix.vend_order_agreement_details.voad_sales_allowance IS 'Indique le montant de l''entente partenaire';
COMMENT ON COLUMN phenix.vend_order_agreement_details.voad_creation_date IS 'Indique la date de création de la ligne de détail de l''entente partenaire';
COMMENT ON COLUMN phenix.vend_order_agreement_details.voad_modification_date IS 'Indique la date de modification de la ligne de détail de l''entente partenaire';