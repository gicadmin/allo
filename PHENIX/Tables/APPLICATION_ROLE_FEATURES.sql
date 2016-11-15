CREATE TABLE phenix.application_role_features (
  arfe_arol_id NUMBER(15) NOT NULL,
  arfe_afea_id NUMBER(15) NOT NULL,
  arfe_creation_date DATE DEFAULT sysdate NOT NULL,
  arfe_modification_date DATE DEFAULT sysdate NOT NULL,
  CONSTRAINT arfe_pk PRIMARY KEY (arfe_arol_id,arfe_afea_id),
  CONSTRAINT arfe_afea_fk FOREIGN KEY (arfe_afea_id) REFERENCES phenix.application_features (afea_id) ON DELETE CASCADE,
  CONSTRAINT arfe_arol_fk FOREIGN KEY (arfe_arol_id) REFERENCES phenix.application_roles (arol_id) ON DELETE CASCADE
);