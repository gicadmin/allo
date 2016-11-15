CREATE OR REPLACE PACKAGE phenix.QTH_OPERATION_PACK IS

FUNCTION IS_PERSONALIZED_QUOTATION_FUNC(
  P_CUS_CODE  IN quotation_headers.qth_cus_code%TYPE)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_qth_id IN quotation_headers.qth_id%TYPE,
  p_raise  IN BOOLEAN DEFAULT TRUE
);

FUNCTION COUNT_QTH_SAME_INFO_FUNC(
  p_cus_code        IN NUMBER,
  p_naz_nac_code    IN NUMBER,
  p_naz_zone_code   IN NUMBER,
  p_qty_code        IN NUMBER,
  p_date_to_check   IN DATE
)
RETURN NUMBER;

FUNCTION COPY_FUNC(
  p_qth_id_from                    IN quotation_headers.qth_id%TYPE,
  p_qth_cus_code                   IN quotation_headers.qth_cus_code%TYPE,
  p_qth_naz_nac_code               IN quotation_headers.qth_naz_nac_code%TYPE,
  p_qth_naz_zone_code              IN quotation_headers.qth_naz_zone_code%TYPE,
  p_qth_qty_code                   IN quotation_headers.qth_qty_code%TYPE,
  p_qth_description                IN quotation_headers.qth_description%TYPE,
  p_qth_start_date                 IN quotation_headers.qth_start_date%TYPE,
  p_qth_end_date                   IN quotation_headers.qth_end_date%TYPE,
  p_qth_promotion_percent          IN quotation_headers.qth_promotion_percent%TYPE,
  p_qth_recalculate_promo_switch   IN quotation_headers.qth_recalculate_promo_switch%TYPE,
  p_qth_price_change_percent       IN quotation_headers.qth_price_change_percent%TYPE,
  p_qth_agreement_percent          IN quotation_headers.qth_agreement_percent%TYPE,
  p_qth_renewal_flag               IN quotation_headers.qth_renewal_flag%TYPE,
  p_qth_recalc_lead_days           IN quotation_headers.qth_recalc_lead_days%TYPE
)
RETURN quotation_headers.qth_id%TYPE;

FUNCTION GENERATE_FUNC(
  p_qth_cus_code                   IN quotation_headers.qth_cus_code%TYPE,
  p_qth_naz_nac_code               IN quotation_headers.qth_naz_nac_code%TYPE,
  p_qth_naz_zone_code              IN quotation_headers.qth_naz_zone_code%TYPE,
  p_qth_qty_code                   IN quotation_headers.qth_qty_code%TYPE,
  p_qth_description                IN quotation_headers.qth_description%TYPE,
  p_qth_start_date                 IN quotation_headers.qth_start_date%TYPE,
  p_qth_end_date                   IN quotation_headers.qth_end_date%TYPE,
  p_qth_interval                   IN quotation_headers.qth_interval%TYPE,
  p_qth_promotion_percent          IN quotation_headers.qth_promotion_percent%TYPE,
  p_qth_recalculate_promo_switch   IN quotation_headers.qth_recalculate_promo_switch%TYPE,
  p_qth_price_change_percent       IN quotation_headers.qth_price_change_percent%TYPE,
  p_qth_agreement_percent          IN quotation_headers.qth_agreement_percent%TYPE,
  p_qth_renewal_flag               IN quotation_headers.qth_renewal_flag%TYPE,
  p_qth_recalc_lead_days           IN quotation_headers.qth_recalc_lead_days%TYPE
)
RETURN quotation_headers.qth_id%TYPE;

PROCEDURE UPDATE_CUS_PROFILES_PROC(
  p_qth_cus_code IN quotation_headers.qth_cus_code%TYPE
);

PROCEDURE QUOTATION_PRD_TO_PROFIL_PROC(
  p_jsc_id   IN job_schedules.jsc_id%TYPE
);

PROCEDURE PURGE_PROC(
  p_qth_cus_code IN quotation_headers.qth_cus_code%TYPE
);

END QTH_OPERATION_PACK;
/