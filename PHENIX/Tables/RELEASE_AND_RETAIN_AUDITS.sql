CREATE TABLE phenix.release_and_retain_audits (
  rra_id NUMBER(15) NOT NULL,
  rra_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  rra_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  rra_loc_code VARCHAR2(12 BYTE) NOT NULL,
  rra_use_code NUMBER(5) NOT NULL,
  rra_quantity NUMBER(7),
  rra_weight NUMBER(10,3),
  rra_expiry_date DATE,
  rra_retain_switch NUMBER(1) NOT NULL CONSTRAINT rra_retain_switch_ck CHECK (rra_retain_switch IN (0, 1)),
  rra_transaction_date DATE DEFAULT SYSDATE NOT NULL,
  rra_whs_code VARCHAR2(2 BYTE) NOT NULL,
  rra_fifo_date DATE,
  CONSTRAINT rra_pk PRIMARY KEY (rra_id),
  CONSTRAINT rra_prf_fk FOREIGN KEY (rra_prf_prd_code,rra_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT rra_use_fk FOREIGN KEY (rra_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT rra_whs_fk FOREIGN KEY (rra_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.release_and_retain_audits IS 'Trace des opérations pour retenir ou relâcher un produit';
COMMENT ON COLUMN phenix.release_and_retain_audits.rra_id IS 'Identifiant';
COMMENT ON COLUMN phenix.release_and_retain_audits.rra_prf_prd_code IS 'Code du produit à retenir ou à relâcher';
COMMENT ON COLUMN phenix.release_and_retain_audits.rra_prf_fmt_code IS 'Format du produit à retenir ou à relâcher';
COMMENT ON COLUMN phenix.release_and_retain_audits.rra_loc_code IS 'Localisation à retenir ou à relâcher';
COMMENT ON COLUMN phenix.release_and_retain_audits.rra_use_code IS 'Utilisateur qui a initié l''opération';
COMMENT ON COLUMN phenix.release_and_retain_audits.rra_quantity IS 'Quantité retenue ou relâchée';
COMMENT ON COLUMN phenix.release_and_retain_audits.rra_weight IS 'Poids retenu ou relâché';
COMMENT ON COLUMN phenix.release_and_retain_audits.rra_expiry_date IS 'Date d''expiration ou de production localisation/produit';
COMMENT ON COLUMN phenix.release_and_retain_audits.rra_retain_switch IS 'Type de l''opération Retenir/relâcher';
COMMENT ON COLUMN phenix.release_and_retain_audits.rra_transaction_date IS 'Date et heure de la transaction';
COMMENT ON COLUMN phenix.release_and_retain_audits.rra_whs_code IS 'Indique l''entrepôt où a eu lieu l''opération de retenir ou de relacher';
COMMENT ON COLUMN phenix.release_and_retain_audits.rra_fifo_date IS 'Indique la date FIFO du produit retenu ou relâché';