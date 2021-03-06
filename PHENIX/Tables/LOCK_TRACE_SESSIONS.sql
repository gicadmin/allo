CREATE TABLE phenix.lock_trace_sessions (
  lts_ltr_ticket_code VARCHAR2(32 BYTE) NOT NULL,
  lts_saddr RAW(8),
  lts_sid NUMBER NOT NULL,
  lts_serial NUMBER,
  lts_audsid NUMBER,
  lts_paddr RAW(8),
  lts_user NUMBER,
  lts_username VARCHAR2(30 BYTE),
  lts_command NUMBER,
  lts_ownerid NUMBER,
  lts_taddr VARCHAR2(16 BYTE),
  lts_lockwait VARCHAR2(16 BYTE),
  lts_status VARCHAR2(8 BYTE),
  lts_server VARCHAR2(9 BYTE),
  lts_schema NUMBER,
  lts_schemaname VARCHAR2(30 BYTE),
  lts_osuser VARCHAR2(30 BYTE),
  lts_process VARCHAR2(12 BYTE),
  lts_machine VARCHAR2(64 BYTE),
  lts_terminal VARCHAR2(16 BYTE),
  lts_program VARCHAR2(64 BYTE),
  lts_type VARCHAR2(10 BYTE),
  lts_sql_address RAW(8),
  lts_sql_hash_value NUMBER,
  lts_sql_id VARCHAR2(13 BYTE),
  lts_sql_child_number NUMBER,
  lts_prev_sql_addr RAW(8),
  lts_prev_hash_value NUMBER,
  lts_prev_sql_id VARCHAR2(13 BYTE),
  lts_prev_child_number NUMBER,
  lts_module VARCHAR2(48 BYTE),
  lts_module_hash NUMBER,
  lts_action VARCHAR2(32 BYTE),
  lts_action_hash NUMBER,
  lts_client_info VARCHAR2(64 BYTE),
  lts_fixed_table_sequence NUMBER,
  lts_row_wait_obj NUMBER,
  lts_row_wait_file NUMBER,
  lts_row_wait_block NUMBER,
  lts_row_wait_row NUMBER,
  lts_logon_time DATE,
  lts_last_call_et NUMBER,
  lts_pdml_enabled VARCHAR2(3 BYTE),
  lts_failover_type VARCHAR2(13 BYTE),
  lts_failover_method VARCHAR2(10 BYTE),
  lts_failed_over VARCHAR2(3 BYTE),
  lts_resource_consumer_group VARCHAR2(32 BYTE),
  lts_pdml_status VARCHAR2(8 BYTE),
  lts_pddl_status VARCHAR2(8 BYTE),
  lts_pq_status VARCHAR2(8 BYTE),
  lts_current_queue_duration NUMBER,
  lts_client_identifier VARCHAR2(64 BYTE),
  lts_blocking_session_status VARCHAR2(11 BYTE),
  lts_blocking_session NUMBER,
  lts_seq NUMBER,
  lts_event_number NUMBER,
  lts_event VARCHAR2(64 BYTE),
  lts_p1text VARCHAR2(64 BYTE),
  lts_p1 NUMBER,
  lts_p1raw RAW(8),
  lts_p2text VARCHAR2(64 BYTE),
  lts_p2 NUMBER,
  lts_p2raw RAW(8),
  lts_p3text VARCHAR2(64 BYTE),
  lts_p3 NUMBER,
  lts_p3raw RAW(8),
  lts_wait_class_id NUMBER,
  lts_wait_class_number NUMBER,
  lts_wait_class VARCHAR2(64 BYTE),
  lts_wait_time NUMBER,
  lts_seconds_in_wait NUMBER,
  lts_state VARCHAR2(19 BYTE),
  lts_service_name VARCHAR2(64 BYTE),
  CONSTRAINT lts_pk PRIMARY KEY (lts_ltr_ticket_code,lts_sid),
  CONSTRAINT lts_ltr_fk FOREIGN KEY (lts_ltr_ticket_code) REFERENCES phenix.lock_traces (ltr_ticket_code) ON DELETE CASCADE
);