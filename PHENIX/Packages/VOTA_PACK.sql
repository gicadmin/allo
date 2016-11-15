CREATE OR REPLACE PACKAGE phenix.VOTA_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  validate_oa_tpa_agreements%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_vota_sender_id              IN         validate_oa_tpa_agreements.vota_sender_id%TYPE                   DEFAULT NULL,
  p_vota_ven_code               IN         validate_oa_tpa_agreements.vota_ven_code%TYPE                    DEFAULT NULL,
  p_vota_agreement_id           IN         validate_oa_tpa_agreements.vota_agreement_id%TYPE                DEFAULT NULL,
  p_vota_qualifier              IN         validate_oa_tpa_agreements.vota_qualifier%TYPE                   DEFAULT NULL,
  p_vota_description            IN         validate_oa_tpa_agreements.vota_description%TYPE                 DEFAULT NULL,
  p_vota_alt_description        IN         validate_oa_tpa_agreements.vota_alt_description%TYPE             DEFAULT NULL,
  p_vota_cus_code               IN         validate_oa_tpa_agreements.vota_cus_code%TYPE                    DEFAULT NULL,
  p_vota_vendor_customer_code   IN         validate_oa_tpa_agreements.vota_vendor_customer_code%TYPE        DEFAULT NULL,
  p_vota_corresponding_cus_code IN         validate_oa_tpa_agreements.vota_corresponding_cus_code%TYPE      DEFAULT NULL,
  p_vota_vpd_code               IN         validate_oa_tpa_agreements.vota_vpd_code%TYPE                    DEFAULT NULL,
  p_vota_prd_code               IN         validate_oa_tpa_agreements.vota_prd_code%TYPE                    DEFAULT NULL,
  p_vota_vendor_format          IN         validate_oa_tpa_agreements.vota_vendor_format%TYPE               DEFAULT NULL,
  p_vota_fmt_code               IN         validate_oa_tpa_agreements.vota_fmt_code%TYPE                    DEFAULT NULL,
  p_vota_start_date             IN         validate_oa_tpa_agreements.vota_start_date%TYPE                  DEFAULT NULL,
  p_vota_end_date               IN         validate_oa_tpa_agreements.vota_end_date%TYPE                    DEFAULT NULL,
  p_vota_amount                 IN         validate_oa_tpa_agreements.vota_amount%TYPE                      DEFAULT NULL,
  p_vota_ccr_code               IN         validate_oa_tpa_agreements.vota_ccr_code%TYPE                    DEFAULT NULL,
  p_vota_printed_switch         IN         validate_oa_tpa_agreements.vota_printed_switch%TYPE              DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY validate_oa_tpa_agreements%ROWTYPE);

END VOTA_PACK;
/