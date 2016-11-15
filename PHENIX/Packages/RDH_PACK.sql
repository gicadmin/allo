CREATE OR REPLACE PACKAGE phenix.RDH_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  route_date_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rdh_route_date                 IN         route_date_headers.rdh_route_date%TYPE,
  p_rdh_rou_code                   IN         route_date_headers.rdh_rou_code%TYPE,
  p_rdh_rec                        OUT NOCOPY route_date_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_rdh_route_date                 IN         route_date_headers.rdh_route_date%TYPE,
  p_rdh_rou_code                   IN         route_date_headers.rdh_rou_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rdh_route_date                 IN         route_date_headers.rdh_route_date%TYPE,
  p_rdh_rou_code                   IN         route_date_headers.rdh_rou_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rdh_route_date                 IN         route_date_headers.rdh_route_date%TYPE,
  p_rdh_rou_code                   IN         route_date_headers.rdh_rou_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rdh_route_date                 IN         route_date_headers.rdh_route_date%TYPE,
  p_rdh_rou_code                   IN         route_date_headers.rdh_rou_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rdh_route_date                 IN         route_date_headers.rdh_route_date%TYPE,
  p_rdh_rou_code                   IN         route_date_headers.rdh_rou_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rdh_route_date          IN         route_date_headers.rdh_route_date%TYPE,
  p_rdh_rou_code            IN         route_date_headers.rdh_rou_code%TYPE,
  p_rdh_status              IN         route_date_headers.rdh_status%TYPE,
  p_rdh_route_loc_dock_code IN         route_date_headers.rdh_route_loc_dock_code%TYPE      DEFAULT NULL,
  p_rdh_use_code            IN         route_date_headers.rdh_use_code%TYPE                 DEFAULT NULL,
  p_rdh_use_aide_code       IN         route_date_headers.rdh_use_aide_code%TYPE            DEFAULT NULL,
  p_rdh_route_trk_code      IN         route_date_headers.rdh_route_trk_code%TYPE           DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY route_date_headers%ROWTYPE);

FUNCTION GET_FULL_RDH_FUNC(
	p_rdh_route_date  IN route_date_headers.rdh_route_date%TYPE,
	p_rdh_rou_code    IN route_date_headers.rdh_rou_code%TYPE,
	p_rdh_record			OUT route_date_headers%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_RDH_FUNC(
	p_rdh_route_date  IN route_date_headers.rdh_route_date%TYPE,
	p_rdh_rou_code    IN route_date_headers.rdh_rou_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE INSERT_RDH_PROC(
	p_rdh_route_date         	IN route_date_headers.rdh_route_date%TYPE,
	p_rdh_rou_code           	IN route_date_headers.rdh_rou_code%TYPE,
	p_rdh_status             	IN route_date_headers.rdh_status%TYPE,
	p_rdh_route_loc_dock_code	IN route_date_headers.rdh_route_loc_dock_code%TYPE,
	p_rdh_route_trk_code     	IN route_date_headers.rdh_route_trk_code%TYPE,
	p_rdh_use_code           	IN route_date_headers.rdh_use_code%TYPE,
	p_rdh_use_aide_code      	IN route_date_headers.rdh_use_aide_code%TYPE
);

PROCEDURE UPDATE_RDH_PROC(
	p_rdh_route_date         	IN route_date_headers.rdh_route_date%TYPE,
	p_rdh_rou_code           	IN route_date_headers.rdh_rou_code%TYPE,
	p_rdh_route_loc_dock_code	IN route_date_headers.rdh_route_loc_dock_code%TYPE,
	p_rdh_route_trk_code     	IN route_date_headers.rdh_route_trk_code%TYPE,
	p_rdh_use_code           	IN route_date_headers.rdh_use_code%TYPE,
	p_rdh_use_aide_code      	IN route_date_headers.rdh_use_aide_code%TYPE
);

PROCEDURE INSERT_OR_UPDATE_RDH_PROC(
	p_rdh_route_date         	IN route_date_headers.rdh_route_date%TYPE,
	p_rdh_rou_code           	IN route_date_headers.rdh_rou_code%TYPE,
	p_rdh_status             	IN route_date_headers.rdh_status%TYPE,	--sert à INSERT, mais pas lors du update
	p_rdh_route_loc_dock_code	IN route_date_headers.rdh_route_loc_dock_code%TYPE,
	p_rdh_route_trk_code     	IN route_date_headers.rdh_route_trk_code%TYPE,
	p_rdh_use_code           	IN route_date_headers.rdh_use_code%TYPE,
	p_rdh_use_aide_code      	IN route_date_headers.rdh_use_aide_code%TYPE
);

PROCEDURE UPDATE_RDH_STATUS_PROC(
	p_rdh_route_date         	IN route_date_headers.rdh_route_date%TYPE,
	p_rdh_rou_code           	IN route_date_headers.rdh_rou_code%TYPE,
	p_rdh_status             	IN route_date_headers.rdh_status%TYPE
);

FUNCTION DOES_RDH_EXISTS_FUNC(
	p_rdh_route_date         	IN route_date_headers.rdh_route_date%TYPE,
	p_rdh_rou_code           	IN route_date_headers.rdh_rou_code%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_DOCK_FUNC(
	p_rdh_route_date         	IN route_date_headers.rdh_route_date%TYPE,
	p_rdh_rou_code           	IN route_date_headers.rdh_rou_code%TYPE
)
RETURN VARCHAR2;

FUNCTION FIND_TRK_FUNC(
	p_rdh_route_date         	IN route_date_headers.rdh_route_date%TYPE,
	p_rdh_rou_code           	IN route_date_headers.rdh_rou_code%TYPE
)
RETURN VARCHAR2;


END RDH_PACK;
/