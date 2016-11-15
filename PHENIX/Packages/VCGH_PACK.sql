CREATE OR REPLACE PACKAGE phenix.VCGH_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_product_cat_histories%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vcgh_vcg_id                    IN         vendor_product_cat_histories.vcgh_vcg_id%TYPE,
  p_vcgh_start_date                IN         vendor_product_cat_histories.vcgh_start_date%TYPE,
  p_vcgh_end_date                  IN         vendor_product_cat_histories.vcgh_end_date%TYPE,
  p_vcgh_rec                       OUT NOCOPY vendor_product_cat_histories%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vcgh_vcg_id                    IN         vendor_product_cat_histories.vcgh_vcg_id%TYPE,
  p_vcgh_start_date                IN         vendor_product_cat_histories.vcgh_start_date%TYPE,
  p_vcgh_end_date                  IN         vendor_product_cat_histories.vcgh_end_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vcgh_vcg_id                    IN         vendor_product_cat_histories.vcgh_vcg_id%TYPE,
  p_vcgh_start_date                IN         vendor_product_cat_histories.vcgh_start_date%TYPE,
  p_vcgh_end_date                  IN         vendor_product_cat_histories.vcgh_end_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vcgh_vcg_id                    IN         vendor_product_cat_histories.vcgh_vcg_id%TYPE,
  p_vcgh_start_date                IN         vendor_product_cat_histories.vcgh_start_date%TYPE,
  p_vcgh_end_date                  IN         vendor_product_cat_histories.vcgh_end_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vcgh_vcg_id                    IN         vendor_product_cat_histories.vcgh_vcg_id%TYPE,
  p_vcgh_start_date                IN         vendor_product_cat_histories.vcgh_start_date%TYPE,
  p_vcgh_end_date                  IN         vendor_product_cat_histories.vcgh_end_date%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vcgh_vcg_id                    IN         vendor_product_cat_histories.vcgh_vcg_id%TYPE,
  p_vcgh_start_date                IN         vendor_product_cat_histories.vcgh_start_date%TYPE,
  p_vcgh_end_date                  IN         vendor_product_cat_histories.vcgh_end_date%TYPE);


PROCEDURE INSERT_PROC(
  p_vcgh_vcg_id                    IN         vendor_product_cat_histories.vcgh_vcg_id%TYPE,
  p_vcgh_start_date                IN         vendor_product_cat_histories.vcgh_start_date%TYPE,
  p_vcgh_end_date                  IN         vendor_product_cat_histories.vcgh_end_date%TYPE,
  p_vcgh_vcg_category_code         IN         vendor_product_cat_histories.vcgh_vcg_category_code%TYPE,
  p_vcgh_vcg_collected_avr_perce   IN         vendor_product_cat_histories.vcgh_vcg_collected_avr_percent%TYPE      DEFAULT NULL,
  p_vcgh_vcg_collected_avr_amoun   IN         vendor_product_cat_histories.vcgh_vcg_collected_avr_amount%TYPE       DEFAULT NULL,
  p_vcgh_vcg_distributed_avr_per   IN         vendor_product_cat_histories.vcgh_vcg_distributed_avr_perc%TYPE       DEFAULT NULL,
  p_vcgh_vcg_distributed_avr_amo   IN         vendor_product_cat_histories.vcgh_vcg_distributed_avr_amoun%TYPE      DEFAULT NULL,
  p_vcgh_vcg_quart_drop_avr_perc   IN         vendor_product_cat_histories.vcgh_vcg_quart_drop_avr_perc%TYPE        DEFAULT NULL,
  p_vcgh_vcg_quart_drop_avr_amou   IN         vendor_product_cat_histories.vcgh_vcg_quart_drop_avr_amount%TYPE      DEFAULT NULL,
  p_vcgh_vcg_quart_whouse_avr_pe   IN         vendor_product_cat_histories.vcgh_vcg_quart_whouse_avr_perc%TYPE      DEFAULT NULL,
  p_vcgh_vcg_quart_whouse_avr_am   IN         vendor_product_cat_histories.vcgh_vcg_quart_whouse_avr_amou%TYPE      DEFAULT NULL,
  p_vcgh_vcg_qualifier             IN         vendor_product_cat_histories.vcgh_vcg_qualifier%TYPE                  DEFAULT 'IT' ,
  p_vcgh_vcg_collect_distrib_qua   IN         vendor_product_cat_histories.vcgh_vcg_collect_distrib_quali%TYPE      DEFAULT 'IT' );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_product_cat_histories%ROWTYPE);

END VCGH_PACK;
/