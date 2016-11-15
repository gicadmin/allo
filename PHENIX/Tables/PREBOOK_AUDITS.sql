CREATE TABLE phenix.prebook_audits (
  pba_id NUMBER(15) NOT NULL,
  pba_date DATE NOT NULL,
  pba_cod_coh_id NUMBER(15) NOT NULL,
  pba_cod_line_number NUMBER(4) NOT NULL,
  pba_use_code NUMBER(5) NOT NULL,
  pba_adjusted_quantity NUMBER(7),
  pba_adjusted_weight NUMBER(9,3),
  CONSTRAINT pba_pk PRIMARY KEY (pba_id),
  CONSTRAINT pba_cod_fk FOREIGN KEY (pba_cod_coh_id,pba_cod_line_number) REFERENCES phenix.customer_order_details (cod_coh_id,cod_line_number) ON DELETE CASCADE,
  CONSTRAINT pba_use_fk FOREIGN KEY (pba_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.prebook_audits IS 'Contient l''information sur la maintenance d''une réservation bulletin';
COMMENT ON COLUMN phenix.prebook_audits.pba_id IS 'Identifiant';
COMMENT ON COLUMN phenix.prebook_audits.pba_date IS 'Date et heure';
COMMENT ON COLUMN phenix.prebook_audits.pba_cod_coh_id IS 'Numéro de commande';
COMMENT ON COLUMN phenix.prebook_audits.pba_cod_line_number IS 'Numéro de ligne de commande';
COMMENT ON COLUMN phenix.prebook_audits.pba_use_code IS 'Code de l''utilisateur';
COMMENT ON COLUMN phenix.prebook_audits.pba_adjusted_quantity IS 'Nouvelle quantité';
COMMENT ON COLUMN phenix.prebook_audits.pba_adjusted_weight IS 'Nouveau poids';