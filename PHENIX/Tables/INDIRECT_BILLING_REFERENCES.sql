CREATE TABLE phenix.indirect_billing_references (
  ibr_ibh_id NUMBER(15) NOT NULL,
  ibr_reference_qualificatif VARCHAR2(2 BYTE),
  ibr_reference_value VARCHAR2(30 BYTE),
  CONSTRAINT ibr_ibh_id_fk FOREIGN KEY (ibr_ibh_id) REFERENCES phenix.indirect_billing_headers (ibh_id)
);
COMMENT ON TABLE phenix.indirect_billing_references IS 'Table contenant les lignes de références de fichiers 810 arrivés par EDI';
COMMENT ON COLUMN phenix.indirect_billing_references.ibr_ibh_id IS 'Contient la clé pour lier avec la table des entêtes';
COMMENT ON COLUMN phenix.indirect_billing_references.ibr_reference_qualificatif IS 'Qualificatif de la référence';
COMMENT ON COLUMN phenix.indirect_billing_references.ibr_reference_value IS 'Valeur de la référence';