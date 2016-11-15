CREATE TABLE phenix.temporary_caps_cods (
  tcc_tch_id NUMBER(15) NOT NULL,
  tcc_cod_coh_id NUMBER(15) NOT NULL,
  tcc_cod_line_number NUMBER(4) NOT NULL,
  tcc_cod_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  CONSTRAINT tcc_cod_fk FOREIGN KEY (tcc_cod_coh_id,tcc_cod_line_number) REFERENCES phenix.customer_order_details (cod_coh_id,cod_line_number) ON DELETE CASCADE,
  CONSTRAINT tcc_cod_prf_prd_fk FOREIGN KEY (tcc_cod_prf_prd_code) REFERENCES phenix.products (prd_code) ON DELETE CASCADE,
  CONSTRAINT tcc_tch_fk FOREIGN KEY (tcc_tch_id) REFERENCES phenix.temporary_caps_headers (tch_id) ON DELETE CASCADE
);