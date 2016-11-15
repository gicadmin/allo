CREATE OR REPLACE PACKAGE phenix.VENH_OPERATION_PACK IS

FUNCTION DOES_VENH_EXISTS_FUNC(
	p_venh_ven_code    IN vendor_histories.venh_ven_code%TYPE,
  p_venh_start_date  IN vendor_histories.venh_start_date%TYPE,
  p_venh_end_date    IN vendor_histories.venh_end_date%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_MAX_DATE_FUNC(
	p_venh_ven_code         	IN vendor_histories.venh_ven_code%TYPE
) RETURN DATE;

PROCEDURE UPDATE_VENH_PROC(
  p_venh_ven_code                  IN vendor_histories.venh_ven_code%TYPE,
  p_venh_start_date                IN vendor_histories.venh_start_date%TYPE,
  p_venh_end_date                  IN vendor_histories.venh_end_date%TYPE,
  p_ven_ven_association_code       IN vendor_histories.venh_ven_ven_association_code%TYPE,
  p_ven_drop_terms                 IN vendor_histories.venh_ven_drop_terms_percent%TYPE,
  p_ven_drop_warehouse_flag        IN vendor_histories.venh_ven_drop_warehouse_flag%TYPE,
  p_ven_quart_drop_ship_avr        IN vendor_histories.venh_ven_quart_drop_avr_perc%TYPE,
  p_ven_collected_avr_percent      IN vendor_histories.venh_ven_collected_avr_percent%TYPE,
  p_ven_distributed_avr_percent    IN vendor_histories.venh_ven_distributed_avr_perc%TYPE,
  p_ven_dvn_code                   IN vendor_histories.venh_ven_dvn_code%TYPE
 );

PROCEDURE INSERT_VENH_PROC(
  p_venh_ven_code                  IN         vendor_histories.venh_ven_code%TYPE,
  p_venh_start_date                IN         vendor_histories.venh_start_date%TYPE,
  p_venh_end_date                  IN         vendor_histories.venh_end_date%TYPE,
  p_venh_ven_drop_terms_percent    IN         vendor_histories.venh_ven_drop_terms_percent%TYPE,
  p_venh_ven_quart_drop_avr_perc   IN         vendor_histories.venh_ven_quart_drop_avr_perc%TYPE,
  p_venh_ven_collected_avr_perce   IN         vendor_histories.venh_ven_collected_avr_percent%TYPE,
  p_venh_ven_distributed_avr_per   IN         vendor_histories.venh_ven_distributed_avr_perc%TYPE,
  p_venh_ven_dvn_code              IN         vendor_histories.venh_ven_dvn_code%TYPE,
  p_venh_ven_ven_association_cod   IN         vendor_histories.venh_ven_ven_association_code%TYPE       DEFAULT NULL,
  p_venh_ven_drop_warehouse_flag   IN         vendor_histories.venh_ven_drop_warehouse_flag%TYPE        DEFAULT 'W'
 );

PROCEDURE INSERT_OR_UPDATE_PROC(
  p_venh_ven_code                 IN vendor_histories.venh_ven_code%TYPE,
  p_venh_start_date               IN vendor_histories.venh_start_date%TYPE,
  p_venh_end_date                 IN vendor_histories.venh_end_date%TYPE,
  p_ven_ven_association_code      IN vendors.ven_ven_association_code%TYPE,
  p_ven_drop_terms                IN vendors.ven_drop_terms%TYPE,
  p_ven_drop_warehouse_flag       IN vendors.ven_drop_warehouse_flag%TYPE,
  p_ven_quart_drop_ship_avr       IN vendors.ven_quart_drop_ship_avr%TYPE,
  p_ven_collected_avr_percent     IN vendors.ven_collected_avr_percent%TYPE,
  p_ven_distributed_avr_percent   IN vendors.ven_distributed_avr_percent%TYPE,
  p_ven_dvn_code                  IN vendors.ven_dvn_code%TYPE
);

 PROCEDURE GET_LINE_PROC (
  p_ven_code                         IN  vendors.ven_code%type,
  p_trans_date                       IN  DATE,
  p_venh_ven_drop_terms_percent      OUT vendor_histories.venh_ven_drop_terms_percent%TYPE,
  p_venh_ven_quart_drop_avr_perc     OUT vendor_histories.venh_ven_quart_drop_avr_perc%TYPE,
  p_venh_ven_collected_avr_perce     OUT vendor_histories.venh_ven_collected_avr_percent%TYPE,
  p_venh_ven_distributed_avr_per     OUT vendor_histories.venh_ven_distributed_avr_perc%TYPE,
  p_venh_ven_dvn_code                OUT vendor_histories.venh_ven_dvn_code%TYPE,
  p_venh_ven_ven_association_cod     OUT vendor_histories.venh_ven_ven_association_code%TYPE,
  p_venh_ven_drop_warehouse_flag     OUT vendor_histories.venh_ven_drop_warehouse_flag%TYPE
);

PROCEDURE PURGE_PROC(
  p_venh_ven_code   IN vendor_histories.venh_ven_code%TYPE
);

END VENH_OPERATION_PACK;
/