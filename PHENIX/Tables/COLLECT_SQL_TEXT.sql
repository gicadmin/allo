CREATE TABLE phenix.collect_sql_text (
  dbid NUMBER NOT NULL,
  sql_id VARCHAR2(13 BYTE) NOT NULL,
  sql_text CLOB,
  command_type NUMBER,
  collect_date DATE DEFAULT (sysdate),
  CONSTRAINT cst_pk PRIMARY KEY (dbid,sql_id)
);