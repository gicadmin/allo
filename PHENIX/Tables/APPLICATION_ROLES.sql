CREATE TABLE phenix.application_roles (
  arol_id NUMBER(15) NOT NULL,
  arol_arol_id NUMBER(15),
  arol_status VARCHAR2(10 BYTE) DEFAULT 'ACTIVE' NOT NULL CONSTRAINT arol_status_ck CHECK (arol_status IN ('ACTIVE', 'DISABLED')),
  arol_read_only NUMBER(1) DEFAULT 0 NOT NULL,
  arol_creation_date DATE DEFAULT sysdate NOT NULL,
  arol_modification_date DATE DEFAULT sysdate NOT NULL,
  CONSTRAINT arol_pk PRIMARY KEY (arol_id),
  CONSTRAINT arol_arol_fk FOREIGN KEY (arol_arol_id) REFERENCES phenix.application_roles (arol_id) ON DELETE CASCADE
);