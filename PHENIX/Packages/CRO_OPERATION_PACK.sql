CREATE OR REPLACE PACKAGE phenix.CRO_OPERATION_PACK IS

--trouver la position d'un client spécifique sur la route
FUNCTION FIND_CRO_POSITION_FUNC(
  p_cro_rou_code    IN customer_routes.cro_rou_code%TYPE,
  p_cro_cus_code    IN customer_routes.cro_cus_code%TYPE
)
RETURN NUMBER;
----------------------------------------------------------------------------------
FUNCTION RENUMEROTING_POSITION_FUNC (
  p_cro_rou_code  IN customer_routes.cro_rou_code%TYPE,
  p_intervalle    IN customer_routes.cro_position%TYPE
)
RETURN BOOLEAN;
----------------------------------------------------------------------------------
PROCEDURE COPY_PROC(
  p_from_rou_code  IN routes.rou_code%TYPE,
  p_to_rou_code    IN routes.rou_code%TYPE,
  p_to_rou_day     IN routes.rou_day%TYPE,
  p_to_rou_type    IN routes.rou_type%TYPE
);
 ----------------------------------------------------------------------------------
FUNCTION ASSIGN_SURCHARGE_FUNC(
  p_rou_code                ROUTES.ROU_CODE%TYPE,
  p_surcharge_amount        CUSTOMERS.cus_surcharge_per_delivery%TYPE)
RETURN NUMBER; -- Le nombre de clients affectes
----------------------------------------------------------------------------------
-- retourne 1 si on est en mode ajout et que la route existe pour le meme client
-- retourne 2 si la position de la meme route est utilisée par d'autre clients
-- retourne 0  si tout va bien : existe pas ni route ni position

FUNCTION DOES_CRO_EXIST_FUNC
 (p_rou_code  IN  routes.rou_code%TYPE,
  p_cus_code  IN  customers.cus_code%TYPE,
  p_rou_type  IN  routes.rou_type%TYPE,
  p_rou_day   IN  routes.rou_day%TYPE,
	p_mod				IN  VARCHAR2 DEFAULT 'I')

RETURN BOOLEAN;

FUNCTION EXIST_CUS_POSITION_FUNC
 (p_rou_code      IN  routes.rou_code%TYPE,
  p_cus_code      IN  customers.cus_code%TYPE,
  p_cro_position  IN  customer_routes.cro_position%TYPE,
  p_mod           IN  VARCHAR2 DEFAULT 'I')

RETURN BOOLEAN;

FUNCTION EXIST_CUS_CODE_FUNC(
  p_cro_cus_code  IN customer_routes.cro_cus_code%TYPE)

RETURN BOOLEAN;

PROCEDURE GET_INFO_ROUTE_PROC(
  p_rou_day                    IN  routes.rou_day%TYPE,
  p_cro_cus_code               IN  customer_routes.cro_cus_code%TYPE,
  p_rou_type                   IN  routes.rou_type%TYPE,
  p_language                   IN  VARCHAR2,
  p_cro_rou_code               OUT customer_routes.cro_rou_code%TYPE,
  p_desc                       OUT routes.rou_description%TYPE,
  p_cro_position               OUT customer_routes.cro_position%TYPE,
  p_rou_trk_code               OUT routes.rou_trk_code%TYPE,
  p_rou_default_loc_dock_code  OUT routes.rou_default_loc_dock_code%TYPE
);

FUNCTION GET_CUSTOMER_ROUTE_FUNC(
  p_cus_code    IN  customers.cus_code%TYPE,
  p_rou_day     IN  routes.rou_day%TYPE,
  p_rou_type    IN  routes.rou_type%TYPE,
  p_rou_type_2  IN  routes.rou_type%TYPE DEFAULT NULL
) RETURN routes%ROWTYPE;

PROCEDURE CHECK_QUICK_ROUTE_PROC(
  p_cro_cus_code IN customer_routes.cro_cus_code%TYPE
);

FUNCTION IS_ROU_ALREADY_USED_FUNC(
  p_rou_code  IN  routes.rou_code%TYPE
)RETURN BOOLEAN;

FUNCTION GET_INFO_ROUTE_FUNC(
  p_cus_code                   IN  customers.cus_code%TYPE,
  p_delivery_date              IN  DATE,
  P_rou_type                   IN  routes.rou_type%TYPE,
  p_rou_code                   OUT routes.rou_code%TYPE,
  p_rou_trk_code               OUT routes.rou_trk_code%TYPE,
  p_rou_default_loc_dock_code  OUT routes.rou_default_loc_dock_code%TYPE
)RETURN BOOLEAN;


END CRO_OPERATION_PACK;
/