CREATE TABLE phenix.validate_rb_file (
  vrb_id NUMBER(15) NOT NULL,
  vrb_line VARCHAR2(2000 BYTE) NOT NULL,
  vrb_file_name VARCHAR2(200 BYTE) NOT NULL,
  vrb_line_number NUMBER(5) NOT NULL,
  vrb_error_message VARCHAR2(1000 BYTE)
);
COMMENT ON TABLE phenix.validate_rb_file IS 'Table temporaire qui contient les informations radio beacon';
COMMENT ON COLUMN phenix.validate_rb_file.vrb_id IS 'Identifiant de la table';
COMMENT ON COLUMN phenix.validate_rb_file.vrb_line IS 'Ligne du fichier Radio Beacon';
COMMENT ON COLUMN phenix.validate_rb_file.vrb_file_name IS 'Nom du fichier';
COMMENT ON COLUMN phenix.validate_rb_file.vrb_line_number IS 'Numéro de ligne';