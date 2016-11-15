CREATE TABLE phenix.application_user_roles (
  auro_upro_id NUMBER(15) NOT NULL,
  auro_arol_id NUMBER(15) NOT NULL,
  auro_creation_date DATE DEFAULT sysdate NOT NULL,
  auro_modification_date DATE DEFAULT sysdate NOT NULL,
  CONSTRAINT auro_pk PRIMARY KEY (auro_upro_id,auro_arol_id),
  CONSTRAINT auro_apro_fk FOREIGN KEY (auro_upro_id) REFERENCES phenix.user_profiles (upro_id) ON DELETE CASCADE,
  CONSTRAINT auro_arol_fk FOREIGN KEY (auro_arol_id) REFERENCES phenix.application_roles (arol_id)
);