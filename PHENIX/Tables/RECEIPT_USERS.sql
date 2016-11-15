CREATE TABLE phenix.receipt_users (
  rcu_use_code NUMBER(5) NOT NULL,
  rcu_rth_id NUMBER(15) NOT NULL,
  CONSTRAINT rcu_pk PRIMARY KEY (rcu_use_code,rcu_rth_id),
  CONSTRAINT rcu_rth_fk FOREIGN KEY (rcu_rth_id) REFERENCES phenix.receipt_transaction_headers (rth_id) ON DELETE CASCADE,
  CONSTRAINT rcu_use_fk FOREIGN KEY (rcu_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.receipt_users IS 'La table log des utilisateurs de réception';
COMMENT ON COLUMN phenix.receipt_users.rcu_use_code IS 'Code d''utilisateur';
COMMENT ON COLUMN phenix.receipt_users.rcu_rth_id IS 'Numéro d''en-tête des historiques de réception';