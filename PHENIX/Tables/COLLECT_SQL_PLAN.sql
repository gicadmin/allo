CREATE TABLE phenix.collect_sql_plan (
  dbid NUMBER NOT NULL,
  sql_id VARCHAR2(13 BYTE) NOT NULL,
  plan_hash_value NUMBER NOT NULL,
  "ID" NUMBER NOT NULL,
  object_name VARCHAR2(31 BYTE),
  options VARCHAR2(30 BYTE),
  operation VARCHAR2(30 BYTE),
  search_columns NUMBER,
  "COST" NUMBER,
  "CARDINALITY" NUMBER,
  bytes NUMBER,
  cpu_cost NUMBER,
  io_cost NUMBER,
  collect_date DATE DEFAULT (sysdate),
  CONSTRAINT csp_pk PRIMARY KEY (dbid,sql_id,plan_hash_value,"ID")
);