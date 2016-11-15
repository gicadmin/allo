CREATE TABLE phenix.form_block_items (
  fbi_id NUMBER NOT NULL,
  fbi_block_name VARCHAR2(30 BYTE) NOT NULL,
  fbi_item_name VARCHAR2(30 BYTE),
  fbi_item_type VARCHAR2(1 BYTE) NOT NULL CONSTRAINT fbi_item_type_ck CHECK (FBI_ITEM_TYPE IN ('B', 'T')),
  fbi_mni_code VARCHAR2(30 BYTE) NOT NULL,
  fbi_label VARCHAR2(30 BYTE) NOT NULL,
  fbi_alt_label VARCHAR2(30 BYTE),
  CONSTRAINT fbi_id_pk PRIMARY KEY (fbi_id),
  CONSTRAINT fbi_mni_code_fk FOREIGN KEY (fbi_mni_code) REFERENCES phenix.menu_items (mni_code)
);
COMMENT ON TABLE phenix.form_block_items IS 'Table contenant les items situé dans les options de Phenix';
COMMENT ON COLUMN phenix.form_block_items.fbi_id IS 'Identifiant unique de l''item';
COMMENT ON COLUMN phenix.form_block_items.fbi_block_name IS 'Nom du bloc situé dans l''option Phenix';
COMMENT ON COLUMN phenix.form_block_items.fbi_item_name IS 'Nom de l''item situé dans le bloc';
COMMENT ON COLUMN phenix.form_block_items.fbi_item_type IS 'Indique le type d''item ( B = Bouton, T = Tab page (Onglet) )';
COMMENT ON COLUMN phenix.form_block_items.fbi_mni_code IS 'Indique l''option Phenix relié à l''item';
COMMENT ON COLUMN phenix.form_block_items.fbi_label IS 'Indique l''étiquette affiché sur l''item';
COMMENT ON COLUMN phenix.form_block_items.fbi_alt_label IS 'Indique l''étiquette alternative affiché sur l''item';