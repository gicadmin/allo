CREATE TABLE phenix.customer_order_actions (
  coa_id NUMBER(15) NOT NULL,
  coa_cod_coh_id NUMBER(15) NOT NULL,
  coa_cod_line_number NUMBER(4) NOT NULL,
  coa_action VARCHAR2(4 BYTE) NOT NULL CONSTRAINT coa_action_chk CHECK (COA_ACTION IN ('REPK', 'PREP')),
  coa_status VARCHAR2(4 BYTE) NOT NULL CONSTRAINT coa_status_chk CHECK (COA_STATUS IN ('OPEN', 'SEL', 'CLOS')),
  coa_reserved_code VARCHAR2(32 BYTE),
  coa_last_changed DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT coa_pk PRIMARY KEY (coa_id),
  CONSTRAINT coa_cod_fk FOREIGN KEY (coa_cod_coh_id,coa_cod_line_number) REFERENCES phenix.customer_order_details (cod_coh_id,cod_line_number) ON DELETE CASCADE
);