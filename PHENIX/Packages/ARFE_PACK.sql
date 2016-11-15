CREATE OR REPLACE PACKAGE phenix.ARFE_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  application_role_features%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_arfe_arol_id                   IN         application_role_features.arfe_arol_id%TYPE,
  p_arfe_afea_id                   IN         application_role_features.arfe_afea_id%TYPE,
  p_arfe_rec                       OUT NOCOPY application_role_features%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_arfe_arol_id                   IN         application_role_features.arfe_arol_id%TYPE,
  p_arfe_afea_id                   IN         application_role_features.arfe_afea_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_arfe_arol_id                   IN         application_role_features.arfe_arol_id%TYPE,
  p_arfe_afea_id                   IN         application_role_features.arfe_afea_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_arfe_arol_id                   IN         application_role_features.arfe_arol_id%TYPE,
  p_arfe_afea_id                   IN         application_role_features.arfe_afea_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_arfe_arol_id                   IN         application_role_features.arfe_arol_id%TYPE,
  p_arfe_afea_id                   IN         application_role_features.arfe_afea_id%TYPE);


PROCEDURE INSERT_PROC(
  p_arfe_arol_id           IN         application_role_features.arfe_arol_id%TYPE,
  p_arfe_afea_id           IN         application_role_features.arfe_afea_id%TYPE,
  p_arfe_creation_date     IN         application_role_features.arfe_creation_date%TYPE          DEFAULT sysdate  ,
  p_arfe_modification_date IN         application_role_features.arfe_modification_date%TYPE      DEFAULT sysdate  );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY application_role_features%ROWTYPE);

END ARFE_PACK;
/