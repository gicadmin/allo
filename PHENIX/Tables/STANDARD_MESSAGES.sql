CREATE TABLE phenix.standard_messages (
  stm_code NUMBER(5) NOT NULL,
  stm_description VARCHAR2(100 BYTE) NOT NULL,
  stm_alt_description VARCHAR2(100 BYTE),
  stm_short_code VARCHAR2(5 BYTE) NOT NULL,
  CONSTRAINT stm_pk PRIMARY KEY (stm_code),
  CONSTRAINT stm_short_uk UNIQUE (stm_short_code)
);
COMMENT ON COLUMN phenix.standard_messages.stm_code IS 'Indique le code du message';
COMMENT ON COLUMN phenix.standard_messages.stm_description IS 'Indique la description du message';
COMMENT ON COLUMN phenix.standard_messages.stm_alt_description IS 'Indique la description alternative du message';
COMMENT ON COLUMN phenix.standard_messages.stm_short_code IS 'Indique la description courte du message';