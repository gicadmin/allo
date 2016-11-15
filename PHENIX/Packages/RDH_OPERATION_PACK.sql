CREATE OR REPLACE PACKAGE phenix.RDH_OPERATION_PACK IS

PROCEDURE GET_INFO_TRUCK_PROC(
  p_rdh_route_date           IN  route_date_headers.rdh_route_date%TYPE,
  p_rdh_rou_code             IN  route_date_headers.rdh_rou_code%TYPE,
  p_rdh_route_loc_dock_code  OUT route_date_headers.rdh_route_loc_dock_code%TYPE,
  p_rdh_route_trk_code       OUT route_date_headers.rdh_route_trk_code%TYPE,
  p_rdh_use_code             OUT route_date_headers.rdh_use_code%TYPE,
  p_rdh_use_aide_code        OUT route_date_headers.rdh_use_aide_code%TYPE
);
PROCEDURE SET_DOCK_CODE_PROC(
  p_rdh_rou_code                IN route_date_headers.rdh_rou_code%TYPE,
  p_rdh_route_date              IN route_date_headers.rdh_route_date%TYPE,
  p_old_rdh_route_loc_dock_code IN route_date_headers.rdh_route_loc_dock_code%TYPE,
  p_new_rdh_route_loc_dock_code IN route_date_headers.rdh_route_loc_dock_code%TYPE,
  p_use_code                    IN users.use_code%TYPE
);
END RDH_OPERATION_PACK;
/