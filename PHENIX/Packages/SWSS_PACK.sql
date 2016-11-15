CREATE OR REPLACE PACKAGE phenix.SWSS_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  site_weekly_sales_summaries%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_swss_id                        IN         site_weekly_sales_summaries.swss_id%TYPE,
  p_swss_rec                       OUT NOCOPY site_weekly_sales_summaries%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_swss_id                        IN         site_weekly_sales_summaries.swss_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_swss_id                        IN         site_weekly_sales_summaries.swss_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_swss_id                        IN         site_weekly_sales_summaries.swss_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_swss_id                        IN         site_weekly_sales_summaries.swss_id%TYPE);


FUNCTION INSERT_FUNC(
  p_swss_sit_code        IN         site_weekly_sales_summaries.swss_sit_code%TYPE,
  p_swss_fcw_fca_year    IN         site_weekly_sales_summaries.swss_fcw_fca_year%TYPE,
  p_swss_fcw_fca_period  IN         site_weekly_sales_summaries.swss_fcw_fca_period%TYPE,
  p_swss_fcw_week        IN         site_weekly_sales_summaries.swss_fcw_week%TYPE,
  p_swss_type            IN         site_weekly_sales_summaries.swss_type%TYPE,
  p_swss_coca_code       IN         site_weekly_sales_summaries.swss_coca_code%TYPE            DEFAULT NULL,
  p_swss_vgr_code        IN         site_weekly_sales_summaries.swss_vgr_code%TYPE             DEFAULT NULL,
  p_swss_quantity_sold   IN         site_weekly_sales_summaries.swss_quantity_sold%TYPE        DEFAULT NULL,
  p_swss_amount_sold     IN         site_weekly_sales_summaries.swss_amount_sold%TYPE          DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY site_weekly_sales_summaries%ROWTYPE)
RETURN NUMBER;

END SWSS_PACK;
/