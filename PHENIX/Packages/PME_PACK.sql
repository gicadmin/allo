CREATE OR REPLACE PACKAGE phenix.PME_PACK IS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pick_mission_exp_dates%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pme_id                         IN         pick_mission_exp_dates.pme_id%TYPE,
  p_pme_rec                        OUT NOCOPY pick_mission_exp_dates%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pme_id                         IN         pick_mission_exp_dates.pme_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pme_id                         IN         pick_mission_exp_dates.pme_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_pme_id                         IN         pick_mission_exp_dates.pme_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pme_id                         IN         pick_mission_exp_dates.pme_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pme_pmd_id               IN         pick_mission_exp_dates.pme_pmd_id%TYPE,
  p_pme_expiration_date      IN         pick_mission_exp_dates.pme_expiration_date%TYPE,
  p_pme_quantity             IN         pick_mission_exp_dates.pme_quantity%TYPE,
  p_pme_quantity_distributed IN         pick_mission_exp_dates.pme_quantity_distributed%TYPE      DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pick_mission_exp_dates%ROWTYPE)
RETURN NUMBER;

END PME_PACK;
/