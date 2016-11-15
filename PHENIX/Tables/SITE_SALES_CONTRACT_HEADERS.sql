CREATE TABLE phenix.site_sales_contract_headers (
  ssch_code VARCHAR2(15 BYTE) NOT NULL,
  ssch_sit_code NUMBER(10) NOT NULL,
  ssch_start_date DATE NOT NULL,
  ssch_end_date DATE NOT NULL,
  ssch_revised_end_date DATE,
  ssch_active_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ssch_active_ck CHECK ( SSCH_ACTIVE_SWITCH IN (0, 1) ),
  ssch_message VARCHAR2(200 BYTE),
  CONSTRAINT ssch_pk PRIMARY KEY (ssch_code),
  CONSTRAINT ssch_sit_fk FOREIGN KEY (ssch_sit_code) REFERENCES phenix.sites (sit_code)
);
COMMENT ON TABLE phenix.site_sales_contract_headers IS 'Table des contrats';
COMMENT ON COLUMN phenix.site_sales_contract_headers.ssch_code IS 'Indique le numéro de contrat';
COMMENT ON COLUMN phenix.site_sales_contract_headers.ssch_sit_code IS 'Indique le numéro du site physique pour les contrats';
COMMENT ON COLUMN phenix.site_sales_contract_headers.ssch_start_date IS 'Indique la date début du contrat';
COMMENT ON COLUMN phenix.site_sales_contract_headers.ssch_end_date IS 'Indique la date fin du contrat';
COMMENT ON COLUMN phenix.site_sales_contract_headers.ssch_revised_end_date IS 'Indique la date révisée du contrat';
COMMENT ON COLUMN phenix.site_sales_contract_headers.ssch_active_switch IS 'Indique si le contrat est actif';
COMMENT ON COLUMN phenix.site_sales_contract_headers.ssch_message IS 'Indique message du contrat';