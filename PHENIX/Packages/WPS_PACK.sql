CREATE OR REPLACE PACKAGE phenix.WPS_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  weekly_product_summaries%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_wps_fcw_fca_year               IN         weekly_product_summaries.wps_fcw_fca_year%TYPE,
  p_wps_fcw_fca_period             IN         weekly_product_summaries.wps_fcw_fca_period%TYPE,
  p_wps_fcw_week                   IN         weekly_product_summaries.wps_fcw_week%TYPE,
  p_wps_prw_prd_code               IN         weekly_product_summaries.wps_prw_prd_code%TYPE,
  p_wps_prw_whs_code               IN         weekly_product_summaries.wps_prw_whs_code%TYPE,
  p_wps_rec                        OUT NOCOPY weekly_product_summaries%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_wps_fcw_fca_year               IN         weekly_product_summaries.wps_fcw_fca_year%TYPE,
  p_wps_fcw_fca_period             IN         weekly_product_summaries.wps_fcw_fca_period%TYPE,
  p_wps_fcw_week                   IN         weekly_product_summaries.wps_fcw_week%TYPE,
  p_wps_prw_prd_code               IN         weekly_product_summaries.wps_prw_prd_code%TYPE,
  p_wps_prw_whs_code               IN         weekly_product_summaries.wps_prw_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_wps_fcw_fca_year               IN         weekly_product_summaries.wps_fcw_fca_year%TYPE,
  p_wps_fcw_fca_period             IN         weekly_product_summaries.wps_fcw_fca_period%TYPE,
  p_wps_fcw_week                   IN         weekly_product_summaries.wps_fcw_week%TYPE,
  p_wps_prw_prd_code               IN         weekly_product_summaries.wps_prw_prd_code%TYPE,
  p_wps_prw_whs_code               IN         weekly_product_summaries.wps_prw_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_wps_fcw_fca_year               IN         weekly_product_summaries.wps_fcw_fca_year%TYPE,
  p_wps_fcw_fca_period             IN         weekly_product_summaries.wps_fcw_fca_period%TYPE,
  p_wps_fcw_week                   IN         weekly_product_summaries.wps_fcw_week%TYPE,
  p_wps_prw_prd_code               IN         weekly_product_summaries.wps_prw_prd_code%TYPE,
  p_wps_prw_whs_code               IN         weekly_product_summaries.wps_prw_whs_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_wps_fcw_fca_year               IN         weekly_product_summaries.wps_fcw_fca_year%TYPE,
  p_wps_fcw_fca_period             IN         weekly_product_summaries.wps_fcw_fca_period%TYPE,
  p_wps_fcw_week                   IN         weekly_product_summaries.wps_fcw_week%TYPE,
  p_wps_prw_prd_code               IN         weekly_product_summaries.wps_prw_prd_code%TYPE,
  p_wps_prw_whs_code               IN         weekly_product_summaries.wps_prw_whs_code%TYPE);


PROCEDURE INSERT_PROC(
  p_wps_fcw_fca_year     IN         weekly_product_summaries.wps_fcw_fca_year%TYPE,
  p_wps_fcw_fca_period   IN         weekly_product_summaries.wps_fcw_fca_period%TYPE,
  p_wps_fcw_week         IN         weekly_product_summaries.wps_fcw_week%TYPE,
  p_wps_prw_prd_code     IN         weekly_product_summaries.wps_prw_prd_code%TYPE,
  p_wps_prw_whs_code     IN         weekly_product_summaries.wps_prw_whs_code%TYPE,
  p_wps_start_on_hand    IN         weekly_product_summaries.wps_start_on_hand%TYPE,
  p_wps_receipts         IN         weekly_product_summaries.wps_receipts%TYPE,
  p_wps_vendor_returns   IN         weekly_product_summaries.wps_vendor_returns%TYPE,
  p_wps_sales            IN         weekly_product_summaries.wps_sales%TYPE,
  p_wps_credits          IN         weekly_product_summaries.wps_credits%TYPE,
  p_wps_inventory_counts IN         weekly_product_summaries.wps_inventory_counts%TYPE,
  p_wps_transformations  IN         weekly_product_summaries.wps_transformations%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY weekly_product_summaries%ROWTYPE);

END WPS_PACK;
/