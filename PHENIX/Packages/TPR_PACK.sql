CREATE OR REPLACE PACKAGE phenix.TPR_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_pallet_rules%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tpr_sid_id                     IN         temporary_pallet_rules.tpr_sid_id%TYPE,
  p_tpr_rou_code                   IN         temporary_pallet_rules.tpr_rou_code%TYPE,
  p_tpr_pmr_pms_pmo_code           IN         temporary_pallet_rules.tpr_pmr_pms_pmo_code%TYPE,
  p_tpr_pmr_pms_id                 IN         temporary_pallet_rules.tpr_pmr_pms_id%TYPE,
  p_tpr_pmr_sequence_code          IN         temporary_pallet_rules.tpr_pmr_sequence_code%TYPE,
  p_tpr_rec                        OUT NOCOPY temporary_pallet_rules%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tpr_sid_id                     IN         temporary_pallet_rules.tpr_sid_id%TYPE,
  p_tpr_rou_code                   IN         temporary_pallet_rules.tpr_rou_code%TYPE,
  p_tpr_pmr_pms_pmo_code           IN         temporary_pallet_rules.tpr_pmr_pms_pmo_code%TYPE,
  p_tpr_pmr_pms_id                 IN         temporary_pallet_rules.tpr_pmr_pms_id%TYPE,
  p_tpr_pmr_sequence_code          IN         temporary_pallet_rules.tpr_pmr_sequence_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tpr_sid_id                     IN         temporary_pallet_rules.tpr_sid_id%TYPE,
  p_tpr_rou_code                   IN         temporary_pallet_rules.tpr_rou_code%TYPE,
  p_tpr_pmr_pms_pmo_code           IN         temporary_pallet_rules.tpr_pmr_pms_pmo_code%TYPE,
  p_tpr_pmr_pms_id                 IN         temporary_pallet_rules.tpr_pmr_pms_id%TYPE,
  p_tpr_pmr_sequence_code          IN         temporary_pallet_rules.tpr_pmr_sequence_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tpr_sid_id                     IN         temporary_pallet_rules.tpr_sid_id%TYPE,
  p_tpr_rou_code                   IN         temporary_pallet_rules.tpr_rou_code%TYPE,
  p_tpr_pmr_pms_pmo_code           IN         temporary_pallet_rules.tpr_pmr_pms_pmo_code%TYPE,
  p_tpr_pmr_pms_id                 IN         temporary_pallet_rules.tpr_pmr_pms_id%TYPE,
  p_tpr_pmr_sequence_code          IN         temporary_pallet_rules.tpr_pmr_sequence_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tpr_sid_id                     IN         temporary_pallet_rules.tpr_sid_id%TYPE,
  p_tpr_rou_code                   IN         temporary_pallet_rules.tpr_rou_code%TYPE,
  p_tpr_pmr_pms_pmo_code           IN         temporary_pallet_rules.tpr_pmr_pms_pmo_code%TYPE,
  p_tpr_pmr_pms_id                 IN         temporary_pallet_rules.tpr_pmr_pms_id%TYPE,
  p_tpr_pmr_sequence_code          IN         temporary_pallet_rules.tpr_pmr_sequence_code%TYPE);


PROCEDURE INSERT_PROC(
  p_tpr_sid_id                  IN         temporary_pallet_rules.tpr_sid_id%TYPE,
  p_tpr_rou_code                IN         temporary_pallet_rules.tpr_rou_code%TYPE,
  p_tpr_pmr_pms_pmo_code        IN         temporary_pallet_rules.tpr_pmr_pms_pmo_code%TYPE,
  p_tpr_pmr_pms_id              IN         temporary_pallet_rules.tpr_pmr_pms_id%TYPE,
  p_tpr_pmr_sequence_code       IN         temporary_pallet_rules.tpr_pmr_sequence_code%TYPE,
  p_tpr_pmr_meter_min_volume    IN         temporary_pallet_rules.tpr_pmr_meter_min_volume%TYPE,
  p_tpr_pmr_meter_max_volume    IN         temporary_pallet_rules.tpr_pmr_meter_max_volume%TYPE,
  p_tpr_pmr_max_nb_of_customers IN         temporary_pallet_rules.tpr_pmr_max_nb_of_customers%TYPE,
  p_tpr_pmr_whz_code            IN         temporary_pallet_rules.tpr_pmr_whz_code%TYPE                 DEFAULT NULL,
  p_tpr_pmr_cus_code            IN         temporary_pallet_rules.tpr_pmr_cus_code%TYPE                 DEFAULT NULL,
  p_tpr_pmr_pty_code            IN         temporary_pallet_rules.tpr_pmr_pty_code%TYPE                 DEFAULT NULL,
  p_tpr_pmr_cgr_code            IN         temporary_pallet_rules.tpr_pmr_cgr_code%TYPE                 DEFAULT NULL,
  p_tpr_pmr_prw_whz_code        IN         temporary_pallet_rules.tpr_pmr_prw_whz_code%TYPE             DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_pallet_rules%ROWTYPE);

END TPR_PACK;
/