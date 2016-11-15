CREATE OR REPLACE PACKAGE phenix.IMA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  invoice_matching_audits%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ima_id                         IN         invoice_matching_audits.ima_id%TYPE,
  p_ima_rec                        OUT NOCOPY invoice_matching_audits%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ima_id                         IN         invoice_matching_audits.ima_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ima_id                         IN         invoice_matching_audits.ima_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ima_id                         IN         invoice_matching_audits.ima_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ima_id                         IN         invoice_matching_audits.ima_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ima_id                         IN         invoice_matching_audits.ima_id%TYPE);


FUNCTION INSERT_FUNC(
  p_ima_whs_code                  IN         invoice_matching_audits.ima_whs_code%TYPE,
  p_ima_mah_reference_number      IN         invoice_matching_audits.ima_mah_reference_number%TYPE,
  p_ima_mad_mah_ap_invoice_numbe  IN         invoice_matching_audits.ima_mad_mah_ap_invoice_number%TYPE,
  p_ima_mad_line_number           IN         invoice_matching_audits.ima_mad_line_number%TYPE,
  p_ima_mad_pod_poh_id            IN         invoice_matching_audits.ima_mad_pod_poh_id%TYPE,
  p_ima_mad_pod_line_number       IN         invoice_matching_audits.ima_mad_pod_line_number%TYPE,
  p_ima_date                      IN         invoice_matching_audits.ima_date%TYPE,
  p_ima_use_code                  IN         invoice_matching_audits.ima_use_code%TYPE,
  p_ima_source                    IN         invoice_matching_audits.ima_source%TYPE,
  p_ima_name_field                IN         invoice_matching_audits.ima_name_field%TYPE,
  p_ima_before_modif              IN         invoice_matching_audits.ima_before_modif%TYPE                   DEFAULT NULL,
  p_ima_after_modif               IN         invoice_matching_audits.ima_after_modif%TYPE                    DEFAULT NULL,
  p_ima_pdi_dit_code              IN         invoice_matching_audits.ima_pdi_dit_code%TYPE                   DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY invoice_matching_audits%ROWTYPE)
RETURN NUMBER;

END IMA_PACK;
/