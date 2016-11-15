CREATE OR REPLACE PACKAGE phenix.SCT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  stat_customer_transports%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sct_fcw_fca_year               IN         stat_customer_transports.sct_fcw_fca_year%TYPE,
  p_sct_fcw_fca_period             IN         stat_customer_transports.sct_fcw_fca_period%TYPE,
  p_sct_fcw_week                   IN         stat_customer_transports.sct_fcw_week%TYPE,
  p_sct_cus_code                   IN         stat_customer_transports.sct_cus_code%TYPE,
  p_sct_whs_delivery_code          IN         stat_customer_transports.sct_whs_delivery_code%TYPE,
  p_sct_rec                        OUT NOCOPY stat_customer_transports%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sct_fcw_fca_year               IN         stat_customer_transports.sct_fcw_fca_year%TYPE,
  p_sct_fcw_fca_period             IN         stat_customer_transports.sct_fcw_fca_period%TYPE,
  p_sct_fcw_week                   IN         stat_customer_transports.sct_fcw_week%TYPE,
  p_sct_cus_code                   IN         stat_customer_transports.sct_cus_code%TYPE,
  p_sct_whs_delivery_code          IN         stat_customer_transports.sct_whs_delivery_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sct_fcw_fca_year               IN         stat_customer_transports.sct_fcw_fca_year%TYPE,
  p_sct_fcw_fca_period             IN         stat_customer_transports.sct_fcw_fca_period%TYPE,
  p_sct_fcw_week                   IN         stat_customer_transports.sct_fcw_week%TYPE,
  p_sct_cus_code                   IN         stat_customer_transports.sct_cus_code%TYPE,
  p_sct_whs_delivery_code          IN         stat_customer_transports.sct_whs_delivery_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sct_fcw_fca_year               IN         stat_customer_transports.sct_fcw_fca_year%TYPE,
  p_sct_fcw_fca_period             IN         stat_customer_transports.sct_fcw_fca_period%TYPE,
  p_sct_fcw_week                   IN         stat_customer_transports.sct_fcw_week%TYPE,
  p_sct_cus_code                   IN         stat_customer_transports.sct_cus_code%TYPE,
  p_sct_whs_delivery_code          IN         stat_customer_transports.sct_whs_delivery_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sct_fcw_fca_year               IN         stat_customer_transports.sct_fcw_fca_year%TYPE,
  p_sct_fcw_fca_period             IN         stat_customer_transports.sct_fcw_fca_period%TYPE,
  p_sct_fcw_week                   IN         stat_customer_transports.sct_fcw_week%TYPE,
  p_sct_cus_code                   IN         stat_customer_transports.sct_cus_code%TYPE,
  p_sct_whs_delivery_code          IN         stat_customer_transports.sct_whs_delivery_code%TYPE);


PROCEDURE INSERT_PROC(
  p_sct_fcw_fca_year           IN         stat_customer_transports.sct_fcw_fca_year%TYPE,
  p_sct_fcw_fca_period         IN         stat_customer_transports.sct_fcw_fca_period%TYPE,
  p_sct_fcw_week               IN         stat_customer_transports.sct_fcw_week%TYPE,
  p_sct_cus_code               IN         stat_customer_transports.sct_cus_code%TYPE,
  p_sct_whs_delivery_code      IN         stat_customer_transports.sct_whs_delivery_code%TYPE,
  p_sct_sum_transp_amount      IN         stat_customer_transports.sct_sum_transp_amount%TYPE,
  p_sct_sum_transp_fuel_amount IN         stat_customer_transports.sct_sum_transp_fuel_amount%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY stat_customer_transports%ROWTYPE);

END SCT_PACK;
/