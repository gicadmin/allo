CREATE OR REPLACE PACKAGE phenix.PCR_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  product_counter_reclaims%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pcr_id                         IN         product_counter_reclaims.pcr_id%TYPE,
  p_pcr_rec                        OUT NOCOPY product_counter_reclaims%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pcr_id                         IN         product_counter_reclaims.pcr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_pcr_id                         IN         product_counter_reclaims.pcr_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pcr_id                         IN         product_counter_reclaims.pcr_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pcr_vendor_amount       IN         product_counter_reclaims.pcr_vendor_amount%TYPE,
  p_pcr_telemarketer_amount IN         product_counter_reclaims.pcr_telemarketer_amount%TYPE,
  p_pcr_salesman_amount     IN         product_counter_reclaims.pcr_salesman_amount%TYPE,
  p_pcr_original_pct_id     IN         product_counter_reclaims.pcr_original_pct_id%TYPE,
  p_pcr_pct_id              IN         product_counter_reclaims.pcr_pct_id%TYPE                   DEFAULT NULL,
  p_pcr_vbd_id              IN         product_counter_reclaims.pcr_vbd_id%TYPE                   DEFAULT NULL,
  p_pcr_cod_coh_id          IN         product_counter_reclaims.pcr_cod_coh_id%TYPE               DEFAULT NULL,
  p_pcr_cod_line_number     IN         product_counter_reclaims.pcr_cod_line_number%TYPE          DEFAULT NULL,
  p_pcr_cad_id              IN         product_counter_reclaims.pcr_cad_id%TYPE                   DEFAULT NULL,
  p_pcr_admin_amount        IN         product_counter_reclaims.pcr_admin_amount%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY product_counter_reclaims%ROWTYPE)
RETURN NUMBER;

END PCR_PACK;
/