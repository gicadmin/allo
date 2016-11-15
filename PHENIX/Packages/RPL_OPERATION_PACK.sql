CREATE OR REPLACE PACKAGE phenix.RPL_OPERATION_PACK IS

  TYPE r_plh_vph IS RECORD (
    rpl_plh_id 							replenish_pick_lists.rpl_plh_id%TYPE,
    rpl_vph_id 							replenish_pick_lists.rpl_vph_id%TYPE
  );

  TYPE t_plh_vph IS TABLE OF r_plh_vph;

PROCEDURE FILL_RPL_INFO_PROC(
  p_rpl_rep_id      IN          replenish_pick_lists.rpl_rep_id%TYPE,
  p_rpl_info_rec    OUT NOCOPY  RPL_OPERATION_PACK.t_plh_vph
);

PROCEDURE TREAT_RPL_INFO_PROC(
  p_plh_vph_info_rec     IN             RPL_OPERATION_PACK.t_plh_vph,
  p_infos_to_replenish   IN OUT NOCOPY  REP_INFO_PACK.t_infos_for_replenish --on recoit 1 seul record à traiter et pas le tableau
);

FUNCTION LOCK_ALL_RPL_FOR_A_REP_FUNC(
  p_rpl_rep_id IN replenish_pick_lists.rpl_rep_id%TYPE
)
RETURN BOOLEAN;

PROCEDURE INSERT_FROM_PLH_PROC(
  p_rep_id            IN replenishments.rep_id%TYPE,
  p_plh_ids_rec       IN REP_INFO_PACK.t_ids_rec,
  p_file_out          IN UTL_FILE.file_type
);

PROCEDURE INSERT_FROM_VPH_PROC(
  p_rep_id            IN replenishments.rep_id%TYPE,
  p_vph_ids_rec       IN REP_INFO_PACK.t_ids_rec,
  p_file_out          IN UTL_FILE.file_type
);
FUNCTION DOES_VPH_EXIST_FUNC(
  p_vph_id  in  vendor_pick_headers.vph_id%type
)RETURN BOOLEAN;

FUNCTION DOES_PLH_EXIST_FUNC(
  p_plh_id  in  pick_list_headers.plh_id%type
)RETURN BOOLEAN;
END RPL_OPERATION_PACK;
/