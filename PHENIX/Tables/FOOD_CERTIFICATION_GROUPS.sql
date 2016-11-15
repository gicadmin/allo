CREATE TABLE phenix.food_certification_groups (
  fcg_code NUMBER(4) NOT NULL,
  fcg_description VARCHAR2(45 BYTE) NOT NULL,
  fcg_alt_description VARCHAR2(45 BYTE) NOT NULL,
  fcg_broker_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT fcg_broker_switch_ck CHECK (FCG_BROKER_SWITCH IN (0,1)),
  CONSTRAINT fcg_pk PRIMARY KEY (fcg_code)
);
COMMENT ON TABLE phenix.food_certification_groups IS 'Table contenant les groupes de certification';
COMMENT ON COLUMN phenix.food_certification_groups.fcg_code IS 'Indique le code du groupe de certification';
COMMENT ON COLUMN phenix.food_certification_groups.fcg_description IS 'Indique la description du groupe de certification';
COMMENT ON COLUMN phenix.food_certification_groups.fcg_alt_description IS 'Indique la description alternative du groupe de certification';
COMMENT ON COLUMN phenix.food_certification_groups.fcg_broker_switch IS 'Indique que le c’est un groupe qui provient du courtier principal';