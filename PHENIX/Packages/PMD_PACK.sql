CREATE OR REPLACE PACKAGE phenix.PMD_PACK IS

--
-- Copie de la generation automatique.
--

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pick_mission_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pmd_id                         IN         pick_mission_details.pmd_id%TYPE,
  p_pmd_rec                        OUT NOCOPY pick_mission_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pmd_id                         IN         pick_mission_details.pmd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pmd_id                         IN         pick_mission_details.pmd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pmd_id                         IN         pick_mission_details.pmd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pmd_id                         IN         pick_mission_details.pmd_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_pmd_pmh_id                   IN         pick_mission_details.pmd_pmh_id%TYPE,
  p_pmd_prf_prd_code             IN         pick_mission_details.pmd_prf_prd_code%TYPE,
  p_pmd_prf_fmt_code             IN         pick_mission_details.pmd_prf_fmt_code%TYPE,
  p_pmd_quantity                 IN         pick_mission_details.pmd_quantity%TYPE,
  p_pmd_weight                   IN         pick_mission_details.pmd_weight%TYPE,
  p_pmd_loc_code                 IN         pick_mission_details.pmd_loc_code%TYPE,
  p_pmd_quantity_picked          IN         pick_mission_details.pmd_quantity_picked%TYPE,
  p_pmd_weight_picked            IN         pick_mission_details.pmd_weight_picked%TYPE,
  p_pmd_sequence_number          IN         pick_mission_details.pmd_sequence_number%TYPE,
  p_pmd_use_picker_code          IN         pick_mission_details.pmd_use_picker_code%TYPE,
  p_pmd_loc_alt_code             IN         pick_mission_details.pmd_loc_alt_code%TYPE,
  p_pmd_quantity_to_ship         IN         pick_mission_details.pmd_quantity_to_ship%TYPE,
  p_pmd_weight_to_ship           IN         pick_mission_details.pmd_weight_to_ship%TYPE,
  p_pmd_pmh_pco_id               IN         pick_mission_details.pmd_pmh_pco_id%TYPE,
  p_pmd_sysgen_completion_switch IN         pick_mission_details.pmd_sysgen_completion_switch%TYPE      DEFAULT NULL,
  p_pmd_quantity_return          IN         pick_mission_details.pmd_quantity_return%TYPE               DEFAULT NULL,
  p_pmd_weight_return            IN         pick_mission_details.pmd_weight_return%TYPE                 DEFAULT NULL,
  p_pmd_movement_only_switch     IN         pick_mission_details.pmd_movement_only_switch%TYPE          DEFAULT NULL,
  p_pmd_shorted_switch           IN         pick_mission_details.pmd_shorted_switch%TYPE                DEFAULT NULL,
  p_pmd_second_wave_switch       IN         pick_mission_details.pmd_second_wave_switch%TYPE            DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pick_mission_details%ROWTYPE)
RETURN NUMBER;

END PMD_PACK;
/