CREATE OR REPLACE PACKAGE phenix.SIO_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  sales_incentive_objectives%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sio_id                         IN         sales_incentive_objectives.sio_id%TYPE,
  p_sio_rec                        OUT NOCOPY sales_incentive_objectives%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sio_id                         IN         sales_incentive_objectives.sio_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_sio_id                         IN         sales_incentive_objectives.sio_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sio_id                         IN         sales_incentive_objectives.sio_id%TYPE);


FUNCTION INSERT_FUNC(
  p_sio_vsi_code           IN         sales_incentive_objectives.sio_vsi_code%TYPE,
  p_sio_min_objective      IN         sales_incentive_objectives.sio_min_objective%TYPE,
  p_sio_distributed_amount IN         sales_incentive_objectives.sio_distributed_amount%TYPE      DEFAULT NULL,
  p_sio_collected_amount   IN         sales_incentive_objectives.sio_collected_amount%TYPE        DEFAULT NULL,
  p_sio_freegood_quantity  IN         sales_incentive_objectives.sio_freegood_quantity%TYPE       DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY sales_incentive_objectives%ROWTYPE)
RETURN NUMBER;

END SIO_PACK;
/