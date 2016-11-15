CREATE TABLE phenix.pfq_audit (
  pfa_id NUMBER(11) NOT NULL,
  pfa_whs_code VARCHAR2(2 BYTE) NOT NULL,
  pfa_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pfa_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  pfa_type VARCHAR2(3 BYTE) NOT NULL,
  pfa_message VARCHAR2(4000 BYTE) NOT NULL,
  pfa_date DATE DEFAULT SYSDATE NOT NULL,
  pfa_stack_trace VARCHAR2(4000 BYTE) NOT NULL,
  pfa_sales_type VARCHAR2(3 BYTE) DEFAULT 'REG' NOT NULL,
  CONSTRAINT pfa_pk PRIMARY KEY (pfa_id)
);
COMMENT ON COLUMN phenix.pfq_audit.pfa_sales_type IS 'Indique le type de vente, ''REG'' régulier ou ''LIQ'' Liquidation';