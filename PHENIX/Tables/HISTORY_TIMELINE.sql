CREATE TABLE phenix.history_timeline (
  htm_at_date DATE NOT NULL,
  htm_pfq_whs_code VARCHAR2(2 BYTE) NOT NULL,
  htm_pfq_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  htm_pfq_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  htm_pfq_date DATE NOT NULL,
  htm_pfq_type VARCHAR2(3 BYTE) NOT NULL,
  htm_pfq_quantity NUMBER(7) NOT NULL,
  htm_pfq_weight NUMBER(10,3) NOT NULL,
  htm_pfq_sales_type VARCHAR2(3 BYTE) NOT NULL,
  CONSTRAINT htm_pk PRIMARY KEY (htm_at_date,htm_pfq_whs_code,htm_pfq_prf_prd_code,htm_pfq_prf_fmt_code,htm_pfq_type,htm_pfq_sales_type,htm_pfq_date)
);