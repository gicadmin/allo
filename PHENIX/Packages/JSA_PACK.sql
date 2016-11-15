CREATE OR REPLACE PACKAGE phenix.JSA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  job_schedule_audits%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_jsa_id                         IN         job_schedule_audits.jsa_id%TYPE,
  p_jsa_rec                        OUT NOCOPY job_schedule_audits%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_jsa_id                         IN         job_schedule_audits.jsa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_jsa_id                         IN         job_schedule_audits.jsa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_jsa_id                         IN         job_schedule_audits.jsa_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_jsa_id                         IN         job_schedule_audits.jsa_id%TYPE);


FUNCTION INSERT_FUNC(
  p_jsa_use_code         IN         job_schedule_audits.jsa_use_code%TYPE,
  p_jsa_delete_date      IN         job_schedule_audits.jsa_delete_date%TYPE,
  p_jsa_pro_id           IN         job_schedule_audits.jsa_pro_id%TYPE                DEFAULT NULL,
  p_jsa_int_id           IN         job_schedule_audits.jsa_int_id%TYPE                DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY job_schedule_audits%ROWTYPE)
RETURN NUMBER;

END JSA_PACK;
/