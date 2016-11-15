CREATE TABLE phenix.gcl9229_programs (
  pro_type VARCHAR2(3 BYTE) NOT NULL,
  pro_alternate_description VARCHAR2(200 BYTE) NOT NULL,
  pro_command VARCHAR2(200 BYTE) NOT NULL,
  pro_description VARCHAR2(200 BYTE) NOT NULL,
  pro_name VARCHAR2(200 BYTE) NOT NULL,
  pro_id NUMBER(*,0) NOT NULL,
  pro_prn_id NUMBER(*,0),
  pro_extension VARCHAR2(7 BYTE),
  pro_alert_switch NUMBER(1) NOT NULL,
  pro_extract_query CLOB,
  pro_extract_header CLOB,
  pro_environment VARCHAR2(30 BYTE)
);