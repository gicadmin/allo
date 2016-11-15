CREATE OR REPLACE PACKAGE phenix.CPD_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  console_pick_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cpd_pmd_id                     IN         console_pick_details.cpd_pmd_id%TYPE,
  p_cpd_rec                        OUT NOCOPY console_pick_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cpd_pmd_id                     IN         console_pick_details.cpd_pmd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cpd_pmd_id                     IN         console_pick_details.cpd_pmd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cpd_pmd_id                     IN         console_pick_details.cpd_pmd_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cpd_pmd_id                     IN         console_pick_details.cpd_pmd_id%TYPE);


PROCEDURE INSERT_PROC(
  p_cpd_pmd_id              IN         console_pick_details.cpd_pmd_id%TYPE,
  p_cpd_pmd_pmh_id          IN         console_pick_details.cpd_pmd_pmh_id%TYPE,
  p_cpd_pmd_prf_prd_code    IN         console_pick_details.cpd_pmd_prf_prd_code%TYPE,
  p_cpd_pmd_prf_fmt_code    IN         console_pick_details.cpd_pmd_prf_fmt_code%TYPE,
  p_cpd_pmd_quantity        IN         console_pick_details.cpd_pmd_quantity%TYPE             DEFAULT NULL,
  p_cpd_pmd_weight          IN         console_pick_details.cpd_pmd_weight%TYPE               DEFAULT NULL,
  p_cpd_pmd_pmh_pco_id      IN         console_pick_details.cpd_pmd_pmh_pco_id%TYPE           DEFAULT NULL,
  p_cpd_pmd_loc_code        IN         console_pick_details.cpd_pmd_loc_code%TYPE             DEFAULT NULL,
  p_cpd_pmd_quantity_picked IN         console_pick_details.cpd_pmd_quantity_picked%TYPE      DEFAULT NULL,
  p_cpd_pmd_weight_picked   IN         console_pick_details.cpd_pmd_weight_picked%TYPE        DEFAULT NULL,
  p_cpd_pmd_use_picker_code IN         console_pick_details.cpd_pmd_use_picker_code%TYPE      DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY console_pick_details%ROWTYPE);

END CPD_PACK;
/