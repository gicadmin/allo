CREATE TABLE phenix.default_parameters (
  dpa_parameter_type VARCHAR2(3 BYTE) NOT NULL CONSTRAINT dpa_parameter_type_ck CHECK (DPA_PARAMETER_TYPE IN ('NUM', 'CHR', 'DAT')),
  dpa_default_value VARCHAR2(100 BYTE),
  dpa_code VARCHAR2(20 BYTE) NOT NULL,
  dpa_display_sequence NUMBER NOT NULL,
  dpa_id NUMBER(*,0) NOT NULL,
  dpa_pro_id NUMBER(*,0) NOT NULL,
  dpa_sql_lov VARCHAR2(4000 BYTE),
  CONSTRAINT dpa_pk PRIMARY KEY (dpa_id),
  CONSTRAINT dpa_uk_i UNIQUE (dpa_code,dpa_pro_id),
  CONSTRAINT dpa_pro_fk FOREIGN KEY (dpa_pro_id) REFERENCES phenix.programs (pro_id)
);
COMMENT ON COLUMN phenix.default_parameters.dpa_parameter_type IS 'Indique le type du paramètre';
COMMENT ON COLUMN phenix.default_parameters.dpa_default_value IS 'Indique la valeur par défaut du paramètre';
COMMENT ON COLUMN phenix.default_parameters.dpa_code IS 'Indique le code du paramètre';
COMMENT ON COLUMN phenix.default_parameters.dpa_display_sequence IS 'Indique la séquence d''affichage du paramètre';
COMMENT ON COLUMN phenix.default_parameters.dpa_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.default_parameters.dpa_pro_id IS 'Indique le code de la tâche';
COMMENT ON COLUMN phenix.default_parameters.dpa_sql_lov IS 'Indique la liste de valeurs associée au paramètre';