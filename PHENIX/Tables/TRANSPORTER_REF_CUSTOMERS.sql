CREATE TABLE phenix.transporter_ref_customers (
  tec_id NUMBER(15) NOT NULL,
  tec_ven_code NUMBER(5) NOT NULL,
  tec_cus_transporter_code NUMBER(10) NOT NULL,
  tec_transporter_reference VARCHAR2(20 BYTE) NOT NULL,
  tec_cus_code NUMBER(10) NOT NULL,
  CONSTRAINT tec_pk PRIMARY KEY (tec_id),
  CONSTRAINT tec_uk UNIQUE (tec_ven_code,tec_cus_transporter_code,tec_transporter_reference,tec_cus_code) USING INDEX (CREATE UNIQUE INDEX phenix.tec_uk_i ON phenix.transporter_ref_customers(tec_ven_code,tec_cus_transporter_code,tec_transporter_reference,tec_cus_code)    ),
  CONSTRAINT tec_cus_fk FOREIGN KEY (tec_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT tec_cus_transporter_fk FOREIGN KEY (tec_cus_transporter_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT tec_ven_fk FOREIGN KEY (tec_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.transporter_ref_customers IS 'Table pour les références des clients transporteurs';
COMMENT ON COLUMN phenix.transporter_ref_customers.tec_id IS 'Indique l''identifiant';
COMMENT ON COLUMN phenix.transporter_ref_customers.tec_ven_code IS 'Indique le code du fournisseur ';
COMMENT ON COLUMN phenix.transporter_ref_customers.tec_cus_transporter_code IS 'Indique le code du client transporteur ';
COMMENT ON COLUMN phenix.transporter_ref_customers.tec_transporter_reference IS 'Indique la référence du client à livrer chez le client transporteur';
COMMENT ON COLUMN phenix.transporter_ref_customers.tec_cus_code IS 'Indique le code du client à livrer ';