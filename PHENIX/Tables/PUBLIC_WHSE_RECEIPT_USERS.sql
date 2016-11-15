CREATE TABLE phenix.public_whse_receipt_users (
  pwru_pwrh_id NUMBER(15) NOT NULL,
  pwru_use_code NUMBER(5) NOT NULL,
  CONSTRAINT pwru_pk PRIMARY KEY (pwru_pwrh_id,pwru_use_code),
  CONSTRAINT pwru_pwrh_fk FOREIGN KEY (pwru_pwrh_id) REFERENCES phenix.public_whse_receipt_headers (pwrh_id),
  CONSTRAINT pwru_use_fk FOREIGN KEY (pwru_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON COLUMN phenix.public_whse_receipt_users.pwru_pwrh_id IS 'Indique la clé primaire de l''en-tête des réceptions';
COMMENT ON COLUMN phenix.public_whse_receipt_users.pwru_use_code IS 'Indique le code d''utilisateur';