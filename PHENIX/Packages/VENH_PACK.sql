CREATE OR REPLACE PACKAGE phenix.VENH_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_histories%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_venh_ven_code                  IN         vendor_histories.venh_ven_code%TYPE,
  p_venh_start_date                IN         vendor_histories.venh_start_date%TYPE,
  p_venh_end_date                  IN         vendor_histories.venh_end_date%TYPE,
  p_venh_rec                       OUT NOCOPY vendor_histories%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_venh_ven_code                  IN         vendor_histories.venh_ven_code%TYPE,
  p_venh_start_date                IN         vendor_histories.venh_start_date%TYPE,
  p_venh_end_date                  IN         vendor_histories.venh_end_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_venh_ven_code                  IN         vendor_histories.venh_ven_code%TYPE,
  p_venh_start_date                IN         vendor_histories.venh_start_date%TYPE,
  p_venh_end_date                  IN         vendor_histories.venh_end_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_venh_ven_code                  IN         vendor_histories.venh_ven_code%TYPE,
  p_venh_start_date                IN         vendor_histories.venh_start_date%TYPE,
  p_venh_end_date                  IN         vendor_histories.venh_end_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_venh_ven_code                  IN         vendor_histories.venh_ven_code%TYPE,
  p_venh_start_date                IN         vendor_histories.venh_start_date%TYPE,
  p_venh_end_date                  IN         vendor_histories.venh_end_date%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_venh_ven_code                  IN         vendor_histories.venh_ven_code%TYPE,
  p_venh_start_date                IN         vendor_histories.venh_start_date%TYPE,
  p_venh_end_date                  IN         vendor_histories.venh_end_date%TYPE);


PROCEDURE INSERT_PROC(
  p_venh_ven_code                  IN         vendor_histories.venh_ven_code%TYPE,
  p_venh_start_date                IN         vendor_histories.venh_start_date%TYPE,
  p_venh_end_date                  IN         vendor_histories.venh_end_date%TYPE,
  p_venh_ven_drop_terms_percent    IN         vendor_histories.venh_ven_drop_terms_percent%TYPE,
  p_venh_ven_quart_drop_avr_perc   IN         vendor_histories.venh_ven_quart_drop_avr_perc%TYPE,
  p_venh_ven_collected_avr_perce   IN         vendor_histories.venh_ven_collected_avr_percent%TYPE,
  p_venh_ven_distributed_avr_per   IN         vendor_histories.venh_ven_distributed_avr_perc%TYPE,
  p_venh_ven_dvn_code              IN         vendor_histories.venh_ven_dvn_code%TYPE,
  p_venh_ven_ven_association_cod   IN         vendor_histories.venh_ven_ven_association_code%TYPE       DEFAULT NULL,
  p_venh_ven_drop_warehouse_flag   IN         vendor_histories.venh_ven_drop_warehouse_flag%TYPE        DEFAULT 'W' );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_histories%ROWTYPE);

END VENH_PACK;
/