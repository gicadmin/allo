CREATE TABLE phenix.transfer_users (
  tru_use_code NUMBER(5) NOT NULL,
  tru_trh_id NUMBER(15) NOT NULL,
  CONSTRAINT tru_pk PRIMARY KEY (tru_use_code,tru_trh_id),
  CONSTRAINT tru_trh_fk FOREIGN KEY (tru_trh_id) REFERENCES phenix.transfer_headers (trh_id) ON DELETE CASCADE,
  CONSTRAINT tru_use_fk FOREIGN KEY (tru_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.transfer_users IS 'Table utilisé pour garder des traces de la réception d''interco par utilisateur';
COMMENT ON COLUMN phenix.transfer_users.tru_use_code IS 'Indique le code de l''utilisateur';
COMMENT ON COLUMN phenix.transfer_users.tru_trh_id IS 'Indique le numéro de transfert';