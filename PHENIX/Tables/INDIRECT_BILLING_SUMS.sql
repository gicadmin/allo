CREATE TABLE phenix.indirect_billing_sums (
  ibs_ibh_id NUMBER(15) NOT NULL,
  ibs_nb_of_lines VARCHAR2(30 BYTE),
  ibs_total_amount VARCHAR2(30 BYTE),
  ibs_total_federal_amount VARCHAR2(30 BYTE),
  ibs_total_provincial_amount VARCHAR2(30 BYTE),
  ibs_total_ticket_amount VARCHAR2(30 BYTE),
  ibs_total_transport_amount VARCHAR2(30 BYTE),
  CONSTRAINT ibs_ibh_id_fk FOREIGN KEY (ibs_ibh_id) REFERENCES phenix.indirect_billing_headers (ibh_id)
);
COMMENT ON TABLE phenix.indirect_billing_sums IS 'Table contenant les détails de charge/rabais des lignes de fichiers 810 arrivés par EDI';
COMMENT ON COLUMN phenix.indirect_billing_sums.ibs_ibh_id IS 'Contient la clé pour lier avec la table des entêtes';
COMMENT ON COLUMN phenix.indirect_billing_sums.ibs_nb_of_lines IS 'Nombre total de ligne dans la facture';
COMMENT ON COLUMN phenix.indirect_billing_sums.ibs_total_amount IS 'Montant total de la facture (incluant taxes et services)';
COMMENT ON COLUMN phenix.indirect_billing_sums.ibs_total_federal_amount IS 'Montant total de la taxe fédérale';
COMMENT ON COLUMN phenix.indirect_billing_sums.ibs_total_provincial_amount IS 'Montant total de la taxe provinciale';
COMMENT ON COLUMN phenix.indirect_billing_sums.ibs_total_ticket_amount IS 'Montant pour les étiquettes (déjà inclus dans le total de la facture)';
COMMENT ON COLUMN phenix.indirect_billing_sums.ibs_total_transport_amount IS 'Montant pour les frais de livraison (déjà inclus dans le total de la facture)';