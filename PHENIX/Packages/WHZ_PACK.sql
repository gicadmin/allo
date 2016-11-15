CREATE OR REPLACE PACKAGE phenix.WHZ_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  warehouse_zones%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_whz_code                       IN         warehouse_zones.whz_code%TYPE,
  p_whz_rec                        OUT NOCOPY warehouse_zones%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_whz_code                       IN         warehouse_zones.whz_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_whz_code                       IN         warehouse_zones.whz_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_whz_code                       IN         warehouse_zones.whz_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_whz_code                       IN         warehouse_zones.whz_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_whz_code                       IN         warehouse_zones.whz_code%TYPE);


PROCEDURE INSERT_PROC(
  p_whz_code                       IN         warehouse_zones.whz_code%TYPE,
  p_whz_description                IN         warehouse_zones.whz_description%TYPE,
  p_whz_whc_code                   IN         warehouse_zones.whz_whc_code%TYPE,
  p_whz_alt_description            IN         warehouse_zones.whz_alt_description%TYPE                 DEFAULT NULL,
  p_whz_minimum_pallet_volume      IN         warehouse_zones.whz_minimum_pallet_volume%TYPE           DEFAULT NULL,
  p_whz_maximum_pallet_volume      IN         warehouse_zones.whz_maximum_pallet_volume%TYPE           DEFAULT NULL,
  p_whz_load_on_truck_sequence     IN         warehouse_zones.whz_load_on_truck_sequence%TYPE          DEFAULT NULL,
  p_whz_prn_id                     IN         warehouse_zones.whz_prn_id%TYPE                          DEFAULT NULL,
  p_whz_whz_code                   IN         warehouse_zones.whz_whz_code%TYPE                        DEFAULT NULL,
  p_whz_count_pick_interval        IN         warehouse_zones.whz_count_pick_interval%TYPE             DEFAULT NULL,
  p_whz_repack_tote_volume         IN         warehouse_zones.whz_repack_tote_volume%TYPE              DEFAULT NULL,
  p_whz_auto_pick_list_switch      IN         warehouse_zones.whz_auto_pick_list_switch%TYPE           DEFAULT 0 ,
  p_whz_segregate_rsrv_misn_swit   IN         warehouse_zones.whz_segregate_rsrv_misn_switch%TYPE      DEFAULT 0 ,
  p_whz_mission_by_pallet_switch   IN         warehouse_zones.whz_mission_by_pallet_switch%TYPE        DEFAULT 0 ,
  p_whz_confirm_nb_packages_swit   IN         warehouse_zones.whz_confirm_nb_packages_switch%TYPE      DEFAULT 1 ,
  p_whz_conf_repack_sticker_swit   IN         warehouse_zones.whz_conf_repack_sticker_switch%TYPE      DEFAULT 1 ,
  p_whz_disp_deliv_message_switc   IN         warehouse_zones.whz_disp_deliv_message_switch%TYPE       DEFAULT 1 ,
  p_whz_go_back_for_shorts_switc   IN         warehouse_zones.whz_go_back_for_shorts_switch%TYPE       DEFAULT 0 ,
  p_whz_skip_location_switch       IN         warehouse_zones.whz_skip_location_switch%TYPE            DEFAULT 0 ,
  p_whz_split_mission_print_swit   IN         warehouse_zones.whz_split_mission_print_switch%TYPE      DEFAULT 0 ,
  p_whz_print_report_type          IN         warehouse_zones.whz_print_report_type%TYPE               DEFAULT 'L' ,
  p_whz_tot_switch                 IN         warehouse_zones.whz_tot_switch%TYPE                      DEFAULT 0 ,
  p_whz_lot_pick_priority          IN         warehouse_zones.whz_lot_pick_priority%TYPE               DEFAULT 'P' ,
  p_whz_fifo_pick_priority         IN         warehouse_zones.whz_fifo_pick_priority%TYPE              DEFAULT 'P' ,
  p_whz_max_case_weight            IN         warehouse_zones.whz_max_case_weight%TYPE                 DEFAULT 99999.999 ,
  p_whz_split_pallet_by_pmh_swit   IN         warehouse_zones.whz_split_pallet_by_pmh_switch%TYPE      DEFAULT 0 ,
  p_whz_min_overstock_pick_volum   IN         warehouse_zones.whz_min_overstock_pick_volume%TYPE       DEFAULT 0 ,
  p_whz_collect_at_the_end_switc   IN         warehouse_zones.whz_collect_at_the_end_switch%TYPE       DEFAULT 0 ,
  p_whz_truck_type                 IN         warehouse_zones.whz_truck_type%TYPE                      DEFAULT 'DRYV' );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY warehouse_zones%ROWTYPE);

---------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION FIND_WHZ_DESCRIPTION_FUNC(
	p_whz_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

FUNCTION FIND_WHZ_MAX_PAL_VOLUME_FUNC(
	p_whz_code IN warehouse_zones.whz_code%TYPE
)
RETURN NUMBER;

FUNCTION FIND_WHZ_NB_PACK_SWITCH_FUNC(
	p_whz_code IN warehouse_zones.whz_code%TYPE
)
RETURN NUMBER;

FUNCTION DO_WHZ_EXISTS_FUNC(
  p_whz_code IN warehouse_zones.whz_code%TYPE
)
RETURN BOOLEAN;

END WHZ_PACK;
/