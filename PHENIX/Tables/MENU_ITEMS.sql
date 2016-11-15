CREATE TABLE phenix.menu_items (
  mni_code VARCHAR2(30 BYTE) NOT NULL,
  mni_mni_code VARCHAR2(30 BYTE),
  mni_description VARCHAR2(45 BYTE) NOT NULL,
  mni_sub_menu_switch NUMBER(1) NOT NULL CONSTRAINT mni_sub_menu_switch_ck CHECK (MNI_SUB_MENU_SWITCH IN (0, 1)),
  mni_alt_description VARCHAR2(45 BYTE),
  mni_form_based_option_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT mni_form_based_option_sw_ck CHECK (MNI_FORM_BASED_OPTION_SWITCH IN (0,1)),
  mni_web_services_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT mni_web_serv_swi_ck CHECK (MNI_WEB_SERVICES_SWITCH IN (0,1)),
  CONSTRAINT mni_pk PRIMARY KEY (mni_code),
  CONSTRAINT mni_mni_fk FOREIGN KEY (mni_mni_code) REFERENCES phenix.menu_items (mni_code)
);
COMMENT ON TABLE phenix.menu_items IS 'Contient les différentes options du menu';
COMMENT ON COLUMN phenix.menu_items.mni_code IS 'Code de l''option du menu';
COMMENT ON COLUMN phenix.menu_items.mni_mni_code IS 'Code parent de l''option du menu';
COMMENT ON COLUMN phenix.menu_items.mni_description IS 'Description de l''option du menu';
COMMENT ON COLUMN phenix.menu_items.mni_sub_menu_switch IS 'Indique si l''option du menu est un sous-menu';
COMMENT ON COLUMN phenix.menu_items.mni_alt_description IS 'Description alternative de l''option du menu';
COMMENT ON COLUMN phenix.menu_items.mni_form_based_option_switch IS 'Indique que l''écran est dans Phenix';
COMMENT ON COLUMN phenix.menu_items.mni_web_services_switch IS 'Indique que le menu fait appel à une fenêtre web en dehors de Phenix';