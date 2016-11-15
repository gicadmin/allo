CREATE TABLE phenix.history_timeline_audit (
  hta_at_date DATE NOT NULL,
  hta_pfa_id NUMBER(11) NOT NULL,
  hta_pfa_whs_code VARCHAR2(2 BYTE) NOT NULL,
  hta_pfa_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  hta_pfa_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  hta_pfa_type VARCHAR2(3 BYTE) NOT NULL,
  hta_pfa_message VARCHAR2(4000 BYTE) NOT NULL,
  hta_pfa_date DATE NOT NULL,
  hta_pfa_stack_trace VARCHAR2(4000 BYTE) NOT NULL,
  hta_pfa_sales_type VARCHAR2(3 BYTE) NOT NULL,
  CONSTRAINT hta_pk PRIMARY KEY (hta_at_date,hta_pfa_id)
);