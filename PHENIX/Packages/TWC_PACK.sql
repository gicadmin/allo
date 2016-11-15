CREATE OR REPLACE PACKAGE phenix.TWC_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  truck_warehouse_conditions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_twc_id                         IN         truck_warehouse_conditions.twc_id%TYPE,
  p_twc_rec                        OUT NOCOPY truck_warehouse_conditions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_twc_id                         IN         truck_warehouse_conditions.twc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_twc_id                         IN         truck_warehouse_conditions.twc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_twc_id                         IN         truck_warehouse_conditions.twc_id%TYPE)
RETURN NUMBER;

FUNCTION GET_FULL_FUNC(
  p_twc_trk_code                   IN         truck_warehouse_conditions.twc_trk_code%TYPE,
  p_twc_whc_code                   IN         truck_warehouse_conditions.twc_whc_code%TYPE,
  p_twc_rec                        OUT NOCOPY truck_warehouse_conditions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_twc_trk_code                   IN         truck_warehouse_conditions.twc_trk_code%TYPE,
  p_twc_whc_code                   IN         truck_warehouse_conditions.twc_whc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_twc_trk_code                   IN         truck_warehouse_conditions.twc_trk_code%TYPE,
  p_twc_whc_code                   IN         truck_warehouse_conditions.twc_whc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_twc_trk_code                   IN         truck_warehouse_conditions.twc_trk_code%TYPE,
  p_twc_whc_code                   IN         truck_warehouse_conditions.twc_whc_code%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_twc_trk_code         IN         truck_warehouse_conditions.twc_trk_code%TYPE,
  p_twc_whc_code         IN         truck_warehouse_conditions.twc_whc_code%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY truck_warehouse_conditions%ROWTYPE)
RETURN NUMBER;

END TWC_PACK;
/