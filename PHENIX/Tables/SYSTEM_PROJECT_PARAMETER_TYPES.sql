CREATE TABLE phenix.system_project_parameter_types (
  sty_id NUMBER(15) NOT NULL,
  sty_name VARCHAR2(400 BYTE) NOT NULL,
  sty_value_type VARCHAR2(150 BYTE) NOT NULL,
  sty_min_entry NUMBER(10),
  sty_max_entry NUMBER(10),
  sty_creation_date DATE DEFAULT SYSDATE NOT NULL,
  sty_mod_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT sty_name_uk UNIQUE (sty_name),
  CONSTRAINT sty_pk PRIMARY KEY (sty_id)
);
COMMENT ON TABLE phenix.system_project_parameter_types IS 'Table contenant la liste des types de paramètres que l''on peut affecté à la table SYSTEM_PARAMETERS';
COMMENT ON COLUMN phenix.system_project_parameter_types.sty_id IS 'Indique le code unique de chaque type';
COMMENT ON COLUMN phenix.system_project_parameter_types.sty_name IS 'Indique le nom du type';
COMMENT ON COLUMN phenix.system_project_parameter_types.sty_value_type IS 'Indique quel genre de valeur sera le type de valeur';
COMMENT ON COLUMN phenix.system_project_parameter_types.sty_min_entry IS 'Valeur minimale que l''on peut entrer';
COMMENT ON COLUMN phenix.system_project_parameter_types.sty_max_entry IS 'Valeur maximale que l''on peut entrer';
COMMENT ON COLUMN phenix.system_project_parameter_types.sty_creation_date IS 'Indique la date de création du type';
COMMENT ON COLUMN phenix.system_project_parameter_types.sty_mod_date IS 'Indique la date de modification du type';