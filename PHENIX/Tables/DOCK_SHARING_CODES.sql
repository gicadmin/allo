CREATE TABLE phenix.dock_sharing_codes (
  dsc_code NUMBER(3) NOT NULL,
  dsc_description VARCHAR2(30 BYTE) NOT NULL,
  dsc_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT dsc_pk PRIMARY KEY (dsc_code)
);
COMMENT ON TABLE phenix.dock_sharing_codes IS 'Table contenant les codes de partage d''un quai d''expédition à plusieurs clients ou fournisseurs à la même heure';
COMMENT ON COLUMN phenix.dock_sharing_codes.dsc_code IS 'Indique le code de partage d''un quai d''expédition';
COMMENT ON COLUMN phenix.dock_sharing_codes.dsc_description IS 'Indique la description du code de partage d''un quai d''expédition';
COMMENT ON COLUMN phenix.dock_sharing_codes.dsc_alt_description IS 'Indique la description alternative du code de partage d''un quai d''expédition';