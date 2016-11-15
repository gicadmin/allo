CREATE TABLE phenix.tote_box_summaries (
  tbs_cus_code NUMBER(10) NOT NULL,
  tbs_tot_code VARCHAR2(5 BYTE) NOT NULL,
  tbs_quantity_in NUMBER(7) NOT NULL,
  tbs_quantity_out NUMBER(7) NOT NULL,
  tbs_last_transaction_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT tbs_pk PRIMARY KEY (tbs_cus_code,tbs_tot_code),
  CONSTRAINT tbs_cus_fk FOREIGN KEY (tbs_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT tbs_tot_fk FOREIGN KEY (tbs_tot_code) REFERENCES phenix.tote_box_types (tot_code)
);
COMMENT ON COLUMN phenix.tote_box_summaries.tbs_cus_code IS 'Indique le code de client';
COMMENT ON COLUMN phenix.tote_box_summaries.tbs_tot_code IS 'Indique le type de caisson (tote)';
COMMENT ON COLUMN phenix.tote_box_summaries.tbs_quantity_in IS 'Indique la balance des quantités entrante';
COMMENT ON COLUMN phenix.tote_box_summaries.tbs_quantity_out IS 'Indique la balance des quantités sortante';
COMMENT ON COLUMN phenix.tote_box_summaries.tbs_last_transaction_date IS 'Indique la date de dernière mise a jour';