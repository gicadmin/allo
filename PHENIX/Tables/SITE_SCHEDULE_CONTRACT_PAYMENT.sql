CREATE TABLE phenix.site_schedule_contract_payment (
  sscp_id NUMBER(15) NOT NULL,
  sscp_ssch_code VARCHAR2(15 BYTE) NOT NULL,
  sscp_amount NUMBER(8,2) NOT NULL,
  sscp_payable_date DATE NOT NULL,
  sscp_revised_payable_date DATE NOT NULL,
  sscp_actual_paid_date DATE,
  sscp_check_number VARCHAR2(20 BYTE),
  CONSTRAINT sscp_pk PRIMARY KEY (sscp_id),
  CONSTRAINT sscp_ssch_fk FOREIGN KEY (sscp_ssch_code) REFERENCES phenix.site_sales_contract_headers (ssch_code)
);
COMMENT ON TABLE phenix.site_schedule_contract_payment IS 'Table des subventions';
COMMENT ON COLUMN phenix.site_schedule_contract_payment.sscp_id IS 'Indique l''identifiant de la subvention';
COMMENT ON COLUMN phenix.site_schedule_contract_payment.sscp_ssch_code IS 'Indique le numéro de contrat';
COMMENT ON COLUMN phenix.site_schedule_contract_payment.sscp_amount IS 'Indique le montant de la subvention';
COMMENT ON COLUMN phenix.site_schedule_contract_payment.sscp_payable_date IS 'Indique la date payable de la subvention';
COMMENT ON COLUMN phenix.site_schedule_contract_payment.sscp_revised_payable_date IS 'Indique la date payable modifiée de la subvention';
COMMENT ON COLUMN phenix.site_schedule_contract_payment.sscp_actual_paid_date IS 'Indique la date actuelle de la subvention';
COMMENT ON COLUMN phenix.site_schedule_contract_payment.sscp_check_number IS 'Indique le numéro de chèque';