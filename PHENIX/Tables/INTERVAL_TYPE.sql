CREATE TABLE phenix.interval_type (
  int_alt_description VARCHAR2(200 BYTE),
  int_sql VARCHAR2(200 BYTE),
  int_id NUMBER(*,0) NOT NULL,
  int_code VARCHAR2(3 BYTE) NOT NULL,
  int_description VARCHAR2(200 BYTE) NOT NULL,
  CONSTRAINT int_pk PRIMARY KEY (int_id),
  CONSTRAINT int_uk UNIQUE (int_code)
);