CREATE OR REPLACE PACKAGE phenix.SEF_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  send_fax%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sef_id                         IN         send_fax.sef_id%TYPE,
  p_sef_rec                        OUT NOCOPY send_fax%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_sef_id                         IN         send_fax.sef_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sef_id                         IN         send_fax.sef_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sef_id                         IN         send_fax.sef_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sef_id                         IN         send_fax.sef_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sef_id                         IN         send_fax.sef_id%TYPE);


FUNCTION INSERT_FUNC(
  p_sef_jre_id             IN         send_fax.sef_jre_id%TYPE,
  p_sef_path               IN         send_fax.sef_path%TYPE,
  p_sef_number             IN         send_fax.sef_number%TYPE,
  p_sef_sent_date          IN         send_fax.sef_sent_date%TYPE               DEFAULT NULL,
  p_sef_fax_submissiontime IN         send_fax.sef_fax_submissiontime%TYPE      DEFAULT NULL,
  p_sef_fax_status         IN         send_fax.sef_fax_status%TYPE              DEFAULT NULL,
  p_sef_fax_errordesc      IN         send_fax.sef_fax_errordesc%TYPE           DEFAULT NULL,
  p_sef_fax_errorcode      IN         send_fax.sef_fax_errorcode%TYPE           DEFAULT NULL,
  p_sef_fax_sendpages      IN         send_fax.sef_fax_sendpages%TYPE           DEFAULT NULL,
  p_sef_fax_totalpages     IN         send_fax.sef_fax_totalpages%TYPE          DEFAULT NULL,
  p_sef_fax_retries        IN         send_fax.sef_fax_retries%TYPE             DEFAULT NULL,
  p_sef_creation_date      IN         send_fax.sef_creation_date%TYPE           DEFAULT systimestamp,
  p_sef_status_flag        IN         send_fax.sef_status_flag%TYPE             DEFAULT 'R')
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY send_fax%ROWTYPE)
RETURN NUMBER;

END SEF_PACK;
/