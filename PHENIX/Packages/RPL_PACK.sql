CREATE OR REPLACE PACKAGE phenix.RPL_PACK IS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  replenish_pick_lists%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rpl_id                         IN         replenish_pick_lists.rpl_id%TYPE,
  p_rpl_rec                        OUT NOCOPY replenish_pick_lists%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rpl_id                         IN         replenish_pick_lists.rpl_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_rpl_id                         IN         replenish_pick_lists.rpl_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rpl_id                         IN         replenish_pick_lists.rpl_id%TYPE);


FUNCTION INSERT_FUNC(
  p_rpl_rep_id           IN         replenish_pick_lists.rpl_rep_id%TYPE,
  p_rpl_plh_id           IN         replenish_pick_lists.rpl_plh_id%TYPE                DEFAULT NULL,
  p_rpl_vph_id           IN         replenish_pick_lists.rpl_vph_id%TYPE                DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY replenish_pick_lists%ROWTYPE)
RETURN NUMBER;


FUNCTION EXISTS_FOR_PLH_FUNC(
  p_plh_id            in pick_list_headers.plh_id%TYPE)
RETURN BOOLEAN;


END RPL_PACK;
/