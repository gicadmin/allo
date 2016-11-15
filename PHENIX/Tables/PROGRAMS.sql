CREATE TABLE phenix.programs (
  pro_type VARCHAR2(3 BYTE) NOT NULL CONSTRAINT pro_type_ck CHECK (PRO_TYPE IN ('PLS', 'RPT')),
  pro_alternate_description VARCHAR2(200 BYTE) NOT NULL,
  pro_command VARCHAR2(200 BYTE) NOT NULL,
  pro_description VARCHAR2(200 BYTE) NOT NULL,
  pro_name VARCHAR2(200 BYTE) NOT NULL,
  pro_id NUMBER(*,0) NOT NULL,
  pro_prn_id NUMBER(*,0),
  pro_alert_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pro_alert_switch_ck CHECK (PRO_ALERT_SWITCH IN (0,1)),
  pro_extract_query CLOB,
  pro_extract_header CLOB,
  pro_environment VARCHAR2(30 BYTE),
  CONSTRAINT pro_environment_ck CHECK ((pro_type ='RPT' AND pro_environment IS NOT NULL ) OR (pro_type <> 'RPT' AND pro_environment IS  NULL )),
  CONSTRAINT pro_pk PRIMARY KEY (pro_id),
  CONSTRAINT pro_uk UNIQUE (pro_name),
  CONSTRAINT pro_prn_fk FOREIGN KEY (pro_prn_id) REFERENCES phenix.printers (prn_id)
);
COMMENT ON COLUMN phenix.programs.pro_type IS 'Indique le type de la tâche';
COMMENT ON COLUMN phenix.programs.pro_alternate_description IS 'Indique la description alternative de la tâche';
COMMENT ON COLUMN phenix.programs.pro_command IS 'Indique la commande d''exécution de la tâche';
COMMENT ON COLUMN phenix.programs.pro_description IS 'Indique la description de la tâche';
COMMENT ON COLUMN phenix.programs.pro_name IS 'Indique le nom de la tâche';
COMMENT ON COLUMN phenix.programs.pro_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.programs.pro_prn_id IS 'Indique le code de l''imprimante';
COMMENT ON COLUMN phenix.programs.pro_alert_switch IS 'Indique si la tâche doit alerter le support lorsqu''elle est en erreur';
COMMENT ON COLUMN phenix.programs.pro_extract_query IS 'Indique la requête qui sera utilisée pour extraire de l''information et l''ajouter dans un fichier';
COMMENT ON COLUMN phenix.programs.pro_extract_header IS 'Indique l''entête à utiliser dans le fichier de l''extraction';
COMMENT ON COLUMN phenix.programs.pro_environment IS 'Indique l''environnement d''Ã©xÃ©cution du rapport';