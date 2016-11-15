CREATE TABLE phenix.job_schedules (
  jsc_cre_date DATE NOT NULL,
  jsc_initial VARCHAR2(25 BYTE) NOT NULL,
  jsc_job_jobs NUMBER(*,0),
  jsc_use_code NUMBER(5) NOT NULL,
  jsc_int_id NUMBER(*,0) NOT NULL,
  jsc_active VARCHAR2(3 BYTE) NOT NULL CONSTRAINT jsc_active_ck CHECK (JSC_ACTIVE IN ('INA', 'ACT')),
  jsc_id NUMBER(*,0) NOT NULL,
  jsc_pro_id NUMBER(*,0) NOT NULL,
  CONSTRAINT jsc_pk PRIMARY KEY (jsc_id),
  CONSTRAINT jsc_int_fk FOREIGN KEY (jsc_int_id) REFERENCES phenix.interval_type (int_id),
  CONSTRAINT jsc_pro_fk FOREIGN KEY (jsc_pro_id) REFERENCES phenix.programs (pro_id),
  CONSTRAINT jsc_use_code_fk FOREIGN KEY (jsc_use_code) REFERENCES phenix."USERS" (use_code)
);