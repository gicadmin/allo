CREATE TABLE phenix.sales_register_trans_headers (
  srth_id NUMBER(15) NOT NULL,
  srth_cre_code NUMBER(2) NOT NULL,
  srth_use_code NUMBER(5) NOT NULL,
  srth_date DATE DEFAULT SYSDATE NOT NULL,
  srth_type VARCHAR2(1 BYTE) NOT NULL CONSTRAINT srth_type_ck CHECK (SRTH_TYPE IN ('P','C','D','F','O','B','S')),
  srth_inh_id NUMBER(15),
  srth_amount NUMBER(10,2) NOT NULL,
  srth_srth_id NUMBER(15),
  srth_whs_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT srth_inh_ck CHECK ( (SRTH_INH_ID IS NOT NULL AND SRTH_TYPE IN ('P', 'S')) OR (SRTH_INH_ID IS NULL AND SRTH_TYPE NOT IN ('P', 'S')) ),
  CONSTRAINT srth_srth_ck CHECK ( (SRTH_SRTH_ID IS NOT NULL AND SRTH_TYPE IN ('P', 'C')) OR (SRTH_SRTH_ID IS NULL AND SRTH_TYPE NOT IN ('P', 'C')) ),
  CONSTRAINT srth_pk PRIMARY KEY (srth_id),
  CONSTRAINT srth_cre_code_fk FOREIGN KEY (srth_cre_code) REFERENCES phenix.cash_registers (cre_code),
  CONSTRAINT srth_inh_id_fk FOREIGN KEY (srth_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT srth_srth_fk FOREIGN KEY (srth_srth_id) REFERENCES phenix.sales_register_trans_headers (srth_id),
  CONSTRAINT srth_use_code_fk FOREIGN KEY (srth_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT srth_whs_fk FOREIGN KEY (srth_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.sales_register_trans_headers IS 'Table des entêtes des transactions de la caisse';
COMMENT ON COLUMN phenix.sales_register_trans_headers.srth_id IS 'Identifiant de la table';
COMMENT ON COLUMN phenix.sales_register_trans_headers.srth_cre_code IS 'Indique le code de la caisse';
COMMENT ON COLUMN phenix.sales_register_trans_headers.srth_use_code IS 'Indique L''utilisateur';
COMMENT ON COLUMN phenix.sales_register_trans_headers.srth_date IS 'Indique la date et heure de la transaction';
COMMENT ON COLUMN phenix.sales_register_trans_headers.srth_type IS 'Indique le type de la transaction ';
COMMENT ON COLUMN phenix.sales_register_trans_headers.srth_inh_id IS 'Indique le numéro de la facture';
COMMENT ON COLUMN phenix.sales_register_trans_headers.srth_amount IS 'Indique le montant de la transaction';
COMMENT ON COLUMN phenix.sales_register_trans_headers.srth_srth_id IS 'Indique l''identifiant de la transaction de départ lors d''un paiement en lot';
COMMENT ON COLUMN phenix.sales_register_trans_headers.srth_whs_code IS 'Indique le code d''entrepôt de la transaction';