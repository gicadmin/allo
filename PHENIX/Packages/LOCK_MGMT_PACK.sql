CREATE OR REPLACE PACKAGE phenix.LOCK_MGMT_PACK AS

PROCEDURE LOCK_TRACE_PROC(
  p_rowid                 IN      ROWID);

procedure LOCK_RECORD_PROC(
  p_rowid                 IN      ROWID);

procedure DIAGNOSTIC_PROC(
  p_table_name            IN      VARCHAR2,
  p_launch_mode           IN      BOOLEAN       DEFAULT FALSE);

END LOCK_MGMT_PACK;
/