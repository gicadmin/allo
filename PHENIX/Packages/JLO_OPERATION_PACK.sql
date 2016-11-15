CREATE OR REPLACE PACKAGE phenix.JLO_OPERATION_PACK AS

PROCEDURE SET_SUCCESS_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

PROCEDURE SET_FAILURE_PROC(
  p_jsc_id      IN job_schedules.jsc_id%TYPE,
  p_error_code  IN NUMBER   DEFAULT SQLCODE,
  p_status_text IN VARCHAR2 DEFAULT SQLERRM
);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-----------------------------------------------------------------------------------------------

PROCEDURE SET_SUCCESS(
  p_jsc_id IN NUMBER
);

PROCEDURE SET_FAILURE(
  p_jsc_id     IN NUMBER,
  p_errcode    IN NUMBER,
  p_statustext IN VARCHAR2 DEFAULT 'Echec / Failure'
);

END JLO_OPERATION_PACK;
/