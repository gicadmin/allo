CREATE OR REPLACE PACKAGE phenix.CTR_OPERATION_PACK AS

FUNCTION DISPLAY_RELEASE_MESSAGE_FUNC(
  p_use_code     IN  users.use_code%TYPE,
  p_language     IN  VARCHAR2,
  p_message      OUT VARCHAR2,
  p_message_type OUT VARCHAR2,
  p_start_date   OUT VARCHAR2,
  p_end_date     OUT VARCHAR2
)
RETURN BOOLEAN;

PROCEDURE GET_COST_NAME_PROC(
  p_language  IN  VARCHAR2,
  p_cost_1    OUT control.ctr_cost_1_name%TYPE,
  p_cost_2    OUT control.ctr_cost_2_name%TYPE,
  p_cost_3    OUT control.ctr_cost_3_name%TYPE,
  p_cost_4    OUT control.ctr_cost_4_name%TYPE
);

FUNCTION GET_COST_NAME_FUNC(
  p_cost      IN NUMBER,
  p_language  IN VARCHAR2 DEFAULT 'FR'
)
RETURN VARCHAR2;

END CTR_OPERATION_PACK;
/