CREATE OR REPLACE PACKAGE phenix.CPD_OPERATION_PACK IS

PROCEDURE UPDATE_PROC(
  p_cpd_pmd_id                  IN console_pick_details.cpd_pmd_id%TYPE,
  p_cpd_pmd_pmh_id              IN console_pick_details.cpd_pmd_pmh_id%TYPE,
  p_cpd_pmd_prf_prd_code        IN console_pick_details.cpd_pmd_prf_prd_code%TYPE,
  p_cpd_pmd_prf_fmt_code        IN console_pick_details.cpd_pmd_prf_fmt_code%TYPE,
  p_cpd_pmd_quantity            IN console_pick_details.cpd_pmd_quantity%TYPE,
  p_cpd_pmd_weight              IN console_pick_details.cpd_pmd_weight%TYPE,
  p_cpd_pmd_pmh_pco_id          IN console_pick_details.cpd_pmd_pmh_pco_id%TYPE,
  p_cpd_pmd_loc_code            IN console_pick_details.cpd_pmd_loc_code%TYPE,
  p_cpd_pmd_quantity_picked     IN console_pick_details.cpd_pmd_quantity_picked%TYPE,
  p_cpd_pmd_weight_picked       IN console_pick_details.cpd_pmd_weight_picked%TYPE,
  p_cpd_pmd_use_picker_code     IN console_pick_details.cpd_pmd_use_picker_code%TYPE  --ber6445
);

PROCEDURE COPY_PMD_DETAILS_PROC(
  p_cph_pmh_id  console_pick_headers.cph_pmh_id%TYPE
);

END CPD_OPERATION_PACK;
/