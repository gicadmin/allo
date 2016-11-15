CREATE OR REPLACE PACKAGE phenix.AURO_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  application_user_roles%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_auro_upro_id                   IN         application_user_roles.auro_upro_id%TYPE,
  p_auro_arol_id                   IN         application_user_roles.auro_arol_id%TYPE,
  p_auro_rec                       OUT NOCOPY application_user_roles%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_auro_upro_id                   IN         application_user_roles.auro_upro_id%TYPE,
  p_auro_arol_id                   IN         application_user_roles.auro_arol_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_auro_upro_id                   IN         application_user_roles.auro_upro_id%TYPE,
  p_auro_arol_id                   IN         application_user_roles.auro_arol_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_auro_upro_id                   IN         application_user_roles.auro_upro_id%TYPE,
  p_auro_arol_id                   IN         application_user_roles.auro_arol_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_auro_upro_id                   IN         application_user_roles.auro_upro_id%TYPE,
  p_auro_arol_id                   IN         application_user_roles.auro_arol_id%TYPE);


PROCEDURE INSERT_PROC(
  p_auro_upro_id           IN         application_user_roles.auro_upro_id%TYPE,
  p_auro_arol_id           IN         application_user_roles.auro_arol_id%TYPE,
  p_auro_creation_date     IN         application_user_roles.auro_creation_date%TYPE          DEFAULT sysdate  ,
  p_auro_modification_date IN         application_user_roles.auro_modification_date%TYPE      DEFAULT sysdate  );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY application_user_roles%ROWTYPE);

END AURO_PACK;
/