CREATE OR REPLACE PACKAGE phenix.USM_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  user_skipped_missions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_usm_pmh_id                     IN         user_skipped_missions.usm_pmh_id%TYPE,
  p_usm_use_code                   IN         user_skipped_missions.usm_use_code%TYPE,
  p_usm_rec                        OUT NOCOPY user_skipped_missions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_usm_pmh_id                     IN         user_skipped_missions.usm_pmh_id%TYPE,
  p_usm_use_code                   IN         user_skipped_missions.usm_use_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_usm_pmh_id                     IN         user_skipped_missions.usm_pmh_id%TYPE,
  p_usm_use_code                   IN         user_skipped_missions.usm_use_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_usm_pmh_id                     IN         user_skipped_missions.usm_pmh_id%TYPE,
  p_usm_use_code                   IN         user_skipped_missions.usm_use_code%TYPE);


PROCEDURE INSERT_PROC(
  p_usm_pmh_id           IN         user_skipped_missions.usm_pmh_id%TYPE,
  p_usm_use_code         IN         user_skipped_missions.usm_use_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY user_skipped_missions%ROWTYPE);

END USM_PACK;
/