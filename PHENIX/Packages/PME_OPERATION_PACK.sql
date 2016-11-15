CREATE OR REPLACE PACKAGE phenix.PME_OPERATION_PACK IS

PROCEDURE UPDATE_INSERT_PME_PROC(
  p_pme_pmd_id           IN  pick_mission_exp_dates.pme_pmd_id%TYPE,
  p_pme_expiration_date  IN  pick_mission_exp_dates.pme_expiration_date%TYPE,
  p_pme_quantity         IN  pick_mission_exp_dates.pme_quantity%TYPE
);

FUNCTION DELETE_PME_FOR_PMD_FUNC(
  p_pme_pmd_id IN pick_mission_exp_dates.pme_pmd_id%TYPE
)
RETURN NUMBER;

END PME_OPERATION_PACK;
/