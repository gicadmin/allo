CREATE TABLE phenix.lock_trace_locks (
  ltl_ticket VARCHAR2(32 BYTE),
  ltl_addr RAW(8),
  ltl_kaddr RAW(8),
  ltl_sid NUMBER,
  ltl_type VARCHAR2(2 BYTE),
  ltl_id1 NUMBER,
  ltl_id2 NUMBER,
  ltl_lmode NUMBER,
  ltl_request NUMBER,
  ltl_ctime NUMBER,
  ltl_block NUMBER
);