CREATE TABLE phenix.job_pdf_01 (
  jpd_jlo_id NUMBER(*,0) NOT NULL,
  jpd_pdf BLOB NOT NULL,
  CONSTRAINT jpd_01_pk PRIMARY KEY (jpd_jlo_id),
  CONSTRAINT jpd_jlo_01_fk FOREIGN KEY (jpd_jlo_id) REFERENCES phenix.job_logs (jlo_id)
);