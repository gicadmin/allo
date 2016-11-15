CREATE OR REPLACE PACKAGE phenix.VCGH_OPERATION_PACK IS

FUNCTION DOES_VCGH_EXISTS_FUNC(
	p_vcgh_vcg_id    IN vendor_product_cat_histories.vcgh_vcg_id%TYPE,
  p_vcgh_start_date  IN vendor_product_cat_histories.vcgh_start_date%TYPE,
  p_vcgh_end_date    IN vendor_product_cat_histories.vcgh_end_date%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_MAX_DATE_FUNC(
	p_vcgh_vcg_id         	IN vendor_product_cat_histories.vcgh_vcg_id%TYPE
) RETURN DATE;

PROCEDURE UPDATE_VCGH_PROC(
  p_vcgh_vcg_id                   IN vendor_product_cat_histories.vcgh_vcg_id%TYPE,
  p_vcgh_start_date               IN vendor_product_cat_histories.vcgh_start_date%TYPE,
  p_vcgh_end_date                 IN vendor_product_cat_histories.vcgh_end_date%TYPE,
  p_vcgh_vcg_category_code        IN vendor_product_cat_histories.vcgh_vcg_category_code%TYPE,
  p_vcgh_vcg_collected_avr_perce  IN vendor_product_cat_histories.vcgh_vcg_collected_avr_percent%TYPE      DEFAULT NULL,
  p_vcgh_vcg_collected_avr_amoun  IN vendor_product_cat_histories.vcgh_vcg_collected_avr_amount%TYPE       DEFAULT NULL,
  p_vcgh_vcg_distributed_avr_per  IN vendor_product_cat_histories.vcgh_vcg_distributed_avr_perc%TYPE       DEFAULT NULL,
  p_vcgh_vcg_distributed_avr_amo  IN vendor_product_cat_histories.vcgh_vcg_distributed_avr_amoun%TYPE      DEFAULT NULL,
  p_vcgh_vcg_quart_drop_avr_perc  IN vendor_product_cat_histories.vcgh_vcg_quart_drop_avr_perc%TYPE        DEFAULT NULL,
  p_vcgh_vcg_quart_drop_avr_amou  IN vendor_product_cat_histories.vcgh_vcg_quart_drop_avr_amount%TYPE      DEFAULT NULL,
  p_vcgh_vcg_quart_whouse_avr_pe  IN vendor_product_cat_histories.vcgh_vcg_quart_whouse_avr_perc%TYPE      DEFAULT NULL,
  p_vcgh_vcg_quart_whouse_avr_am  IN vendor_product_cat_histories.vcgh_vcg_quart_whouse_avr_amou%TYPE      DEFAULT NULL,
  p_vcgh_vcg_qualifier            IN vendor_product_cat_histories.vcgh_vcg_qualifier%TYPE                  DEFAULT 'IT' ,
  p_vcgh_vcg_collect_distrib_qua  IN vendor_product_cat_histories.vcgh_vcg_collect_distrib_quali%TYPE      DEFAULT 'IT'
  );

PROCEDURE INSERT_VCGH_PROC  (
  p_vcgh_vcg_id                   IN vendor_product_cat_histories.vcgh_vcg_id%TYPE,
  p_vcgh_start_date               IN vendor_product_cat_histories.vcgh_start_date%TYPE,
  p_vcgh_end_date                 IN vendor_product_cat_histories.vcgh_end_date%TYPE,
  p_vcgh_vcg_category_code        IN vendor_product_cat_histories.vcgh_vcg_category_code%TYPE,
  p_vcgh_vcg_collected_avr_perce  IN vendor_product_cat_histories.vcgh_vcg_collected_avr_percent%TYPE      DEFAULT NULL,
  p_vcgh_vcg_collected_avr_amoun  IN vendor_product_cat_histories.vcgh_vcg_collected_avr_amount%TYPE       DEFAULT NULL,
  p_vcgh_vcg_distributed_avr_per  IN vendor_product_cat_histories.vcgh_vcg_distributed_avr_perc%TYPE       DEFAULT NULL,
  p_vcgh_vcg_distributed_avr_amo  IN vendor_product_cat_histories.vcgh_vcg_distributed_avr_amoun%TYPE      DEFAULT NULL,
  p_vcgh_vcg_quart_drop_avr_perc  IN vendor_product_cat_histories.vcgh_vcg_quart_drop_avr_perc%TYPE        DEFAULT NULL,
  p_vcgh_vcg_quart_drop_avr_amou  IN vendor_product_cat_histories.vcgh_vcg_quart_drop_avr_amount%TYPE      DEFAULT NULL,
  p_vcgh_vcg_quart_whouse_avr_pe  IN vendor_product_cat_histories.vcgh_vcg_quart_whouse_avr_perc%TYPE      DEFAULT NULL,
  p_vcgh_vcg_quart_whouse_avr_am  IN vendor_product_cat_histories.vcgh_vcg_quart_whouse_avr_amou%TYPE      DEFAULT NULL,
  p_vcgh_vcg_qualifier            IN vendor_product_cat_histories.vcgh_vcg_qualifier%TYPE                  DEFAULT 'IT' ,
  p_vcgh_vcg_collect_distrib_qua  IN vendor_product_cat_histories.vcgh_vcg_collect_distrib_quali%TYPE      DEFAULT 'IT'
  );

PROCEDURE INSERT_OR_UPDATE_PROC(
  p_vcgh_vcg_id                   IN vendor_product_cat_histories.vcgh_vcg_id%TYPE,
  p_vcgh_start_date               IN vendor_product_cat_histories.vcgh_start_date%TYPE,
  p_vcgh_end_date                 IN vendor_product_cat_histories.vcgh_end_date%TYPE,
  p_vcgh_vcg_category_code        IN vendor_product_cat_histories.vcgh_vcg_category_code%TYPE,
  p_vcgh_vcg_collected_avr_perce  IN vendor_product_cat_histories.vcgh_vcg_collected_avr_percent%TYPE      DEFAULT NULL,
  p_vcgh_vcg_collected_avr_amoun  IN vendor_product_cat_histories.vcgh_vcg_collected_avr_amount%TYPE       DEFAULT NULL,
  p_vcgh_vcg_distributed_avr_per  IN vendor_product_cat_histories.vcgh_vcg_distributed_avr_perc%TYPE       DEFAULT NULL,
  p_vcgh_vcg_distributed_avr_amo  IN vendor_product_cat_histories.vcgh_vcg_distributed_avr_amoun%TYPE      DEFAULT NULL,
  p_vcgh_vcg_quart_drop_avr_perc  IN vendor_product_cat_histories.vcgh_vcg_quart_drop_avr_perc%TYPE        DEFAULT NULL,
  p_vcgh_vcg_quart_drop_avr_amou  IN vendor_product_cat_histories.vcgh_vcg_quart_drop_avr_amount%TYPE      DEFAULT NULL,
  p_vcgh_vcg_quart_whouse_avr_pe  IN vendor_product_cat_histories.vcgh_vcg_quart_whouse_avr_perc%TYPE      DEFAULT NULL,
  p_vcgh_vcg_quart_whouse_avr_am  IN vendor_product_cat_histories.vcgh_vcg_quart_whouse_avr_amou%TYPE      DEFAULT NULL,
  p_vcgh_vcg_qualifier            IN vendor_product_cat_histories.vcgh_vcg_qualifier%TYPE                  DEFAULT 'IT' ,
  p_vcgh_vcg_collect_distrib_qua  IN vendor_product_cat_histories.vcgh_vcg_collect_distrib_quali%TYPE      DEFAULT 'IT'
);
PROCEDURE GET_LINE_PROC (
  p_vcgh_vcg_id                   IN vendor_product_cat_histories.vcgh_vcg_id%TYPE,
  p_trans_date                    IN  DATE,
  p_vcgh_vcg_category_code        OUT vendor_product_cat_histories.vcgh_vcg_category_code%TYPE,
  p_vcgh_vcg_collected_avr_perce  OUT vendor_product_cat_histories.vcgh_vcg_collected_avr_percent%TYPE,
  p_vcgh_vcg_collected_avr_amoun  OUT vendor_product_cat_histories.vcgh_vcg_collected_avr_amount%TYPE ,
  p_vcgh_vcg_distributed_avr_per  OUT vendor_product_cat_histories.vcgh_vcg_distributed_avr_perc%TYPE ,
  p_vcgh_vcg_distributed_avr_amo  OUT vendor_product_cat_histories.vcgh_vcg_distributed_avr_amoun%TYPE,
  p_vcgh_vcg_quart_drop_avr_perc  OUT vendor_product_cat_histories.vcgh_vcg_quart_drop_avr_perc%TYPE  ,
  p_vcgh_vcg_quart_drop_avr_amou  OUT vendor_product_cat_histories.vcgh_vcg_quart_drop_avr_amount%TYPE,
  p_vcgh_vcg_quart_whouse_avr_pe  OUT vendor_product_cat_histories.vcgh_vcg_quart_whouse_avr_perc%TYPE,
  p_vcgh_vcg_quart_whouse_avr_am  OUT vendor_product_cat_histories.vcgh_vcg_quart_whouse_avr_amou%TYPE,
  p_vcgh_vcg_qualifier            OUT vendor_product_cat_histories.vcgh_vcg_qualifier%TYPE            ,
  p_vcgh_vcg_collect_distrib_qua  OUT vendor_product_cat_histories.vcgh_vcg_collect_distrib_quali%TYPE
);

END VCGH_OPERATION_PACK;
/