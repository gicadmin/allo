CREATE OR REPLACE PACKAGE phenix.PMR_OPERATION_PACK IS

FUNCTION GET_LARGEST_MAX_VOLUME_FUNC(
  p_pmo_code                  IN pallet_model_rules.pmr_pms_pmo_code%TYPE,
  p_cus_code                  IN pallet_model_rules.pmr_cus_code%TYPE
) RETURN pallet_model_rules.pmr_meter_max_volume%TYPE;

PROCEDURE LOCK_PMR_PROC(
  p_pmr_id  IN pallet_model_rules.pmr_id%TYPE);

FUNCTION EXIST_PMO_FUNC(
  p_pmr_pms_pmo_code  IN pallet_model_rules.pmr_pms_pmo_code%TYPE
) RETURN BOOLEAN;

FUNCTION DOES_PMR_SEQ_EXISTS_FUNC(
  p_pmr_pms_id         IN pallet_model_rules.pmr_pms_id%TYPE,
  p_pmr_sequence_code  IN pallet_model_rules.pmr_sequence_code%TYPE,
  p_pmr_id             IN pallet_model_rules.pmr_id%TYPE DEFAULT NULL
) RETURN BOOLEAN;

FUNCTION COPY_MODEL_FUNC(
  p_from_pmo_code      IN pallet_model_rules.pmr_pms_pmo_code%TYPE,
  p_from_main_pms_id  IN pallet_model_rules.pmr_pms_id%TYPE,
  p_to_pmo_code       IN pallet_model_rules.pmr_pms_pmo_code%TYPE,
  p_to_main_pms_id    IN pallet_model_rules.pmr_pms_id%TYPE
) RETURN NUMBER;

FUNCTION DO_PMR_EXISTS_FOR_PTY_FUNC(
  p_pmr_pty_code IN pallet_model_rules.pmr_pty_code%TYPE
)
RETURN BOOLEAN;

FUNCTION DO_PMR_EXISTS_FOR_WHZ_FUNC(
  p_pmr_whz_code IN pallet_model_rules.pmr_whz_code%TYPE
)
RETURN BOOLEAN;

END PMR_OPERATION_PACK;
/