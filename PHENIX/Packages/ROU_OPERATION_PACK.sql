CREATE OR REPLACE PACKAGE phenix.ROU_OPERATION_PACK AS

PROCEDURE GET_DELIVERY_ROUTE_PROC(
  p_cus_code                    IN    customers.cus_code%TYPE,
  p_whs_delivery_code           IN    warehouses.whs_code%TYPE,
  p_delivery_date               IN    DATE,
  p_rou_type                    IN    routes.rou_type%TYPE,
  p_rou_code                    OUT   routes.rou_code%TYPE,
  p_rod_position                OUT   ROUTE_DATES.ROD_POSITION%TYPE);

PROCEDURE GET_DELIVERY_ROUTE_PROC(
  p_cus_code                    IN    customers.cus_code%TYPE,
  p_whs_delivery_code           IN    warehouses.whs_code%TYPE,
  p_from_route_code             IN    routes.rou_code%TYPE,
  p_to_route_code               IN    routes.rou_code%TYPE,
  p_delivery_date               IN    DATE,
  p_rou_type                    IN    routes.rou_type%TYPE,
  p_rou_code                    OUT   routes.rou_code%TYPE,
  p_rod_position                OUT   ROUTE_DATES.ROD_POSITION%TYPE);

FUNCTION IS_SCHEDULE_FOR_DELIVERY_FUNC (
  p_cus_code                    IN    customers.cus_code%TYPE,
  p_from_route_code             IN    routes.rou_code%TYPE,
  p_to_route_code               IN    routes.rou_code%TYPE,
  p_delivery_date               IN    DATE,
  p_rou_type                    IN    routes.rou_type%TYPE
) RETURN BOOLEAN;

FUNCTION IS_SCHEDULE_FOR_DELIVERY_FUNC (
  p_cus_code                    IN    customers.cus_code%TYPE,
  p_whs_delivery_code           IN    warehouses.whs_code%TYPE,
  p_from_route_code             IN    routes.rou_code%TYPE,
  p_to_route_code               IN    routes.rou_code%TYPE,
  p_delivery_date               IN    DATE,
  p_rou_type                    IN    routes.rou_type%TYPE
) RETURN BOOLEAN;

FUNCTION IS_SCHEDULE_FOR_DELIVERY_FUNC (
  p_cus_code                    IN    customers.cus_code%TYPE,
  p_whs_delivery_code           IN    warehouses.whs_code%TYPE,
  p_delivery_date               IN    DATE,
  p_rou_type                    IN    routes.rou_type%TYPE
) RETURN BOOLEAN;

FUNCTION IS_ORPHAN_FUNC(
  p_cus_code                    IN    customers.cus_code%TYPE,
  p_whs_delivery_code           IN    warehouses.whs_code%TYPE,
  p_delivery_date               IN    DATE,
  p_rou_type                    IN    routes.rou_type%TYPE
) RETURN BOOLEAN;

PROCEDURE GET_ROUTE_INFOS_PROC(
  p_rou_code         IN  routes.rou_code%TYPE,
  p_rgc_code         OUT route_grouping_codes.rgc_code%TYPE,
  p_rgc_desc         OUT route_grouping_codes.rgc_description%TYPE,
  p_temp_dock        OUT routes.rou_default_loc_dock_code%TYPE,
  p_temp_trk         OUT routes.rou_trk_code%TYPE,
  p_lang             IN  VARCHAR2);

PROCEDURE GET_INFO_ROUTE_PROC(
  p_rou_code  IN   routes.rou_code%TYPE,
  p_language  IN   VARCHAR2,
  p_rou_day   OUT  routes.rou_day%TYPE,
  p_desc      OUT  routes.rou_description%TYPE,
  p_day       OUT  VARCHAR2,
  p_rou_type  OUT  routes.ROU_TYPE%TYPE
);

FUNCTION GET_NEXT_DELIVERY_DATE_FUNC(
  p_cus_code           IN customers.cus_code%TYPE,
  p_start_date         IN DATE,
  p_delivery_type_flag IN customer_order_headers.coh_delivery_type_flag%TYPE
) RETURN DATE;

FUNCTION VALIDATE_DELIVERY_DATE_FUNC(
  p_cus_code                   IN customers.cus_code%TYPE,
  p_entered_delivery_date      IN DATE,
  p_delivery_type_flag         IN customer_order_headers.coh_delivery_type_flag%TYPE,
  p_next_customer_route_switch IN NUMBER DEFAULT 0
) RETURN BOOLEAN;

FUNCTION PRINT_FEUILLE_ROUTE_FUNC(
  p_use_code                    IN users.use_code%TYPE,
  p_pro_name                    IN programs.pro_name%TYPE,
  p_rdh_route_date              IN route_date_headers.rdh_route_date%TYPE,
  p_rdh_rou_code                IN route_date_headers.rdh_rou_code%TYPE,
  p_rech_rou_whs_delivery_code  IN routes.rou_whs_delivery_code%TYPE,
  p_language                    IN VARCHAR2
) RETURN VARCHAR2;

FUNCTION PRINT_ROUTE_SHORT_FUNC(
  p_use_code                    IN users.use_code%TYPE,
  p_pro_name                    IN programs.pro_name%TYPE,
  p_rdh_route_date              IN route_date_headers.rdh_route_date%TYPE,
  p_rdh_rou_code                IN route_date_headers.rdh_rou_code%TYPE,
  p_language                    IN VARCHAR2
) RETURN VARCHAR2;

FUNCTION EXIST_PMO_FUNC(
  p_rou_pmo_code  IN routes.rou_pmo_code%TYPE
) RETURN BOOLEAN;

FUNCTION FIND_ROU_DATE_FUNC(
  p_rou_code IN routes.rou_code%TYPE
)
RETURN DATE;

END ROU_OPERATION_PACK;
/