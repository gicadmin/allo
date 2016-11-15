CREATE OR REPLACE PACKAGE phenix.MDR_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  match_detail_rebills%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_mdr_id                         IN         match_detail_rebills.mdr_id%TYPE,
  p_mdr_rec                        OUT NOCOPY match_detail_rebills%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_mdr_id                         IN         match_detail_rebills.mdr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_mdr_id                         IN         match_detail_rebills.mdr_id%TYPE)
RETURN NUMBER;

FUNCTION GET_FULL_FUNC(
  p_mdr_pod_poh_id                 IN         match_detail_rebills.mdr_pod_poh_id%TYPE,
  p_mdr_pod_line_number            IN         match_detail_rebills.mdr_pod_line_number%TYPE,
  p_mdr_billback_type              IN         match_detail_rebills.mdr_billback_type%TYPE,
  p_mdr_rec                        OUT NOCOPY match_detail_rebills%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_mdr_pod_poh_id                 IN         match_detail_rebills.mdr_pod_poh_id%TYPE,
  p_mdr_pod_line_number            IN         match_detail_rebills.mdr_pod_line_number%TYPE,
  p_mdr_billback_type              IN         match_detail_rebills.mdr_billback_type%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_mdr_pod_poh_id                 IN         match_detail_rebills.mdr_pod_poh_id%TYPE,
  p_mdr_pod_line_number            IN         match_detail_rebills.mdr_pod_line_number%TYPE,
  p_mdr_billback_type              IN         match_detail_rebills.mdr_billback_type%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_mdr_mad_ap_invoice_number IN         match_detail_rebills.mdr_mad_ap_invoice_number%TYPE,
  p_mdr_mad_line_number       IN         match_detail_rebills.mdr_mad_line_number%TYPE,
  p_mdr_pod_poh_id            IN         match_detail_rebills.mdr_pod_poh_id%TYPE,
  p_mdr_pod_line_number       IN         match_detail_rebills.mdr_pod_line_number%TYPE,
  p_mdr_pdi_dit_code          IN         match_detail_rebills.mdr_pdi_dit_code%TYPE,
  p_mdr_pdi_ven_code          IN         match_detail_rebills.mdr_pdi_ven_code%TYPE,
  p_mdr_billback_type         IN         match_detail_rebills.mdr_billback_type%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY match_detail_rebills%ROWTYPE)
RETURN NUMBER;

END MDR_PACK;
/