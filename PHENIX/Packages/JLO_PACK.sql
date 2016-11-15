CREATE OR REPLACE PACKAGE phenix.JLO_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  job_logs%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_jlo_id                         IN         job_logs.jlo_id%TYPE,
  p_jlo_rec                        OUT NOCOPY job_logs%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_jlo_id                         IN         job_logs.jlo_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_jlo_id                         IN         job_logs.jlo_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_jlo_id                         IN         job_logs.jlo_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_jlo_id                         IN         job_logs.jlo_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_jlo_id                         IN         job_logs.jlo_id%TYPE);


FUNCTION INSERT_FUNC(
  p_jlo_pse_pro_id             IN         job_logs.jlo_pse_pro_id%TYPE                  DEFAULT NULL,
  p_jlo_pse_sequence_execution IN         job_logs.jlo_pse_sequence_execution%TYPE      DEFAULT NULL,
  p_jlo_jsc_id                 IN         job_logs.jlo_jsc_id%TYPE                      DEFAULT NULL,
  p_jlo_jobtype                IN         job_logs.jlo_jobtype%TYPE                     DEFAULT NULL,
  p_jlo_queue                  IN         job_logs.jlo_queue%TYPE                       DEFAULT NULL,
  p_jlo_jobname                IN         job_logs.jlo_jobname%TYPE                     DEFAULT NULL,
  p_jlo_statuscode             IN         job_logs.jlo_statuscode%TYPE                  DEFAULT NULL,
  p_jlo_statustext             IN         job_logs.jlo_statustext%TYPE                  DEFAULT NULL,
  p_jlo_jobowner               IN         job_logs.jlo_jobowner%TYPE                    DEFAULT NULL,
  p_jlo_outputtype             IN         job_logs.jlo_outputtype%TYPE                  DEFAULT NULL,
  p_jlo_outputname             IN         job_logs.jlo_outputname%TYPE                  DEFAULT NULL,
  p_jlo_queuedat               IN         job_logs.jlo_queuedat%TYPE                    DEFAULT NULL,
  p_jlo_startedat              IN         job_logs.jlo_startedat%TYPE                   DEFAULT NULL,
  p_jlo_finishedat             IN         job_logs.jlo_finishedat%TYPE                  DEFAULT NULL,
  p_jlo_nextrunat              IN         job_logs.jlo_nextrunat%TYPE                   DEFAULT NULL,
  p_jlo_parentjob              IN         job_logs.jlo_parentjob%TYPE                   DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY job_logs%ROWTYPE)
RETURN NUMBER;

END JLO_PACK;
/