CREATE OR REPLACE PACKAGE phenix.JRE_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  job_recipients%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_jre_id                         IN         job_recipients.jre_id%TYPE,
  p_jre_rec                        OUT NOCOPY job_recipients%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_jre_id                         IN         job_recipients.jre_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_jre_id                         IN         job_recipients.jre_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_jre_id                         IN         job_recipients.jre_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_jre_id                         IN         job_recipients.jre_id%TYPE);


FUNCTION INSERT_FUNC(
  p_jre_jsc_id           IN         job_recipients.jre_jsc_id%TYPE,
  p_jre_prn_id           IN         job_recipients.jre_prn_id%TYPE                DEFAULT NULL,
  p_jre_dest_type        IN         job_recipients.jre_dest_type%TYPE             DEFAULT NULL,
  p_jre_use_code         IN         job_recipients.jre_use_code%TYPE              DEFAULT NULL,
  p_jre_email            IN         job_recipients.jre_email%TYPE                 DEFAULT NULL,
  p_jre_cont_type        IN         job_recipients.jre_cont_type%TYPE             DEFAULT NULL,
  p_jre_fax_number       IN         job_recipients.jre_fax_number%TYPE            DEFAULT NULL,
  p_jre_file_name        IN         job_recipients.jre_file_name%TYPE             DEFAULT NULL,
  p_jre_cc_email         IN         job_recipients.jre_cc_email%TYPE              DEFAULT NULL,
  p_jre_bcc_email        IN         job_recipients.jre_bcc_email%TYPE             DEFAULT NULL,
  p_jre_from_email       IN         job_recipients.jre_from_email%TYPE            DEFAULT NULL,
  p_jre_lang_code        IN         job_recipients.jre_lang_code%TYPE             DEFAULT 'FR' ,
  p_jre_extension        IN         job_recipients.jre_extension%TYPE             DEFAULT 'PDF' )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY job_recipients%ROWTYPE)
RETURN NUMBER;

END JRE_PACK;
/