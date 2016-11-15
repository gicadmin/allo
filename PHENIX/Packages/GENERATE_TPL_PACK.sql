CREATE OR REPLACE PACKAGE phenix.GENERATE_TPL_PACK IS

/* Traitement lors de la génération des routes de livraison */
/* Traitement lors de la génération des routes de livraison - uniquement si les cod invoiced sont inclus*/
/* Insère les pick potentiel dans la table temporary pick list */
/* Insère les pick dans la table temporary pick details */

FUNCTION AUTO_PICK_LIST_FUNC(
	p_coh_id 						IN NUMBER,
	p_immediacy_switch 	IN NUMBER,
	p_delivery_date 		IN DATE,
	p_user_code 				IN NUMBER,
	p_log_id						IN NUMBER DEFAULT NULL, --ber1069
	p_message					  OUT VARCHAR2, --message rempli juste lorsque RETURN = FALSE parce que PM_ORDER_MISSING_INFO
	p_langue					  IN VARCHAR2 DEFAULT 'F'
)
RETURN BOOLEAN;

--Cette procédure est appelée lors de la création des pick_lists. Elle insère des linges nécessaires de COD et les COT correspondants
--pour la gestion des caissons
--- BER725
FUNCTION PRINT_RAP_COUNTER_FUNC(
	p_coh_id 						IN NUMBER,
	p_whs_picking_code	IN VARCHAR2	--entrepot dans lequel on doit imprimer le rapport de préparation...
)
RETURN PLS_INTEGER;

PROCEDURE SUBSTITUTE_PRD_PROC(
	p_coh_id 							IN NUMBER,
	p_cod_line_number 		IN NUMBER,
	p_cod_order_type 			IN VARCHAR2,
	p_cod_pricing_source 	IN VARCHAR2,
	p_cus_code 						IN NUMBER,
	p_whs_picking_code		IN VARCHAR2,	--ber1436
	p_whs_delivery_code		IN VARCHAR2,	--ber1436
	p_prd_code 						IN VARCHAR2,
	p_fmt_code 						IN VARCHAR2,
	p_prd_substitution 		IN VARCHAR2,
	p_qty_fmt_code 				IN VARCHAR2,
	p_weight_fmt_code 		IN VARCHAR2,
	p_scale 							IN NUMBER,
	p_prd_substitued			OUT VARCHAR2,	--fre1531
	p_sub_definition			OUT VARCHAR2	--fre5131
);

FUNCTION GENERATE_PICK_POTENTIEL_FUNC(
	p_date_livraison 		IN DATE,
	p_rou_type 					IN VARCHAR2,  	--BER146
	p_rou_code_from 		IN NUMBER,
	p_rou_code_to 			IN NUMBER,
	p_orphan 						IN NUMBER,
	p_cus_code 					IN NUMBER,
	p_whs_picking_code	IN VARCHAR2,		--ber1436
	p_whs_delivery_code	IN VARCHAR2,		--ber1436
	p_use_language			IN VARCHAR2,		--ber1436
	p_error_code 				OUT NUMBER,			--ber1436
	p_error_message 		OUT VARCHAR2		--ber1436
)
RETURN BOOLEAN;

--csc4253 nouvelle fonction pour trouver la valeur approx en dollar d'une mission
FUNCTION FIND_DOLLAR_VALUE_FOR_PMH_FUNC(
	p_pmh_id IN NUMBER
)
RETURN NUMBER;

--CSC4253 Nouvelle procédure pour recalculer les variables SELECTED en tenant compte des conteneurs facturés
PROCEDURE UPDATE_TPL_SELECTED_PROC(
	p_whs_picking_code 	IN VARCHAR2,			--ber1436 on recalcul seulement les records des entrepots concernés
	p_whs_delivery_code IN VARCHAR2,			--ber1436 on recalcul seulement les records des entrepots concernés
	p_cus_code 					IN NUMBER DEFAULT NULL
);

FUNCTION GENERATE_PICK_DETAILS_FUNC(
	p_date_livraison 		IN DATE,
	p_rou_type 					IN VARCHAR2,
	p_rou_code_from 		IN NUMBER,
	p_rou_code_to 			IN NUMBER,
	p_orphan 						IN NUMBER,
	p_cus_code 					IN NUMBER,
	p_whs_picking_code	IN VARCHAR2,		--ber1436
	p_whs_delivery_code	IN VARCHAR2,		--ber1436
	p_use_language			IN VARCHAR2,		--ber678
	p_error_code 				OUT NUMBER,			--ber1436
	p_error_message 		OUT VARCHAR2		--ber1436
)
RETURN BOOLEAN;

FUNCTION INSERT_PLH_FUNC(	--ber303 enlever PLH_DATE_PRINTED (default SYSDATE sur la BD)
	p_plh_id 											IN NUMBER,
	p_plh_delivery_rou_code 			IN NUMBER,
	p_plh_cus_code 								IN NUMBER,
	p_plh_whs_picking_code				IN VARCHAR2,	--ber1436
	p_plh_whs_delivery_code				IN VARCHAR2,	--ber1436
	p_plh_use_code 								IN NUMBER,
	p_plh_date_generated 					IN DATE,
	p_plh_position 								IN NUMBER,
	p_plh_picker_use_code 				IN NUMBER,
	p_plh_include_in_route_switch IN NUMBER,
	p_plh_rou_type 								IN VARCHAR2
)
RETURN BOOLEAN;

PROCEDURE GENERATE_TEMP_SPEC_ORDER_PROC( --FRE1767
	p_coh_id 						IN NUMBER,
	p_cus_code 	        IN NUMBER
);

PROCEDURE GENERATE_PICK_LIST_PROC(
  p_jsc_id  IN  NUMBER
);

FUNCTION VALIDATE_POSITION_FUNC(
	p_position_to_validate 	IN NUMBER,
	p_rou_code							IN NUMBER,
	p_route_date						IN DATE,
	p_test_tpl_too					IN NUMBER,	--0 pour pas tester les TPL en cours, 1 pour les tester
	p_suggest_switch				IN NUMBER,	--0 si on ne veut pas de suggestion, 1 si on veut que le système nous suggère la position suivante
	p_from                  IN VARCHAR2,  --TPL pour les picklist ou TRO pour les routes
	p_position_suggested		OUT NUMBER
)
RETURN BOOLEAN;	--true si les position est OK

END GENERATE_TPL_PACK;
/