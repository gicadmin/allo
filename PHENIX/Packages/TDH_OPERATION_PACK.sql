CREATE OR REPLACE PACKAGE phenix.TDH_OPERATION_PACK IS

PROCEDURE GET_INFO_ROUTE_PROC(
  p_trd_cus_code             IN temporary_route_dates.trd_cus_code%TYPE,
  p_rou_type                 IN routes.rou_type%TYPE,
  p_tdh_route_date           IN temporary_route_date_headers.tdh_route_date%TYPE,
  p_language                 IN VARCHAR2,
  p_tdh_rou_code             OUT temporary_route_date_headers.tdh_rou_code%TYPE,
  p_desc                     OUT routes.rou_description%TYPE,
  p_trd_position             OUT temporary_route_dates.trd_position%TYPE,
  p_tdh_route_loc_dock_code  OUT temporary_route_date_headers.tdh_route_loc_dock_code%TYPE,
  p_tdh_route_trk_code       OUT temporary_route_date_headers.tdh_route_trk_code%TYPE,
  p_tdh_use_code             OUT temporary_route_date_headers.tdh_use_code%TYPE,
  p_tdh_use_aide_code        OUT temporary_route_date_headers.tdh_use_aide_code%TYPE
);

FUNCTION FIND_TDH_EXTRA_INFO_FUNC(
  p_tdh_route_date           IN temporary_route_date_headers.tdh_route_date%TYPE,
  p_tdh_rou_code             IN temporary_route_date_headers.tdh_rou_code%TYPE,
  p_tdh_route_trk_code       OUT temporary_route_date_headers.tdh_route_trk_code%TYPE,
  p_tdh_use_code             OUT temporary_route_date_headers.tdh_use_code%TYPE,
  p_tdh_use_aide_code        OUT temporary_route_date_headers.tdh_use_aide_code%TYPE,
  p_tdh_route_loc_dock_code  OUT temporary_route_date_headers.tdh_route_loc_dock_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE SET_ROUTE_TO_ORPHANS_PROC(
  p_tdh_route_date IN temporary_route_date_headers.tdh_route_date%TYPE
);

PROCEDURE SET_DOCK_CODE_PROC(
  p_tdh_rou_code                IN temporary_route_date_headers.tdh_rou_code%TYPE,
  p_tdh_route_date              IN temporary_route_date_headers.tdh_route_date%TYPE,
  p_old_tdh_route_loc_dock_code IN temporary_route_date_headers.tdh_route_loc_dock_code%TYPE,
  p_new_tdh_route_loc_dock_code IN temporary_route_date_headers.tdh_route_loc_dock_code%TYPE,
  p_use_code                    IN users.use_code%TYPE
);

END TDH_OPERATION_PACK;
/