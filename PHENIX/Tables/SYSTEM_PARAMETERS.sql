CREATE TABLE phenix.system_parameters (
  spa_id NUMBER(20) NOT NULL,
  spa_spj_id NUMBER(15) NOT NULL,
  spa_sty_id NUMBER(15) NOT NULL,
  spa_key VARCHAR2(400 BYTE) NOT NULL,
  spa_value VARCHAR2(4000 BYTE),
  spa_description VARCHAR2(400 BYTE),
  spa_alt_description VARCHAR2(400 BYTE),
  spa_max_length NUMBER(10),
  spa_creation_date DATE DEFAULT SYSDATE NOT NULL,
  spa_mod_date DATE DEFAULT SYSDATE NOT NULL,
  spa_display_seq NUMBER(3),
  spa_editable_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT spa_editable_switch_ck CHECK (spa_editable_switch IN (0,1)),
  CONSTRAINT spa_pk PRIMARY KEY (spa_id),
  CONSTRAINT spa_uk UNIQUE (spa_spj_id,spa_key),
  CONSTRAINT spa_spj_fk FOREIGN KEY (spa_spj_id) REFERENCES phenix.system_projects (spj_id) ON DELETE CASCADE,
  CONSTRAINT spa_sty_fk FOREIGN KEY (spa_sty_id) REFERENCES phenix.system_project_parameter_types (sty_id)
);
COMMENT ON TABLE phenix.system_parameters IS 'Table contenant les paramètres systèmes des applications GIC';
COMMENT ON COLUMN phenix.system_parameters.spa_id IS 'Indique le code unique de la variable paramètre';
COMMENT ON COLUMN phenix.system_parameters.spa_spj_id IS 'Indique le code de projet rattaché au paramètre';
COMMENT ON COLUMN phenix.system_parameters.spa_sty_id IS 'Indique le type rattaché au paramètre';
COMMENT ON COLUMN phenix.system_parameters.spa_key IS 'Indique la clé du paramètre';
COMMENT ON COLUMN phenix.system_parameters.spa_value IS 'Indique la valeur du paramètre';
COMMENT ON COLUMN phenix.system_parameters.spa_description IS 'Indique la description du paramètre';
COMMENT ON COLUMN phenix.system_parameters.spa_alt_description IS 'Indique la description alternative du paramètre';
COMMENT ON COLUMN phenix.system_parameters.spa_max_length IS 'Indique la grandeur maximum du paramètre';
COMMENT ON COLUMN phenix.system_parameters.spa_creation_date IS 'Indique la date de création du paramètre';
COMMENT ON COLUMN phenix.system_parameters.spa_mod_date IS 'Indique la date de modification du paramètre';
COMMENT ON COLUMN phenix.system_parameters.spa_display_seq IS 'Indique la séquence d''affichage du paramètre';
COMMENT ON COLUMN phenix.system_parameters.spa_editable_switch IS 'Indique si le paramètre peut ètre modifié';