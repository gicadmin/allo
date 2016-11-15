CREATE TABLE phenix.inventory_adjustment_types (
  iat_code NUMBER(3) NOT NULL,
  iat_description VARCHAR2(30 BYTE) NOT NULL,
  iat_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT iat_pk PRIMARY KEY (iat_code)
);
COMMENT ON TABLE phenix.inventory_adjustment_types IS 'La table des raisons d''ajustement d''inventaire est utilisé pour définir les différents types d''ajustements';
COMMENT ON COLUMN phenix.inventory_adjustment_types.iat_code IS 'Identifiant unique';
COMMENT ON COLUMN phenix.inventory_adjustment_types.iat_description IS 'Description de la raison de l''ajustement';
COMMENT ON COLUMN phenix.inventory_adjustment_types.iat_alt_description IS 'Description alternative de la raison de l''ajustement';