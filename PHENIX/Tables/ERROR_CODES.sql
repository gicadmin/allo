CREATE TABLE phenix.error_codes (
  ccr_code NUMBER(5) NOT NULL,
  ccr_message VARCHAR2(200 BYTE) NOT NULL,
  ccr_alt_message VARCHAR2(200 BYTE) NOT NULL,
  CONSTRAINT ccr_pk PRIMARY KEY (ccr_code)
);
COMMENT ON TABLE phenix.error_codes IS 'Table des messages d''erreur';
COMMENT ON COLUMN phenix.error_codes.ccr_code IS 'Numéro de l''erreur';
COMMENT ON COLUMN phenix.error_codes.ccr_message IS 'Message français';
COMMENT ON COLUMN phenix.error_codes.ccr_alt_message IS 'Message anglais';