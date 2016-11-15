CREATE TABLE phenix.tote_box_transactions (
  tbo_id NUMBER(7) NOT NULL,
  tbo_tot_code VARCHAR2(5 BYTE) NOT NULL,
  tbo_cus_code NUMBER(10) NOT NULL,
  tbo_tot_status VARCHAR2(1 BYTE) NOT NULL CONSTRAINT tbo_status_ck CHECK (TBO_TOT_STATUS IN ('I','O')),
  tbo_pmh_id NUMBER(15),
  tbo_quantity NUMBER(5) NOT NULL,
  tbo_return_date DATE,
  tbo_use_code NUMBER(5),
  tbo_comment VARCHAR2(100 BYTE),
  CONSTRAINT tot_box_transaction_pk PRIMARY KEY (tbo_id),
  CONSTRAINT tbo_cus_fk FOREIGN KEY (tbo_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT tbo_pmh_fk FOREIGN KEY (tbo_pmh_id) REFERENCES phenix.pick_mission_headers (pmh_id) ON DELETE SET NULL,
  CONSTRAINT tbo_tot_fk FOREIGN KEY (tbo_tot_code) REFERENCES phenix.tote_box_types (tot_code),
  CONSTRAINT tbo_use_fk FOREIGN KEY (tbo_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.tote_box_transactions IS 'Table  Table contenant les transactions entrantes et sortantes pour les bacs';
COMMENT ON COLUMN phenix.tote_box_transactions.tbo_id IS 'Indique le numéro de la transaction ';
COMMENT ON COLUMN phenix.tote_box_transactions.tbo_tot_code IS 'Indique le type de bac ';
COMMENT ON COLUMN phenix.tote_box_transactions.tbo_cus_code IS 'Indique le code client ';
COMMENT ON COLUMN phenix.tote_box_transactions.tbo_tot_status IS 'Indique le type de la transaction ';
COMMENT ON COLUMN phenix.tote_box_transactions.tbo_pmh_id IS 'Indique le numéro de la mission ';
COMMENT ON COLUMN phenix.tote_box_transactions.tbo_quantity IS 'Indique le nombre de bacs ';
COMMENT ON COLUMN phenix.tote_box_transactions.tbo_return_date IS 'Indique la date de retour des bacs ';
COMMENT ON COLUMN phenix.tote_box_transactions.tbo_use_code IS 'Indique le code de l''utilisateur ';
COMMENT ON COLUMN phenix.tote_box_transactions.tbo_comment IS 'Indique le commentaire de l''utilisateur s''il y a des modifications sur la quantité ';