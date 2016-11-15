CREATE OR REPLACE PACKAGE phenix.WCS_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  weekly_customer_stats%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_wcs_cus_code                   IN         weekly_customer_stats.wcs_cus_code%TYPE,
  p_wcs_fcw_fca_year               IN         weekly_customer_stats.wcs_fcw_fca_year%TYPE,
  p_wcs_fcw_fca_period             IN         weekly_customer_stats.wcs_fcw_fca_period%TYPE,
  p_wcs_fcw_week                   IN         weekly_customer_stats.wcs_fcw_week%TYPE,
  p_wcs_rec                        OUT NOCOPY weekly_customer_stats%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_wcs_cus_code                   IN         weekly_customer_stats.wcs_cus_code%TYPE,
  p_wcs_fcw_fca_year               IN         weekly_customer_stats.wcs_fcw_fca_year%TYPE,
  p_wcs_fcw_fca_period             IN         weekly_customer_stats.wcs_fcw_fca_period%TYPE,
  p_wcs_fcw_week                   IN         weekly_customer_stats.wcs_fcw_week%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_wcs_cus_code                   IN         weekly_customer_stats.wcs_cus_code%TYPE,
  p_wcs_fcw_fca_year               IN         weekly_customer_stats.wcs_fcw_fca_year%TYPE,
  p_wcs_fcw_fca_period             IN         weekly_customer_stats.wcs_fcw_fca_period%TYPE,
  p_wcs_fcw_week                   IN         weekly_customer_stats.wcs_fcw_week%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_wcs_cus_code                   IN         weekly_customer_stats.wcs_cus_code%TYPE,
  p_wcs_fcw_fca_year               IN         weekly_customer_stats.wcs_fcw_fca_year%TYPE,
  p_wcs_fcw_fca_period             IN         weekly_customer_stats.wcs_fcw_fca_period%TYPE,
  p_wcs_fcw_week                   IN         weekly_customer_stats.wcs_fcw_week%TYPE);


PROCEDURE INSERT_PROC(
  p_wcs_cus_code         IN         weekly_customer_stats.wcs_cus_code%TYPE,
  p_wcs_fcw_fca_year     IN         weekly_customer_stats.wcs_fcw_fca_year%TYPE,
  p_wcs_fcw_fca_period   IN         weekly_customer_stats.wcs_fcw_fca_period%TYPE,
  p_wcs_fcw_week         IN         weekly_customer_stats.wcs_fcw_week%TYPE,
  p_wcs_sum_sales        IN         weekly_customer_stats.wcs_sum_sales%TYPE,
  p_wcs_sum_costs        IN         weekly_customer_stats.wcs_sum_costs%TYPE,
  p_wcs_projected_sales  IN         weekly_customer_stats.wcs_projected_sales%TYPE,
  p_wcs_sum_deliv_charge IN         weekly_customer_stats.wcs_sum_deliv_charge%TYPE,
  p_wcs_nb_deliveries    IN         weekly_customer_stats.wcs_nb_deliveries%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY weekly_customer_stats%ROWTYPE);

END WCS_PACK;
/