CREATE TABLE phenix.valid_parameters (
  vpa_table_name VARCHAR2(200 BYTE),
  vpa_sql_lov VARCHAR2(200 BYTE),
  vpa_err_msg VARCHAR2(200 BYTE),
  vpa_id NUMBER(*,0) NOT NULL,
  vpa_sql_string VARCHAR2(200 BYTE) NOT NULL,
  vpa_validate_sequence NUMBER NOT NULL,
  vpa_pro_id NUMBER(*,0),
  vpa_dpa_id NUMBER(*,0),
  CONSTRAINT vpa_pk PRIMARY KEY (vpa_id),
  CONSTRAINT vpa_dpa_fk FOREIGN KEY (vpa_dpa_id) REFERENCES phenix.default_parameters (dpa_id),
  CONSTRAINT vpa_pro_fk FOREIGN KEY (vpa_pro_id) REFERENCES phenix.programs (pro_id)
);