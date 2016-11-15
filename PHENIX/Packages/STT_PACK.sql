CREATE OR REPLACE PACKAGE phenix.STT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  statistics_tracking_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_stt_code                       IN         statistics_tracking_types.stt_code%TYPE,
  p_stt_rec                        OUT NOCOPY statistics_tracking_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_stt_code                       IN         statistics_tracking_types.stt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_stt_code                       IN         statistics_tracking_types.stt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_stt_code                       IN         statistics_tracking_types.stt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_stt_code                       IN         statistics_tracking_types.stt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_stt_code                       IN         statistics_tracking_types.stt_code%TYPE);


PROCEDURE INSERT_PROC(
  p_stt_code                IN         statistics_tracking_types.stt_code%TYPE,
  p_stt_active_switch       IN         statistics_tracking_types.stt_active_switch%TYPE,
  p_stt_description         IN         statistics_tracking_types.stt_description%TYPE,
  p_stt_customer_table_flag IN         statistics_tracking_types.stt_customer_table_flag%TYPE,
  p_stt_alt_description     IN         statistics_tracking_types.stt_alt_description%TYPE          DEFAULT NULL,
  p_stt_ftp_server_name     IN         statistics_tracking_types.stt_ftp_server_name%TYPE          DEFAULT NULL,
  p_stt_ftp_login           IN         statistics_tracking_types.stt_ftp_login%TYPE                DEFAULT NULL,
  p_stt_ftp_password        IN         statistics_tracking_types.stt_ftp_password%TYPE             DEFAULT NULL,
  p_stt_ftp_port            IN         statistics_tracking_types.stt_ftp_port%TYPE                 DEFAULT NULL,
  p_stt_ftp_directory_name  IN         statistics_tracking_types.stt_ftp_directory_name%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY statistics_tracking_types%ROWTYPE);

END STT_PACK;
/