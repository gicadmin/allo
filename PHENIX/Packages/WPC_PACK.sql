CREATE OR REPLACE PACKAGE phenix.WPC_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  warehouse_price_changes%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_wpc_id                         IN         warehouse_price_changes.wpc_id%TYPE,
  p_wpc_rec                        OUT NOCOPY warehouse_price_changes%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_wpc_id                         IN         warehouse_price_changes.wpc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_wpc_id                         IN         warehouse_price_changes.wpc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_wpc_id                         IN         warehouse_price_changes.wpc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_wpc_id                         IN         warehouse_price_changes.wpc_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_wpc_prw_prd_code        IN         warehouse_price_changes.wpc_prw_prd_code%TYPE,
  p_wpc_prw_whs_code        IN         warehouse_price_changes.wpc_prw_whs_code%TYPE,
  p_wpc_effective_date      IN         warehouse_price_changes.wpc_effective_date%TYPE,
  p_wpc_posted_switch       IN         warehouse_price_changes.wpc_posted_switch%TYPE,
  p_wpc_added_transp_amount IN         warehouse_price_changes.wpc_added_transp_amount%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY warehouse_price_changes%ROWTYPE)
RETURN NUMBER;

END WPC_PACK;
/