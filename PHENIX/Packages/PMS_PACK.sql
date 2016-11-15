CREATE OR REPLACE PACKAGE phenix.PMS_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pallet_model_specifics%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pms_pmo_code                   IN         pallet_model_specifics.pms_pmo_code%TYPE,
  p_pms_route_date                 IN         pallet_model_specifics.pms_route_date%TYPE,
  p_pms_rou_code                   IN         pallet_model_specifics.pms_rou_code%TYPE,
  p_pms_rec                        OUT NOCOPY pallet_model_specifics%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pms_pmo_code                   IN         pallet_model_specifics.pms_pmo_code%TYPE,
  p_pms_route_date                 IN         pallet_model_specifics.pms_route_date%TYPE,
  p_pms_rou_code                   IN         pallet_model_specifics.pms_rou_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pms_pmo_code                   IN         pallet_model_specifics.pms_pmo_code%TYPE,
  p_pms_route_date                 IN         pallet_model_specifics.pms_route_date%TYPE,
  p_pms_rou_code                   IN         pallet_model_specifics.pms_rou_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_pms_pmo_code                   IN         pallet_model_specifics.pms_pmo_code%TYPE,
  p_pms_route_date                 IN         pallet_model_specifics.pms_route_date%TYPE,
  p_pms_rou_code                   IN         pallet_model_specifics.pms_rou_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pms_pmo_code                   IN         pallet_model_specifics.pms_pmo_code%TYPE,
  p_pms_route_date                 IN         pallet_model_specifics.pms_route_date%TYPE,
  p_pms_rou_code                   IN         pallet_model_specifics.pms_rou_code%TYPE);

FUNCTION GET_FULL_FUNC(
  p_pms_id                         IN         pallet_model_specifics.pms_id%TYPE,
  p_pms_rec                        OUT NOCOPY pallet_model_specifics%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pms_id                         IN         pallet_model_specifics.pms_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pms_id                         IN         pallet_model_specifics.pms_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_pms_id                         IN         pallet_model_specifics.pms_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pms_id                         IN         pallet_model_specifics.pms_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pms_pmo_code         IN         pallet_model_specifics.pms_pmo_code%TYPE,
  p_pms_route_date       IN         pallet_model_specifics.pms_route_date%TYPE            DEFAULT NULL,
  p_pms_rou_code         IN         pallet_model_specifics.pms_rou_code%TYPE              DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pallet_model_specifics%ROWTYPE)
RETURN NUMBER;

END PMS_PACK;
/