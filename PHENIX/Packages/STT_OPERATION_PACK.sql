CREATE OR REPLACE PACKAGE phenix.STT_OPERATION_PACK IS

FUNCTION GET_FIRST_SCU_FUNC(
  p_stt_code IN statistics_tracking_types.stt_code%TYPE,
  p_stg_code  IN statistics_tracking_customers.scu_stg_code%TYPE --CVI3391
)
RETURN NUMBER;

FUNCTION GET_FIRST_STG_FUNC(
  p_stt_code IN statistics_tracking_types.stt_code%TYPE
)
RETURN NUMBER;

FUNCTION GET_FIRST_STC_FUNC(
  p_stt_code IN statistics_tracking_types.stt_code%TYPE
)
RETURN NUMBER;

PROCEDURE SEND_FILE_BY_FTP_PROC(
  p_stt_code       IN statistics_tracking_types.stt_code%TYPE,
  p_directory_name IN VARCHAR2,
  p_file_name      IN VARCHAR2,
  p_as_file_name   IN VARCHAR2 DEFAULT NULL
);

END STT_OPERATION_PACK;
/