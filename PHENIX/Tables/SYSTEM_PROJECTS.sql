CREATE TABLE phenix.system_projects (
  spj_id NUMBER(15) NOT NULL,
  spj_name VARCHAR2(400 BYTE) NOT NULL,
  spj_context VARCHAR2(150 BYTE) NOT NULL,
  spj_creation_date DATE DEFAULT SYSDATE NOT NULL,
  spj_mod_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT spj_name_context_uk UNIQUE (spj_name,spj_context),
  CONSTRAINT spj_pk PRIMARY KEY (spj_id)
);
COMMENT ON TABLE phenix.system_projects IS 'Table contenant les différents (particulièrement les projets web)';
COMMENT ON COLUMN phenix.system_projects.spj_id IS 'Indique le code unique de la variable projet';
COMMENT ON COLUMN phenix.system_projects.spj_name IS 'Indique le nom du logiciel';
COMMENT ON COLUMN phenix.system_projects.spj_context IS 'Indique le nom de context du logiciel';
COMMENT ON COLUMN phenix.system_projects.spj_creation_date IS 'Indique la date de création du paramètre';
COMMENT ON COLUMN phenix.system_projects.spj_mod_date IS 'Indique la date de modification du paramètre';