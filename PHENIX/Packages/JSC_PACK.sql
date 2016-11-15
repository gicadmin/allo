CREATE OR REPLACE PACKAGE phenix.JSC_PACK IS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  job_schedules%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_jsc_id                         IN         job_schedules.jsc_id%TYPE,
  p_jsc_rec                        OUT NOCOPY job_schedules%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_jsc_id                         IN         job_schedules.jsc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_jsc_id                         IN         job_schedules.jsc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_jsc_id                         IN         job_schedules.jsc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_jsc_id                         IN         job_schedules.jsc_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_jsc_id                         IN         job_schedules.jsc_id%TYPE);


FUNCTION INSERT_FUNC(
  p_jsc_cre_date         IN         job_schedules.jsc_cre_date%TYPE,
  p_jsc_initial          IN         job_schedules.jsc_initial%TYPE,
  p_jsc_use_code         IN         job_schedules.jsc_use_code%TYPE,
  p_jsc_active           IN         job_schedules.jsc_active%TYPE,
  p_jsc_pro_id           IN         job_schedules.jsc_pro_id%TYPE,
  p_jsc_job_jobs         IN         job_schedules.jsc_job_jobs%TYPE              DEFAULT NULL,
  p_jsc_int_id           IN         job_schedules.jsc_int_id%TYPE                DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY job_schedules%ROWTYPE)
RETURN NUMBER;

FUNCTION RUNREPORT (
    p_jsc_id            IN NUMBER,
    p_lang_code         IN JOB_RECIPIENTS.JRE_LANG_CODE%type,
    p_override_parm     IN SRW_PARAMLIST DEFAULT NULL,
    p_strong_validation IN BOOLEAN DEFAULT FALSE
)
RETURN VARCHAR2;

END JSC_PACK;
/