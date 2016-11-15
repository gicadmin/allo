CREATE OR REPLACE PACKAGE phenix.CUSH_OPERATION_PACK IS

FUNCTION DOES_CUSH_EXISTS_FUNC(
	p_cush_cus_code    IN customer_histories.cush_cus_code%TYPE,
  p_cush_start_date  IN customer_histories.cush_start_date%TYPE,
  p_cush_end_date    IN customer_histories.cush_end_date%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_MAX_DATE_FUNC(
	p_cush_cus_code         	IN customer_histories.cush_cus_code%TYPE
) RETURN DATE;

PROCEDURE INSERT_CUSH_PROC(
  p_cush_cus_code                  IN         customer_histories.cush_cus_code%TYPE,
  p_cush_start_date                IN         customer_histories.cush_start_date%TYPE,
  p_cush_end_date                  IN         customer_histories.cush_end_date%TYPE,
  p_cush_cus_whouse_vol_alloc_pe   IN         customer_histories.cush_cus_whouse_vol_alloc_perc%TYPE,
  p_cush_cus_drop_vol_alloc_perc   IN        customer_histories.cush_cus_drop_vol_alloc_perc%TYPE,
  p_cush_cus_growth_alloc_percen   IN         customer_histories.cush_cus_growth_alloc_percent%TYPE,
  p_cush_cus_additional_alloc_pe   IN         customer_histories.cush_cus_additional_alloc_perc%TYPE,
  p_cush_cus_internal_admin_perc   IN         customer_histories.cush_cus_internal_admin_perc%TYPE,
  p_cush_cus_transport_alloc_per   IN         customer_histories.cush_cus_transport_alloc_perc%TYPE       DEFAULT NULL,
  p_cush_cus_reb_whouse_avr_swit   IN         customer_histories.cush_cus_reb_whouse_avr_switch%TYPE      DEFAULT 0    ,
  p_cush_cus_reb_drop_avr_switch   IN         customer_histories.cush_cus_reb_drop_avr_switch%TYPE        DEFAULT 0    ,
  p_cush_cus_reb_drop_terms_swit   IN         customer_histories.cush_cus_reb_drop_terms_switch%TYPE      DEFAULT 0
 );

PROCEDURE UPDATE_CUSH_PROC(
  p_cush_cus_code                 IN customer_histories.cush_cus_code%TYPE,
  p_cush_start_date               IN customer_histories.cush_start_date%TYPE,
  p_cush_end_date                 IN customer_histories.cush_end_date%TYPE,
  p_cus_reb_on_whouse_avr_switch  IN customers.cus_reb_on_whouse_avr_switch%TYPE,
  p_cus_reb_on_drop_avr_switch    IN customers.cus_reb_on_drop_avr_switch%TYPE,
  p_cus_reb_on_drop_terms_switch  IN customers.cus_reb_on_drop_terms_switch%TYPE,
  p_cus_internal_admin_percent    IN customers.cus_internal_admin_percent%TYPE,
  p_cus_additional_alloc_percent  IN customers.cus_additional_alloc_percent%TYPE,
  p_cus_growth_alloc_percent      IN customers.cus_growth_alloc_percent%TYPE,
  p_cus_transport_allocation      IN customers.cus_transport_allocation%TYPE,
  p_cus_whouse_vol_alloc_percent  IN customers.cus_whouse_vol_alloc_percent%TYPE,
  p_cus_drop_volume_alloc_percen  IN customers.cus_drop_volume_alloc_percent%TYPE
 );

PROCEDURE INSERT_OR_UPDATE_PROC(
  p_cush_cus_code                 IN customer_histories.cush_cus_code%TYPE,
  p_cush_start_date               IN customer_histories.cush_start_date%TYPE,
  p_cush_end_date                 IN customer_histories.cush_end_date%TYPE,
  p_cus_reb_on_whouse_avr_switch  IN customers.cus_reb_on_whouse_avr_switch%TYPE,
  p_cus_reb_on_drop_avr_switch    IN customers.cus_reb_on_drop_avr_switch%TYPE,
  p_cus_reb_on_drop_terms_switch  IN customers.cus_reb_on_drop_terms_switch%TYPE,
  p_cus_internal_admin_percent    IN customers.cus_internal_admin_percent%TYPE,
  p_cus_additional_alloc_percent  IN customers.cus_additional_alloc_percent%TYPE,
  p_cus_growth_alloc_percent      IN customers.cus_growth_alloc_percent%TYPE,
  p_cus_transport_allocation      IN customers.cus_transport_allocation%TYPE,
  p_cus_whouse_vol_alloc_percent  IN customers.cus_whouse_vol_alloc_percent%TYPE,
  p_cus_drop_volume_alloc_percen  IN customers.cus_drop_volume_alloc_percent%TYPE
);

PROCEDURE PURGE_PROC(
	p_cush_cus_code         	IN customer_histories.cush_cus_code%TYPE
);

PROCEDURE GET_LINE_PROC (
  p_cus_code                         IN customers.cus_code%type,
  p_trans_date                       IN DATE,
  p_cus_reb_on_whouse_avr_switch     OUT customers.cus_reb_on_whouse_avr_switch%type,
  p_cus_reb_on_drop_avr_switch       OUT customers.cus_reb_on_drop_avr_switch%type,
  p_cus_reb_on_drop_terms_switch     OUT customers.cus_reb_on_drop_terms_switch%type,
  p_cus_internal_admin_percent       OUT customers.cus_internal_admin_percent%type,
  p_cus_additional_alloc_percent     OUT customers.cus_additional_alloc_percent%type,
  p_cus_growth_alloc_percent         OUT customers.cus_growth_alloc_percent%type,
  p_cus_transport_allocation         OUT customers.cus_transport_allocation%type,
  p_cus_whouse_vol_alloc_percent     OUT customers.cus_whouse_vol_alloc_percent%type,
  p_cus_drop_volume_alloc_percen     OUT customers.cus_drop_volume_alloc_percent%type
);

END CUSH_OPERATION_PACK;
/