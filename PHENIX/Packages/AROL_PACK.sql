CREATE OR REPLACE PACKAGE phenix.AROL_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  application_roles%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_arol_id                        IN         application_roles.arol_id%TYPE,
  p_arol_rec                       OUT NOCOPY application_roles%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_arol_id                        IN         application_roles.arol_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_arol_id                        IN         application_roles.arol_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_arol_id                        IN         application_roles.arol_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_arol_id                        IN         application_roles.arol_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_arol_id                        IN         application_roles.arol_id%TYPE);


FUNCTION INSERT_FUNC(
  p_arol_status            IN         application_roles.arol_status%TYPE,
  p_arol_arol_id           IN         application_roles.arol_arol_id%TYPE                DEFAULT NULL,
  p_arol_creation_date     IN         application_roles.arol_creation_date%TYPE          DEFAULT sysdate  ,
  p_arol_modification_date IN         application_roles.arol_modification_date%TYPE      DEFAULT sysdate  )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY application_roles%ROWTYPE)
RETURN NUMBER;

END AROL_PACK;
/