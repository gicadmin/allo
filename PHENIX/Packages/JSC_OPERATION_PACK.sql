CREATE OR REPLACE PACKAGE phenix.JSC_OPERATION_PACK AS

FUNCTION FIND_USE_LANG_FUNC (
  p_jsc_id  IN job_schedules.jsc_id%TYPE
)RETURN VARCHAR2;

FUNCTION GETJOBPARAMETER(
  p_jsc_id         IN NUMBER,
  p_parametername IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION SETJOB(
  p_use_code              IN users.use_code%TYPE,
  p_pro_name              IN programs.pro_name%TYPE,
  p_Initial               IN job_schedules.jsc_initial%TYPE       DEFAULT 'SYSDATE',
  p_Interval              IN interval_type.int_code%TYPE          DEFAULT 'NOW'
)
RETURN job_schedules.jsc_id%TYPE;

PROCEDURE SETPARAMETER(
    p_jsc_id              IN job_schedules.jsc_id%TYPE,
    p_parametername       IN default_parameters.dpa_code%TYPE,
    p_parametervalue      IN user_parameters.upa_user_value%TYPE
);

FUNCTION RUNREPORT(
  p_jsc_id             IN  job_schedules.jsc_id%TYPE,
  p_lang_code          IN  VARCHAR2,
  p_extension          IN  VARCHAR2,
  p_override_parm      IN  SRW_PARAMLIST  DEFAULT NULL,
  p_strong_validation  IN  BOOLEAN        DEFAULT FALSE
)
RETURN VARCHAR2;

FUNCTION RUNREPORT(
  p_jsc_id             IN  job_schedules.jsc_id%TYPE,
  p_lang_code          IN  VARCHAR2,
  p_override_parm      IN  SRW_PARAMLIST  DEFAULT NULL,
  p_strong_validation  IN  BOOLEAN        DEFAULT FALSE
)
RETURN VARCHAR2;

PROCEDURE SEND_FILE_BY_MAIL_PROC(
  p_jsc_id         IN job_schedules.jsc_id%TYPE,
  p_directory_name IN VARCHAR2,
  p_file_name      IN VARCHAR2,
  p_as_file_name   IN VARCHAR2 DEFAULT NULL
);

PROCEDURE RUN_BATCH_REPORT_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

PROCEDURE VERIF_JOB_TO_QUEUE_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

PROCEDURE DEACTIVATE_JOB_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

PROCEDURE ACTIVATE_JOB_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

PROCEDURE DEACTIVATE_JOB_IF_NO_JRE_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

PROCEDURE SUBMIT_PROC(
  p_command IN VARCHAR2
);

END JSC_OPERATION_PACK;
/