CREATE TABLE phenix.schedules (
  sch_code NUMBER(6) NOT NULL,
  sch_use_code NUMBER(5) NOT NULL,
  sch_description VARCHAR2(30 BYTE) NOT NULL,
  sch_day NUMBER(1) NOT NULL CONSTRAINT sch_day_ck CHECK (SCH_DAY IN (2, 6, 5, 9, 7, 8, 3, 4, 1)),
  sch_type VARCHAR2(1 BYTE) NOT NULL CONSTRAINT sch_type_ck CHECK (SCH_TYPE IN ('T', 'V')),
  sch_week NUMBER(1) NOT NULL CONSTRAINT sch_week_ck CHECK (sch_week IN (0,1,2,3,4,5)),
  sch_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT sch_pk PRIMARY KEY (sch_code),
  CONSTRAINT sch_use_fk FOREIGN KEY (sch_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.schedules IS 'Contient les schedules';
COMMENT ON COLUMN phenix.schedules.sch_code IS 'Numéro de la cédule';
COMMENT ON COLUMN phenix.schedules.sch_use_code IS 'Code usager';
COMMENT ON COLUMN phenix.schedules.sch_description IS 'Description';
COMMENT ON COLUMN phenix.schedules.sch_day IS 'Jour de visite ou d''appel';
COMMENT ON COLUMN phenix.schedules.sch_type IS 'Indique si l''enregistrement est pour l''horaire du vendeur ou du télémarketing';
COMMENT ON COLUMN phenix.schedules.sch_week IS 'Semaine de visite ou d''appel';
COMMENT ON COLUMN phenix.schedules.sch_alt_description IS 'Description alternative';