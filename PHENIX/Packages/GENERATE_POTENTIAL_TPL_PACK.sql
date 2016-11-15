CREATE OR REPLACE PACKAGE phenix.GENERATE_POTENTIAL_TPL_PACK IS

--CSC2296 procédure presque identique à GENERATE_PICK_POTENTIEL_PROC mais qui rempli une table qui sert d'enquête seulement
FUNCTION INQUIRY_PICK_POTENTIEL_FUNC(
	p_date_livraison 		IN DATE,
	p_rou_type 					IN VARCHAR2,
	p_rou_code_from 		IN NUMBER,
	p_rou_code_to 			IN NUMBER,
	p_orphan 						IN NUMBER,
	p_cus_code 					IN NUMBER,
	p_whs_picking_code	IN VARCHAR2,		--ber1616
	p_whs_delivery_code	IN VARCHAR,			--ber1616
	p_use_language			IN VARCHAR2,		--ber678
	p_error_code 				OUT NUMBER,			--ber1436
	p_error_message 		OUT VARCHAR2		--ber1436
)
RETURN BOOLEAN;

--CSC2296 procédure presque identique à GENERATE_PICK_POTENTIEL_PROC mais qui rempli une table qui sert d'enquête seulement
FUNCTION INQUIRY_PICK_DETAILS_FUNC(
	p_date_livraison 		IN DATE,
	p_rou_type 					IN VARCHAR2,
	p_rou_code_from 		IN NUMBER,
	p_rou_code_to 			IN NUMBER,
	p_orphan 						IN NUMBER,
	p_cus_code 					IN NUMBER,
	p_whs_picking_code	IN VARCHAR2,		--ber1616
	p_whs_delivery_code	IN VARCHAR2,		--ber1616
	p_language					IN VARCHAR2 DEFAULT 'F',	--csc743
	p_error_code 				OUT NUMBER,			--ber1616
	p_error_message 		OUT VARCHAR2		--ber1616
)
RETURN BOOLEAN;

--CSC2296 procédure pour obtenir l'inventaire qu'on considère être disponible pour un produit demandé
--au moment qu'on est dans potentiel APICK en train de modifier les qté etc... (tient compte de la table temporaire des cueillettes potentielles)
--basé sur la procédure RESERVATION_PACK.GET_INV_APICK_AVAILABLE_PROC
PROCEDURE GET_INV_POTENTIAL_AVAIL_PROC (
	p_prd_code 				IN VARCHAR2,
	p_prd_definition 	IN VARCHAR2,
	p_available_qty 	OUT NUMBER,
	p_available_wght 	OUT NUMBER
);

END GENERATE_POTENTIAL_TPL_PACK;
/