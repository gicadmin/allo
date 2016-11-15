CREATE OR REPLACE PACKAGE phenix.TOM_OPERATION_PACK IS

FUNCTION CREATE_TOM_FUNC(
	p_ctr_identifiers_switch	IN NUMBER,
	p_rou_code 								IN NUMBER,			--sera null pour les identifiant et les transit
	p_route_date							IN DATE,
	p_whs_picking_code 				IN VARCHAR2,
	p_whs_delivery_code				IN VARCHAR2,
	p_cus_code 								IN NUMBER,			--sera rempli pour les identifiants seulement
	p_possession_hour					IN NUMBER,			--sera rempli pour les identifiant seulement
	p_possession_minute				IN NUMBER,			--sera rempli pour les identifiant seulement
	p_language								IN VARCHAR2,
	p_error_message						OUT VARCHAR2
)
RETURN BOOLEAN;

FUNCTION UPDATE_FROM_TOM_FUNC(
	p_whs_picking_code 	IN VARCHAR2,
	p_language					IN VARCHAR2,
	p_error_code				OUT NUMBER,
	p_error_message			OUT VARCHAR2
)
RETURN PLS_INTEGER;

END TOM_OPERATION_PACK;
/