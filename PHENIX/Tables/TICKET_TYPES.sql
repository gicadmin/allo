CREATE TABLE phenix.ticket_types (
  tip_code NUMBER(4) NOT NULL,
  tip_description VARCHAR2(30 BYTE) NOT NULL,
  tip_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT tip_pk PRIMARY KEY (tip_code)
);
COMMENT ON TABLE phenix.ticket_types IS 'Identifie les types d''étiquette';
COMMENT ON COLUMN phenix.ticket_types.tip_code IS 'Numéro de type d''étiquette';
COMMENT ON COLUMN phenix.ticket_types.tip_description IS 'Description';
COMMENT ON COLUMN phenix.ticket_types.tip_alt_description IS 'Description alternative';