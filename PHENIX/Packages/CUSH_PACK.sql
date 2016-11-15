CREATE OR REPLACE PACKAGE phenix.CUSH_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_histories%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cush_cus_code                  IN         customer_histories.cush_cus_code%TYPE,
  p_cush_start_date                IN         customer_histories.cush_start_date%TYPE,
  p_cush_end_date                  IN         customer_histories.cush_end_date%TYPE,
  p_cush_rec                       OUT NOCOPY customer_histories%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_cush_cus_code                  IN         customer_histories.cush_cus_code%TYPE,
  p_cush_start_date                IN         customer_histories.cush_start_date%TYPE,
  p_cush_end_date                  IN         customer_histories.cush_end_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cush_cus_code                  IN         customer_histories.cush_cus_code%TYPE,
  p_cush_start_date                IN         customer_histories.cush_start_date%TYPE,
  p_cush_end_date                  IN         customer_histories.cush_end_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_cush_cus_code                  IN         customer_histories.cush_cus_code%TYPE,
  p_cush_start_date                IN         customer_histories.cush_start_date%TYPE,
  p_cush_end_date                  IN         customer_histories.cush_end_date%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cush_cus_code                  IN         customer_histories.cush_cus_code%TYPE,
  p_cush_start_date                IN         customer_histories.cush_start_date%TYPE,
  p_cush_end_date                  IN         customer_histories.cush_end_date%TYPE);


PROCEDURE INSERT_PROC(
  p_cush_cus_code                  IN         customer_histories.cush_cus_code%TYPE,
  p_cush_start_date                IN         customer_histories.cush_start_date%TYPE,
  p_cush_end_date                  IN         customer_histories.cush_end_date%TYPE,
  p_cush_cus_whouse_vol_alloc_pe   IN         customer_histories.cush_cus_whouse_vol_alloc_perc%TYPE,
  p_cush_cus_drop_vol_alloc_perc   IN         customer_histories.cush_cus_drop_vol_alloc_perc%TYPE,
  p_cush_cus_growth_alloc_percen   IN         customer_histories.cush_cus_growth_alloc_percent%TYPE,
  p_cush_cus_additional_alloc_pe   IN         customer_histories.cush_cus_additional_alloc_perc%TYPE,
  p_cush_cus_internal_admin_perc   IN         customer_histories.cush_cus_internal_admin_perc%TYPE,
  p_cush_cus_transport_alloc_per   IN         customer_histories.cush_cus_transport_alloc_perc%TYPE       DEFAULT NULL,
  p_cush_cus_reb_whouse_avr_swit   IN         customer_histories.cush_cus_reb_whouse_avr_switch%TYPE      DEFAULT 0    ,
  p_cush_cus_reb_drop_avr_switch   IN         customer_histories.cush_cus_reb_drop_avr_switch%TYPE        DEFAULT 0    ,
  p_cush_cus_reb_drop_terms_swit   IN         customer_histories.cush_cus_reb_drop_terms_switch%TYPE      DEFAULT 0    );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_histories%ROWTYPE);

END CUSH_PACK;
/