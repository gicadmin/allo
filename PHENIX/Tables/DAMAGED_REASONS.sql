CREATE TABLE phenix.damaged_reasons (
  dmr_code NUMBER(3) NOT NULL,
  dmr_description VARCHAR2(30 BYTE) NOT NULL,
  dmr_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT dmr_pk PRIMARY KEY (dmr_code)
);
COMMENT ON TABLE phenix.damaged_reasons IS 'Table qui contient les raisons pour une mise en localisation de bris';
COMMENT ON COLUMN phenix.damaged_reasons.dmr_code IS 'Indique le numéro de la raison';
COMMENT ON COLUMN phenix.damaged_reasons.dmr_description IS 'Indique la description de la raison';
COMMENT ON COLUMN phenix.damaged_reasons.dmr_alt_description IS 'Indique la description alternative de la raison';