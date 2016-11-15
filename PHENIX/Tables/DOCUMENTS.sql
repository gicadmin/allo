CREATE TABLE phenix.documents (
  doc_code NUMBER(10) NOT NULL,
  doc_description VARCHAR2(30 BYTE) NOT NULL,
  doc_alt_description VARCHAR2(30 BYTE),
  doc_start_date DATE,
  doc_end_date DATE,
  doc_file_name VARCHAR2(200 BYTE) NOT NULL,
  doc_file BLOB,
  doc_creation_date DATE DEFAULT SYSDATE NOT NULL,
  doc_modification_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT doc_pk PRIMARY KEY (doc_code)
);
COMMENT ON TABLE phenix.documents IS 'Table des documents utilisÃ©s lors de la gÃ©nÃ©ration des routes de livraison';
COMMENT ON COLUMN phenix.documents.doc_code IS 'Indique le code du document';
COMMENT ON COLUMN phenix.documents.doc_description IS 'Indique la description du document';
COMMENT ON COLUMN phenix.documents.doc_alt_description IS 'Indique la description alternative du document';
COMMENT ON COLUMN phenix.documents.doc_start_date IS 'Indique la date de dÃ©but du document';
COMMENT ON COLUMN phenix.documents.doc_end_date IS 'Indique la date de fin du document';
COMMENT ON COLUMN phenix.documents.doc_file_name IS 'Indique le nom de fichier du document';
COMMENT ON COLUMN phenix.documents.doc_file IS 'Indique le fichier du document';
COMMENT ON COLUMN phenix.documents.doc_creation_date IS 'Indique le date de crÃ©ation du document';
COMMENT ON COLUMN phenix.documents.doc_modification_date IS 'Indique le date de modification du document';