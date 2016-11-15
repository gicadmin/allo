CREATE OR REPLACE PACKAGE phenix.TDH_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_route_date_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tdh_route_date                 IN         temporary_route_date_headers.tdh_route_date%TYPE,
  p_tdh_rou_code                   IN         temporary_route_date_headers.tdh_rou_code%TYPE,
  p_tdh_rec                        OUT NOCOPY temporary_route_date_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_tdh_route_date                 IN         temporary_route_date_headers.tdh_route_date%TYPE,
  p_tdh_rou_code                   IN         temporary_route_date_headers.tdh_rou_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tdh_route_date                 IN         temporary_route_date_headers.tdh_route_date%TYPE,
  p_tdh_rou_code                   IN         temporary_route_date_headers.tdh_rou_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tdh_route_date                 IN         temporary_route_date_headers.tdh_route_date%TYPE,
  p_tdh_rou_code                   IN         temporary_route_date_headers.tdh_rou_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tdh_route_date                 IN         temporary_route_date_headers.tdh_route_date%TYPE,
  p_tdh_rou_code                   IN         temporary_route_date_headers.tdh_rou_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tdh_route_date                 IN         temporary_route_date_headers.tdh_route_date%TYPE,
  p_tdh_rou_code                   IN         temporary_route_date_headers.tdh_rou_code%TYPE);


PROCEDURE INSERT_PROC(
  p_tdh_route_date          IN         temporary_route_date_headers.tdh_route_date%TYPE,
  p_tdh_rou_code            IN         temporary_route_date_headers.tdh_rou_code%TYPE,
  p_tdh_route_trk_code      IN         temporary_route_date_headers.tdh_route_trk_code%TYPE           DEFAULT NULL,
  p_tdh_use_code            IN         temporary_route_date_headers.tdh_use_code%TYPE                 DEFAULT NULL,
  p_tdh_use_aide_code       IN         temporary_route_date_headers.tdh_use_aide_code%TYPE            DEFAULT NULL,
  p_tdh_route_loc_dock_code IN         temporary_route_date_headers.tdh_route_loc_dock_code%TYPE      DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_route_date_headers%ROWTYPE);

PROCEDURE INSERT_TDH_PROC(
	p_tdh_route_date					IN temporary_route_date_headers.tdh_route_date%TYPE,
	p_tdh_rou_code           	IN temporary_route_date_headers.tdh_rou_code%TYPE,
	p_tdh_route_trk_code     	IN temporary_route_date_headers.tdh_route_trk_code%TYPE DEFAULT NULL,
	p_tdh_use_code           	IN temporary_route_date_headers.tdh_use_code%TYPE DEFAULT NULL,
	p_tdh_use_aide_code      	IN temporary_route_date_headers.tdh_use_aide_code%TYPE DEFAULT NULL,
	p_tdh_route_loc_dock_code	IN temporary_route_date_headers.tdh_route_loc_dock_code%TYPE DEFAULT NULL
);

FUNCTION DOES_TDH_EXISTS_FUNC(
	p_tdh_route_date					IN temporary_route_date_headers.tdh_route_date%TYPE,
	p_tdh_rou_code           	IN temporary_route_date_headers.tdh_rou_code%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_TDH_EXTRA_INFO_FUNC(
	p_tdh_route_date					IN temporary_route_date_headers.tdh_route_date%TYPE,
	p_tdh_rou_code           	IN temporary_route_date_headers.tdh_rou_code%TYPE,
	p_tdh_route_trk_code     	OUT temporary_route_date_headers.tdh_route_trk_code%TYPE,
	p_tdh_use_code           	OUT temporary_route_date_headers.tdh_use_code%TYPE,
	p_tdh_use_aide_code      	OUT temporary_route_date_headers.tdh_use_aide_code%TYPE,
	p_tdh_route_loc_dock_code	OUT temporary_route_date_headers.tdh_route_loc_dock_code%TYPE
)
RETURN BOOLEAN;

END TDH_PACK;
/