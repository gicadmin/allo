CREATE TABLE phenix.account_statements (
  asc_id NUMBER(15) NOT NULL,
  asc_cus_code NUMBER(10) NOT NULL,
  asc_from_date DATE NOT NULL,
  asc_to_date DATE NOT NULL,
  asc_whs_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT acs_pk PRIMARY KEY (asc_id),
  CONSTRAINT acs_cus_fk FOREIGN KEY (asc_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT acs_whs_fk FOREIGN KEY (asc_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.account_statements IS 'Information relié à une transaction 882 EDI';
COMMENT ON COLUMN phenix.account_statements.asc_id IS 'Identifiant';
COMMENT ON COLUMN phenix.account_statements.asc_cus_code IS 'Code client';
COMMENT ON COLUMN phenix.account_statements.asc_from_date IS 'Date de début';
COMMENT ON COLUMN phenix.account_statements.asc_to_date IS 'Date de fin';