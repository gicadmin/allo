CREATE TABLE phenix.indirect_billing_moments (
  ibm_ibh_id NUMBER(15) NOT NULL,
  ibm_qualificatif VARCHAR2(3 BYTE),
  ibm_date VARCHAR2(8 BYTE),
  ibm_hour VARCHAR2(4 BYTE),
  CONSTRAINT ibm_ibh_id_fk FOREIGN KEY (ibm_ibh_id) REFERENCES phenix.indirect_billing_headers (ibh_id)
);
COMMENT ON TABLE phenix.indirect_billing_moments IS 'Table contenant les lignes de date de fichiers 810 arrivés par EDI';
COMMENT ON COLUMN phenix.indirect_billing_moments.ibm_ibh_id IS 'Contient la clé pour lier avec la table des entêtes';
COMMENT ON COLUMN phenix.indirect_billing_moments.ibm_qualificatif IS 'Qualificatif de la date';
COMMENT ON COLUMN phenix.indirect_billing_moments.ibm_date IS 'Date (format YYYYMMDD)';
COMMENT ON COLUMN phenix.indirect_billing_moments.ibm_hour IS 'Heure (format 24h)';