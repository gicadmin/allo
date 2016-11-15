CREATE OR REPLACE PACKAGE phenix.PICK_QUEUE_PACK AS

FUNCTION GET_QUEUE_NAME_FUNC(
  p_queue_name            IN    VARCHAR2
)RETURN VARCHAR2;

PROCEDURE INSERT_IN_QUEUE_PROC(
  p_plh_id  in  pick_list_headers.plh_id%type,
  p_vph_id  in  vendor_pick_headers.vph_id%type
);

PROCEDURE UNLOAD_QUEUE_PROC(
  p_jsc_id  IN  job_schedules.jsc_id%TYPE
);

END PICK_QUEUE_PACK;
/