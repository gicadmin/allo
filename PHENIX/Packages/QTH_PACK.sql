CREATE OR REPLACE PACKAGE phenix.QTH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  quotation_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_qth_id                         IN         quotation_headers.qth_id%TYPE,
  p_qth_rec                        OUT NOCOPY quotation_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_qth_id                         IN         quotation_headers.qth_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_qth_id                         IN         quotation_headers.qth_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_qth_id                         IN         quotation_headers.qth_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_qth_id                         IN         quotation_headers.qth_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_qth_id                         IN         quotation_headers.qth_id%TYPE);


FUNCTION INSERT_FUNC(
  p_qth_end_date                 IN         quotation_headers.qth_end_date%TYPE,
  p_qth_promotion_percent        IN         quotation_headers.qth_promotion_percent%TYPE,
  p_qth_start_date               IN         quotation_headers.qth_start_date%TYPE,
  p_qth_renewal_flag             IN         quotation_headers.qth_renewal_flag%TYPE,
  p_qth_description              IN         quotation_headers.qth_description%TYPE,
  p_qth_contract_start_date      IN         quotation_headers.qth_contract_start_date%TYPE,
  p_qth_contract_end_date        IN         quotation_headers.qth_contract_end_date%TYPE,
  p_qth_cus_code                 IN         quotation_headers.qth_cus_code%TYPE                      DEFAULT NULL,
  p_qth_qty_code                 IN         quotation_headers.qth_qty_code%TYPE                      DEFAULT NULL,
  p_qth_interval                 IN         quotation_headers.qth_interval%TYPE                      DEFAULT NULL,
  p_qth_recalc_lead_days         IN         quotation_headers.qth_recalc_lead_days%TYPE              DEFAULT NULL,
  p_qth_naz_nac_code             IN         quotation_headers.qth_naz_nac_code%TYPE                  DEFAULT NULL,
  p_qth_naz_zone_code            IN         quotation_headers.qth_naz_zone_code%TYPE                 DEFAULT NULL,
  p_qth_synchronization_id       IN         quotation_headers.qth_synchronization_id%TYPE            DEFAULT NULL,
  p_qth_external_identifier      IN         quotation_headers.qth_external_identifier%TYPE           DEFAULT NULL,
  p_qth_id_origin                IN         quotation_headers.qth_id_origin%TYPE                     DEFAULT NULL,
  p_qth_price_change_percent     IN         quotation_headers.qth_price_change_percent%TYPE          DEFAULT 0 ,
  p_qth_recalculated_switch      IN         quotation_headers.qth_recalculated_switch%TYPE           DEFAULT 0 ,
  p_qth_agreement_percent        IN         quotation_headers.qth_agreement_percent%TYPE             DEFAULT 0 ,
  p_qth_recalculate_promo_switch IN         quotation_headers.qth_recalculate_promo_switch%TYPE      DEFAULT 0 ,
  p_qth_display_in_caps_switch   IN         quotation_headers.qth_display_in_caps_switch%TYPE        DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY quotation_headers%ROWTYPE)
RETURN NUMBER;

END QTH_PACK;
/