CREATE TABLE phenix.delivery_accessories (
  dac_code NUMBER(3) NOT NULL,
  dac_description VARCHAR2(30 BYTE) NOT NULL,
  dac_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT dac_pk PRIMARY KEY (dac_code) USING INDEX (CREATE INDEX phenix.dac_pk ON phenix.delivery_accessories(dac_code)    )
);
COMMENT ON TABLE phenix.delivery_accessories IS 'Table de maintenance pour les divers accessoires pouvant être utilisés lors d''un chargement';
COMMENT ON COLUMN phenix.delivery_accessories.dac_code IS 'Indique le code de l''accessoire';
COMMENT ON COLUMN phenix.delivery_accessories.dac_description IS 'Indique la description de l''accessoire';
COMMENT ON COLUMN phenix.delivery_accessories.dac_alt_description IS 'Indique la description alternative de l''accessoire';