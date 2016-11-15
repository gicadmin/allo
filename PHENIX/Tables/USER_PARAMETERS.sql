CREATE TABLE phenix.user_parameters (
  upa_user_value VARCHAR2(200 BYTE),
  upa_id NUMBER(*,0) NOT NULL,
  upa_dpa_id NUMBER(*,0) NOT NULL,
  upa_jsc_id NUMBER(*,0) NOT NULL,
  CONSTRAINT upa_pk PRIMARY KEY (upa_id),
  CONSTRAINT upa_dpa_fk FOREIGN KEY (upa_dpa_id) REFERENCES phenix.default_parameters (dpa_id),
  CONSTRAINT upa_jsc_fk FOREIGN KEY (upa_jsc_id) REFERENCES phenix.job_schedules (jsc_id) ON DELETE CASCADE
);