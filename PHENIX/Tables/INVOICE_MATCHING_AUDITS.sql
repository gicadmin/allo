CREATE TABLE phenix.invoice_matching_audits (
  ima_id NUMBER(15) NOT NULL,
  ima_whs_code VARCHAR2(2 BYTE) NOT NULL,
  ima_mah_reference_number VARCHAR2(22 BYTE) NOT NULL,
  ima_mad_mah_ap_invoice_number NUMBER(15) NOT NULL,
  ima_mad_line_number NUMBER(6) NOT NULL,
  ima_mad_pod_poh_id NUMBER(15) NOT NULL,
  ima_mad_pod_line_number NUMBER(4) NOT NULL,
  ima_date DATE NOT NULL,
  ima_use_code NUMBER(5) NOT NULL,
  ima_source VARCHAR2(50 BYTE) NOT NULL,
  ima_name_field VARCHAR2(30 BYTE) NOT NULL,
  ima_before_modif VARCHAR2(100 BYTE),
  ima_after_modif VARCHAR2(100 BYTE),
  ima_pdi_dit_code NUMBER(3),
  CONSTRAINT ima_pk PRIMARY KEY (ima_id),
  CONSTRAINT ima_mad_fk FOREIGN KEY (ima_mad_mah_ap_invoice_number,ima_mad_line_number) REFERENCES phenix.match_details (mad_mah_ap_invoice_number,mad_line_number) ON DELETE CASCADE,
  CONSTRAINT ima_mad_pod_fk FOREIGN KEY (ima_mad_pod_poh_id,ima_mad_pod_line_number) REFERENCES phenix.purchase_order_details (pod_poh_id,pod_line_number) ON DELETE CASCADE,
  CONSTRAINT ima_pdi_dit_fk FOREIGN KEY (ima_pdi_dit_code) REFERENCES phenix.discount_types (dit_code),
  CONSTRAINT ima_use_fk FOREIGN KEY (ima_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT ima_whs_fk FOREIGN KEY (ima_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON COLUMN phenix.invoice_matching_audits.ima_id IS 'Indique la clé unique de la table';
COMMENT ON COLUMN phenix.invoice_matching_audits.ima_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.invoice_matching_audits.ima_mad_mah_ap_invoice_number IS 'Indique le numéro de l''entête de la reconciliation';
COMMENT ON COLUMN phenix.invoice_matching_audits.ima_mad_line_number IS 'Indique le numéro de ligne de la réconciliation';
COMMENT ON COLUMN phenix.invoice_matching_audits.ima_mad_pod_poh_id IS 'Indique le numéro de commande d''achat';
COMMENT ON COLUMN phenix.invoice_matching_audits.ima_mad_pod_line_number IS 'Indique le numéro de ligne de commande d''achat';
COMMENT ON COLUMN phenix.invoice_matching_audits.ima_date IS 'Indique la date de modification';
COMMENT ON COLUMN phenix.invoice_matching_audits.ima_use_code IS 'Indique l''utilisateur qui a effectué le changement';
COMMENT ON COLUMN phenix.invoice_matching_audits.ima_source IS 'Indique la source de changement';
COMMENT ON COLUMN phenix.invoice_matching_audits.ima_name_field IS 'Indique le nom du champ qui a changé';
COMMENT ON COLUMN phenix.invoice_matching_audits.ima_before_modif IS 'Indique la valeur du champ avant la modification';
COMMENT ON COLUMN phenix.invoice_matching_audits.ima_after_modif IS 'Indique la valeur du champ aprés la modification';
COMMENT ON COLUMN phenix.invoice_matching_audits.ima_pdi_dit_code IS 'Indique l''escompte qui a subi un changement';