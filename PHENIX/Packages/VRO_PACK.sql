CREATE OR REPLACE PACKAGE phenix.VRO_PACK IS



FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  volume_rebate_objectives%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vro_id                         IN         volume_rebate_objectives.vro_id%TYPE,
  p_vro_rec                        OUT NOCOPY volume_rebate_objectives%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vro_id                         IN         volume_rebate_objectives.vro_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_vro_id                         IN         volume_rebate_objectives.vro_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vro_id                         IN         volume_rebate_objectives.vro_id%TYPE);


FUNCTION INSERT_FUNC(
  p_vro_vrg_code                 IN         volume_rebate_objectives.vro_vrg_code%TYPE,
  p_vro_objective_amount         IN         volume_rebate_objectives.vro_objective_amount%TYPE,
  p_vro_base_drop_rebate_percent IN         volume_rebate_objectives.vro_base_drop_rebate_percent%TYPE      DEFAULT NULL,
  p_vro_base_drop_rebate_amount  IN         volume_rebate_objectives.vro_base_drop_rebate_amount%TYPE       DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY volume_rebate_objectives%ROWTYPE)
RETURN NUMBER;

END VRO_PACK;
/