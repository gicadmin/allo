CREATE OR REPLACE PACKAGE phenix.SIO_OPERATION_PACK AS


PROCEDURE GET_AMOUNT_PROC(
  p_vsi_code                IN vendor_sales_incentives.vsi_code%TYPE,
  p_quantity                IN NUMBER,
  p_sio_distributed_amount  OUT sales_incentive_objectives.sio_distributed_amount%TYPE,
  p_sio_collected_amount    OUT sales_incentive_objectives.sio_collected_amount%TYPE
);


PROCEDURE GET_QUANTITY_PROC(
  p_vsi_code                IN vendor_sales_incentives.vsi_code%TYPE,
  p_quantity                IN NUMBER,
  p_free_not_vsi_qty_sold   IN NUMBER,
  p_televente_switch        IN NUMBER,
  p_sio_min_objective       OUT sales_incentive_objectives.sio_min_objective%TYPE,
  p_sio_freegood_quantity   OUT sales_incentive_objectives.sio_freegood_quantity%TYPE
);

FUNCTION IS_VALID_BRACKETS_FUNC(
  p_vsi_code                IN vendor_sales_incentives.vsi_code%TYPE,
  p_sio_min_objective       IN sales_incentive_objectives.sio_min_objective%TYPE
)
RETURN BOOLEAN;

--------------------------------------------------------------------------
PROCEDURE UPDATE_NULL_SIO_QUANTITY_PROC(
  p_sio_vsi_code   IN sales_incentive_objectives.sio_vsi_code%TYPE
) ;

PROCEDURE UPDATE_NULL_SIO_AMOUNT_PROC(
  p_sio_vsi_code     IN sales_incentive_objectives.sio_vsi_code%TYPE
) ;

FUNCTION SIO_DELETE_FUNC(
  p_sio_vsi_code       IN         sales_incentive_objectives.sio_vsi_code%TYPE
) RETURN NUMBER;

FUNCTION EXIST_SIO_FOR_VSI_FUNC(
 p_sio_vsi_code       IN         sales_incentive_objectives.sio_vsi_code%TYPE
) RETURN BOOLEAN;

END SIO_OPERATION_PACK;
/