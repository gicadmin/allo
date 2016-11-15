CREATE OR REPLACE PACKAGE phenix.CRO_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_routes%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cro_cus_code                   IN         customer_routes.cro_cus_code%TYPE,
  p_cro_rou_code                   IN         customer_routes.cro_rou_code%TYPE,
  p_cro_rec                        OUT NOCOPY customer_routes%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cro_cus_code                   IN         customer_routes.cro_cus_code%TYPE,
  p_cro_rou_code                   IN         customer_routes.cro_rou_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_cro_cus_code                   IN         customer_routes.cro_cus_code%TYPE,
  p_cro_rou_code                   IN         customer_routes.cro_rou_code%TYPE)
RETURN NUMBER;


PROCEDURE INSERT_PROC(
  p_cro_cus_code         IN         customer_routes.cro_cus_code%TYPE,
  p_cro_rou_code         IN         customer_routes.cro_rou_code%TYPE,
  p_cro_position         IN         customer_routes.cro_position%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_routes%ROWTYPE);

END CRO_PACK;
/