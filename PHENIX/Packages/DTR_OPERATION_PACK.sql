CREATE OR REPLACE PACKAGE phenix.DTR_OPERATION_PACK IS

procedure  GET_SESSION_INFO_PROC(
  p_rec                        OUT NOCOPY v$session%ROWTYPE,
  p_sid                        IN         v$session.audsid%TYPE);

procedure  GET_SESSION_INFO_PROC(
  p_rec                        OUT NOCOPY v$session%ROWTYPE);

PROCEDURE GENERATE_TRACE_PROC(
  p_message             IN  VARCHAR2,
  p_caller              IN  VARCHAR2);

PROCEDURE FORCE_RELOAD;

PROCEDURE FATAL(
  p_message             IN  VARCHAR2);    -- Level 1 message

PROCEDURE ERROR(
  p_message             IN  VARCHAR2);    -- Level 1 message

PROCEDURE WARN(
  p_message             IN  VARCHAR2);    -- Level 1 message

PROCEDURE INFO(
  p_message             IN  VARCHAR2);    -- Level 2 message

PROCEDURE DEBUG(
  p_message             IN  VARCHAR2);    -- Level 3 message

PROCEDURE TRACE(
  p_message             IN  VARCHAR2);    -- Level 3 message

PROCEDURE FATAL(
  p_caller              IN  VARCHAR2,
  p_message             IN  VARCHAR2);    -- Level 1 message

PROCEDURE ERROR(
  p_caller              IN  VARCHAR2,
  p_message             IN  VARCHAR2);    -- Level 1 message

PROCEDURE WARN(
  p_caller              IN  VARCHAR2,
  p_message             IN  VARCHAR2);    -- Level 1 message

PROCEDURE INFO(
  p_caller              IN  VARCHAR2,
  p_message             IN  VARCHAR2);    -- Level 2 message

PROCEDURE DEBUG(
  p_caller              IN  VARCHAR2,
  p_message             IN  VARCHAR2);    -- Level 3 message

PROCEDURE TRACE(
  p_caller              IN  VARCHAR2,
  p_message             IN  VARCHAR2);    -- Level 3 message

END DTR_OPERATION_PACK;
/