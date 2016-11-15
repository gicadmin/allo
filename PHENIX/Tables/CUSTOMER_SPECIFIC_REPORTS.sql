CREATE TABLE phenix.customer_specific_reports (
  csp_report_name VARCHAR2(200 BYTE) NOT NULL,
  csp_customer_code VARCHAR2(7 BYTE) NOT NULL,
  csp_whs_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT csr_pk PRIMARY KEY (csp_report_name,csp_whs_code),
  CONSTRAINT csp_whs_code_fk FOREIGN KEY (csp_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.customer_specific_reports IS 'Rapport unique a un client';
COMMENT ON COLUMN phenix.customer_specific_reports.csp_report_name IS 'Nom du rapport';
COMMENT ON COLUMN phenix.customer_specific_reports.csp_customer_code IS 'Code du client';
COMMENT ON COLUMN phenix.customer_specific_reports.csp_whs_code IS 'Indique le code d''entrepôt de la personnalisation';