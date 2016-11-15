CREATE OR REPLACE PACKAGE phenix.TRT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  territories%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_trt_code                       IN         territories.trt_code%TYPE,
  p_trt_rec                        OUT NOCOPY territories%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_trt_code                       IN         territories.trt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_trt_code                       IN         territories.trt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_trt_code                       IN         territories.trt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_trt_code                       IN         territories.trt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_trt_code                       IN         territories.trt_code%TYPE);


PROCEDURE INSERT_PROC(
  p_trt_code                  IN         territories.trt_code%TYPE,
  p_trt_description           IN         territories.trt_description%TYPE,
  p_trt_ar_sales              IN         territories.trt_ar_sales%TYPE,
  p_trt_ar_credits            IN         territories.trt_ar_credits%TYPE,
  p_trt_ar_drops              IN         territories.trt_ar_drops%TYPE,
  p_trt_sales_cogs            IN         territories.trt_sales_cogs%TYPE,
  p_trt_credits_cogs          IN         territories.trt_credits_cogs%TYPE,
  p_trt_drops_cogs            IN         territories.trt_drops_cogs%TYPE,
  p_trt_ticket_charge_account IN         territories.trt_ticket_charge_account%TYPE,
  p_trt_transport_account     IN         territories.trt_transport_account%TYPE,
  p_trt_alt_description       IN         territories.trt_alt_description%TYPE            DEFAULT NULL,
  p_trt_base_fuel_price       IN         territories.trt_base_fuel_price%TYPE            DEFAULT 0 ,
  p_trt_current_fuel_price    IN         territories.trt_current_fuel_price%TYPE         DEFAULT 0 ,
  p_trt_fuel_weight_percent   IN         territories.trt_fuel_weight_percent%TYPE        DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY territories%ROWTYPE);

END TRT_PACK;
/