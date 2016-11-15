CREATE OR REPLACE PACKAGE phenix.PMR_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pallet_model_rules%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pmr_id                         IN         pallet_model_rules.pmr_id%TYPE,
  p_pmr_rec                        OUT NOCOPY pallet_model_rules%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pmr_id                         IN         pallet_model_rules.pmr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pmr_id                         IN         pallet_model_rules.pmr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pmr_id                         IN         pallet_model_rules.pmr_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pmr_id                         IN         pallet_model_rules.pmr_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_pmr_pms_pmo_code               IN         pallet_model_rules.pmr_pms_pmo_code%TYPE,
  p_pmr_pms_id                     IN         pallet_model_rules.pmr_pms_id%TYPE,
  p_pmr_sequence_code              IN         pallet_model_rules.pmr_sequence_code%TYPE,
  p_pmr_rec                        OUT NOCOPY pallet_model_rules%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pmr_pms_pmo_code               IN         pallet_model_rules.pmr_pms_pmo_code%TYPE,
  p_pmr_pms_id                     IN         pallet_model_rules.pmr_pms_id%TYPE,
  p_pmr_sequence_code              IN         pallet_model_rules.pmr_sequence_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pmr_pms_pmo_code               IN         pallet_model_rules.pmr_pms_pmo_code%TYPE,
  p_pmr_pms_id                     IN         pallet_model_rules.pmr_pms_id%TYPE,
  p_pmr_sequence_code              IN         pallet_model_rules.pmr_sequence_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pmr_pms_pmo_code               IN         pallet_model_rules.pmr_pms_pmo_code%TYPE,
  p_pmr_pms_id                     IN         pallet_model_rules.pmr_pms_id%TYPE,
  p_pmr_sequence_code              IN         pallet_model_rules.pmr_sequence_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pmr_pms_pmo_code               IN         pallet_model_rules.pmr_pms_pmo_code%TYPE,
  p_pmr_pms_id                     IN         pallet_model_rules.pmr_pms_id%TYPE,
  p_pmr_sequence_code              IN         pallet_model_rules.pmr_sequence_code%TYPE);


FUNCTION INSERT_FUNC(
  p_pmr_pms_pmo_code        IN         pallet_model_rules.pmr_pms_pmo_code%TYPE,
  p_pmr_pms_id              IN         pallet_model_rules.pmr_pms_id%TYPE,
  p_pmr_sequence_code       IN         pallet_model_rules.pmr_sequence_code%TYPE,
  p_pmr_meter_min_volume    IN         pallet_model_rules.pmr_meter_min_volume%TYPE,
  p_pmr_meter_max_volume    IN         pallet_model_rules.pmr_meter_max_volume%TYPE,
  p_pmr_max_nb_of_customers IN         pallet_model_rules.pmr_max_nb_of_customers%TYPE,
  p_pmr_whz_code            IN         pallet_model_rules.pmr_whz_code%TYPE                 DEFAULT NULL,
  p_pmr_cus_code            IN         pallet_model_rules.pmr_cus_code%TYPE                 DEFAULT NULL,
  p_pmr_pty_code            IN         pallet_model_rules.pmr_pty_code%TYPE                 DEFAULT NULL,
  p_pmr_cgr_code            IN         pallet_model_rules.pmr_cgr_code%TYPE                 DEFAULT NULL,
  p_pmr_prw_whz_code        IN         pallet_model_rules.pmr_prw_whz_code%TYPE             DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pallet_model_rules%ROWTYPE)
RETURN NUMBER;

END PMR_PACK;
/