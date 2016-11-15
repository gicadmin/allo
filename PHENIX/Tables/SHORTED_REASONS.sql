CREATE TABLE phenix.shorted_reasons (
  shr_code NUMBER(3) NOT NULL,
  shr_description VARCHAR2(30 BYTE) NOT NULL,
  shr_fill_rate_switch NUMBER(1) NOT NULL CONSTRAINT shr_fill_rate_switch_ck CHECK (SHR_FILL_RATE_SWITCH IN (0, 1)),
  shr_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT shr_pk PRIMARY KEY (shr_code)
);
COMMENT ON TABLE phenix.shorted_reasons IS 'Explication pour les commandes a court';
COMMENT ON COLUMN phenix.shorted_reasons.shr_code IS 'Code des explication des a court';
COMMENT ON COLUMN phenix.shorted_reasons.shr_description IS 'Description';
COMMENT ON COLUMN phenix.shorted_reasons.shr_fill_rate_switch IS 'Indique si le code affect le taux de remplissage';
COMMENT ON COLUMN phenix.shorted_reasons.shr_alt_description IS 'Description alternative';