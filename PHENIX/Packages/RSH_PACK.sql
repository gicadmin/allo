CREATE OR REPLACE PACKAGE phenix.RSH_PACK IS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  route_shipments%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rsh_id                         IN         route_shipments.rsh_id%TYPE,
  p_rsh_rec                        OUT NOCOPY route_shipments%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_rsh_id                         IN         route_shipments.rsh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rsh_id                         IN         route_shipments.rsh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rsh_id                         IN         route_shipments.rsh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rsh_id                         IN         route_shipments.rsh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rsh_id                         IN         route_shipments.rsh_id%TYPE);


FUNCTION INSERT_FUNC(
  p_rsh_open_switch         IN         route_shipments.rsh_open_switch%TYPE,
  p_rsh_shipment_type       IN         route_shipments.rsh_shipment_type%TYPE,
  p_rsh_trk_code            IN         route_shipments.rsh_trk_code%TYPE,
  p_rsh_start_date          IN         route_shipments.rsh_start_date%TYPE,
  p_rsh_rdh_route_date      IN         route_shipments.rsh_rdh_route_date%TYPE,
  p_rsh_whs_code            IN         route_shipments.rsh_whs_code%TYPE,
  p_rsh_created_by_use_code IN         route_shipments.rsh_created_by_use_code%TYPE,
  p_rsh_end_date            IN         route_shipments.rsh_end_date%TYPE                 DEFAULT NULL,
  p_rsh_rdh_rou_code        IN         route_shipments.rsh_rdh_rou_code%TYPE             DEFAULT NULL,
  p_rsh_rgc_code            IN         route_shipments.rsh_rgc_code%TYPE                 DEFAULT NULL,
  p_rsh_closed_by_use_code  IN         route_shipments.rsh_closed_by_use_code%TYPE       DEFAULT NULL,
  p_rsh_tkc_code            IN         route_shipments.rsh_tkc_code%TYPE                 DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY route_shipments%ROWTYPE)
RETURN NUMBER;

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION GET_FULL_RSH_BY_ID_FUNC(
	p_rsh_id 			IN route_shipments.rsh_id%TYPE,
	p_rsh_record	OUT route_shipments%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_RSH_FUNC(
	p_rsh_id 			IN route_shipments.rsh_id%TYPE
)
RETURN BOOLEAN;

PROCEDURE UPDATE_RSH_RGC_PROC(
	p_rsh_id   			IN route_shipments.rsh_id%TYPE,
	p_rsh_rgc_code  IN route_shipments.rsh_rgc_code%TYPE
);

PROCEDURE CLOSE_RSH_PROC(
	p_rsh_id   								IN route_shipments.rsh_id%TYPE,
	p_rsh_closed_by_use_code	IN route_shipments.rsh_closed_by_use_code%TYPE
);

FUNCTION IS_ROUTE_BEING_CHARGED_FUNC(
	p_rsh_rdh_rou_code IN route_shipments.rsh_rdh_rou_code%TYPE,
	p_rsh_rdh_route_date 	IN route_shipments.rsh_rdh_route_date%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_ROUTE_FINISHED_FUNC(
	p_rsh_rdh_rou_code IN route_shipments.rsh_rdh_rou_code%TYPE,
	p_rsh_rdh_route_date 	IN route_shipments.rsh_rdh_route_date%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_FULL_RT_BEING_CHARGED_FUNC(
	p_rsh_rdh_rou_code     IN route_shipments.rsh_rdh_rou_code%TYPE,
	p_rsh_rdh_route_date 	 IN route_shipments.rsh_rdh_route_date%TYPE,
  p_rsh_record           OUT route_shipments%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION GET_FULL_TK_BEING_CHARGED_FUNC(
	p_rsh_rgc_code        IN route_shipments.rsh_rgc_code%TYPE,
  p_rsh_whs_code        IN route_shipments.rsh_whs_code%TYPE,
	p_rsh_rdh_route_date  IN route_shipments.rsh_rdh_route_date%TYPE,
  p_rsh_trk_code        IN route_shipments.rsh_trk_code%TYPE,
  p_rsh_record          OUT route_shipments%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION IS_OTHER_TRUCK_OPENED_FUNC(
	p_rsh_rgc_code        IN route_shipments.rsh_rgc_code%TYPE,
  p_rsh_whs_code        IN route_shipments.rsh_whs_code%TYPE,
	p_rsh_rdh_route_date  IN route_shipments.rsh_rdh_route_date%TYPE,
  p_rsh_trk_code        IN route_shipments.rsh_trk_code%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_SHIPMENT_OPENED_FUNC(
	p_rsh_id IN route_shipments.rsh_id%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_RSH_ID_FOR_ROUTE_FUNC(
  p_rsh_rdh_rou_code     IN route_shipments.rsh_rdh_rou_code%TYPE,
	p_rsh_rdh_route_date 	 IN route_shipments.rsh_rdh_route_date%TYPE
)
RETURN NUMBER;

-- Vérifie si un chargement ouvert existe pour le regroupement spécifié
FUNCTION IS_RSH_OPENED_FOR_RGC_FUNC(
  p_rsh_rgc_code IN  route_shipments.rsh_rgc_code%TYPE,
  p_rsh_id       OUT route_shipments.rsh_id%TYPE
)
RETURN BOOLEAN;

END RSH_PACK;
/