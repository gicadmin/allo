CREATE OR REPLACE PACKAGE phenix.VRE_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  volume_rebate_exceptions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vre_id                         IN         volume_rebate_exceptions.vre_id%TYPE,
  p_vre_rec                        OUT NOCOPY volume_rebate_exceptions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vre_id                         IN         volume_rebate_exceptions.vre_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_vre_id                         IN         volume_rebate_exceptions.vre_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vre_id                         IN         volume_rebate_exceptions.vre_id%TYPE);


FUNCTION INSERT_FUNC(
  p_vre_vro_id                   IN         volume_rebate_exceptions.vre_vro_id%TYPE,
  p_vre_pgr_code                 IN         volume_rebate_exceptions.vre_pgr_code%TYPE                      DEFAULT NULL,
  p_vre_ven_code                 IN         volume_rebate_exceptions.vre_ven_code%TYPE                      DEFAULT NULL,
  p_vre_rebate_amount            IN         volume_rebate_exceptions.vre_rebate_amount%TYPE                 DEFAULT NULL,
  p_vre_rebate_percent           IN         volume_rebate_exceptions.vre_rebate_percent%TYPE                DEFAULT NULL,
  p_vre_drop_partnership_percent IN         volume_rebate_exceptions.vre_drop_partnership_percent%TYPE      DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY volume_rebate_exceptions%ROWTYPE)
RETURN NUMBER;

END VRE_PACK;
/