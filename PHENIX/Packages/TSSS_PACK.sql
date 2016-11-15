CREATE OR REPLACE PACKAGE phenix.TSSS_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_site_sales_summaries%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_tsss_sit_code                IN         temporary_site_sales_summaries.tsss_sit_code%TYPE,
  p_tsss_ssch_code               IN         temporary_site_sales_summaries.tsss_ssch_code%TYPE,
  p_tsss_ssch_start_date         IN         temporary_site_sales_summaries.tsss_ssch_start_date%TYPE,
  p_tsss_ssch_end_date           IN         temporary_site_sales_summaries.tsss_ssch_end_date%TYPE,
  p_tsss_ssch_current_week       IN         temporary_site_sales_summaries.tsss_ssch_current_week%TYPE,
  p_tsss_ssch_total_week         IN         temporary_site_sales_summaries.tsss_ssch_total_week%TYPE,
  p_tsss_commitment_description  IN         temporary_site_sales_summaries.tsss_commitment_description%TYPE,
  p_tsss_commitment_section      IN         temporary_site_sales_summaries.tsss_commitment_section%TYPE,
  p_tsss_commitment_type         IN         temporary_site_sales_summaries.tsss_commitment_type%TYPE,
  p_tsss_period_purchase         IN         temporary_site_sales_summaries.tsss_period_purchase%TYPE,
  p_tsss_period_average          IN         temporary_site_sales_summaries.tsss_period_average%TYPE,
  p_tsss_period_commitment_wkly  IN         temporary_site_sales_summaries.tsss_period_commitment_wkly%TYPE,
  p_tsss_period_commitment       IN         temporary_site_sales_summaries.tsss_period_commitment%TYPE,
  p_tsss_period_difference       IN         temporary_site_sales_summaries.tsss_period_difference%TYPE,
  p_tsss_period_diff_percent     IN         temporary_site_sales_summaries.tsss_period_diff_percent%TYPE,
  p_tsss_to_date_purchase        IN         temporary_site_sales_summaries.tsss_to_date_purchase%TYPE,
  p_tsss_to_date_average         IN         temporary_site_sales_summaries.tsss_to_date_average%TYPE,
  p_tsss_to_date_commitment_wkly IN         temporary_site_sales_summaries.tsss_to_date_commitment_wkly%TYPE,
  p_tsss_to_date_commitment      IN         temporary_site_sales_summaries.tsss_to_date_commitment%TYPE,
  p_tsss_to_date_difference      IN         temporary_site_sales_summaries.tsss_to_date_difference%TYPE,
  p_tsss_to_date_diff_percent    IN         temporary_site_sales_summaries.tsss_to_date_diff_percent%TYPE,
  p_tsss_commitment_code         IN         temporary_site_sales_summaries.tsss_commitment_code%TYPE              DEFAULT NULL,
  p_tsss_period_start_date       IN         temporary_site_sales_summaries.tsss_period_start_date%TYPE            DEFAULT NULL,
  p_tsss_period_end_date         IN         temporary_site_sales_summaries.tsss_period_end_date%TYPE              DEFAULT NULL,
  p_tsss_to_date_start_date      IN         temporary_site_sales_summaries.tsss_to_date_start_date%TYPE           DEFAULT NULL,
  p_tsss_to_date_end_date        IN         temporary_site_sales_summaries.tsss_to_date_end_date%TYPE             DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_site_sales_summaries%ROWTYPE);

END TSSS_PACK;
/