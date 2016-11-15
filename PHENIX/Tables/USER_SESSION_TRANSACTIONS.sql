CREATE TABLE phenix.user_session_transactions (
  ust_use_code NUMBER(5) NOT NULL,
  ust_start_date DATE NOT NULL,
  ust_end_date DATE,
  ust_menu_option VARCHAR2(100 BYTE),
  ust_id NUMBER(15) NOT NULL,
  ust_whs_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT ust_pk PRIMARY KEY (ust_id,ust_use_code,ust_start_date),
  CONSTRAINT ust_use_fk FOREIGN KEY (ust_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT ust_whs_fk FOREIGN KEY (ust_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.user_session_transactions IS 'La table log des accès utilisateurs';
COMMENT ON COLUMN phenix.user_session_transactions.ust_use_code IS 'Indique le code d''utilisateur';
COMMENT ON COLUMN phenix.user_session_transactions.ust_start_date IS 'Indique la date de début';
COMMENT ON COLUMN phenix.user_session_transactions.ust_end_date IS 'Indique la date de fin';
COMMENT ON COLUMN phenix.user_session_transactions.ust_menu_option IS 'Indique l''option du menu';
COMMENT ON COLUMN phenix.user_session_transactions.ust_id IS 'Indique la clé primaire';
COMMENT ON COLUMN phenix.user_session_transactions.ust_whs_code IS 'Indique l''entrepôt ';