CREATE TABLE phenix.locks (
  lck_id NUMBER(15) NOT NULL,
  lck_code NUMBER(15) NOT NULL,
  lck_type VARCHAR2(3 BYTE) NOT NULL CONSTRAINT lck_type_ck CHECK (LCK_TYPE IN ('CUS', 'PCO', 'PMH', 'PMD', 'TRD', 'USE')),
  lck_menu_name VARCHAR2(60 BYTE),
  lck_use_code NUMBER(5) NOT NULL,
  lck_name VARCHAR2(128 BYTE) NOT NULL,
  lck_handle VARCHAR2(128 BYTE),
  lck_lock_id NUMBER(*,0),
  lck_creation_date DATE DEFAULT SYSDATE NOT NULL,
  lck_method VARCHAR2(30 BYTE) NOT NULL,
  lck_sid NUMBER NOT NULL,
  CONSTRAINT lck_name_uk UNIQUE (lck_code,lck_type,lck_menu_name),
  CONSTRAINT lck_pk PRIMARY KEY (lck_id) USING INDEX (CREATE INDEX phenix.lck_pk_i ON phenix.locks(lck_id)    ),
  CONSTRAINT lck_use_fk FOREIGN KEY (lck_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON COLUMN phenix.locks.lck_id IS 'Indique l''identifiant unique de la réservation';
COMMENT ON COLUMN phenix.locks.lck_code IS 'Indique le numéro/code utilisé pour établir la réservation';
COMMENT ON COLUMN phenix.locks.lck_type IS 'Indique le type auquel correspond la réservation';
COMMENT ON COLUMN phenix.locks.lck_menu_name IS 'Indique le nom de l''option dans laquelle la réservation a été effectuée';
COMMENT ON COLUMN phenix.locks.lck_use_code IS 'Indique le code de l''utilisateur lié à la réservation';
COMMENT ON COLUMN phenix.locks.lck_name IS 'Indique le nom de la réservation utilisé par Oracle pour générer un identifiant unique';
COMMENT ON COLUMN phenix.locks.lck_handle IS 'Indique la clé unique modifié par Oracle pour éviter les erreurs de programmation lors de la réservation';
COMMENT ON COLUMN phenix.locks.lck_lock_id IS 'Indique l''identifiant unique de la réservation effectuée par Oracle';
COMMENT ON COLUMN phenix.locks.lck_creation_date IS 'Indique la date de création de la réservation';
COMMENT ON COLUMN phenix.locks.lck_method IS 'Indique la méthode utilisée pour effectuer la réservation';
COMMENT ON COLUMN phenix.locks.lck_sid IS 'Indique le numéro de la session de la réservation';