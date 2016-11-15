CREATE TABLE phenix.analyse_tables (
  atb_id NUMBER(15) NOT NULL,
  atb_table_name VARCHAR2(30 BYTE) NOT NULL,
  atb_need_analyse_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT atb_need_analyse_switch_ck CHECK (ATB_NEED_ANALYSE_SWITCH IN (0,1)),
  CONSTRAINT atb_pk PRIMARY KEY (atb_id)
);
COMMENT ON TABLE phenix.analyse_tables IS 'Table utilisée pour identifier les tables à analyser';
COMMENT ON COLUMN phenix.analyse_tables.atb_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.analyse_tables.atb_table_name IS 'Indique le nom de la table';
COMMENT ON COLUMN phenix.analyse_tables.atb_need_analyse_switch IS 'Indique que la table a besoin d''être analysé';