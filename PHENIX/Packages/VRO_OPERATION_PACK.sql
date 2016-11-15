CREATE OR REPLACE PACKAGE phenix.VRO_OPERATION_PACK IS

--USG519 fonction pour trouver le montant de rabais volume des DROP avec tous les paramètres
FUNCTION GET_DROP_VOL_REB_KNOWN_ID_FUNC(
	p_ven_code 						IN NUMBER,
	p_sales_amount 				IN NUMBER,
	p_vro_id							IN NUMBER
)
RETURN NUMBER;

--USG519 fonction pour trouver le montant de rabais volume des DROP avec tous les paramètres
FUNCTION GET_DROP_VOL_REB_FUNC(
	p_ven_code 						IN NUMBER,
	p_cus_vrg_code 				IN NUMBER,
	p_total_sales_amount 	IN NUMBER,
	p_vro_id							IN NUMBER DEFAULT NULL
)
RETURN NUMBER;

--fonction pour trouver le montant de rabais volume avec tous les paramètres
FUNCTION GET_VOL_REBATE_KNOWN_ID_FUNC (
	p_prd_pgr_code 				IN NUMBER,
	p_cod_selling_retail 	IN NUMBER,
	p_vro_id							IN NUMBER, 	--BER886	ajouter un ID spécifique optionnel
	p_prd_ven_code 				IN NUMBER DEFAULT NULL --mtp155
)
RETURN NUMBER;

--fonction pour trouver le montant de rabais volume avec tous les paramètres
FUNCTION GET_VOLUME_REBATE_FUNC (
	p_cus_vrg_code 				IN customers.cus_vrg_code%TYPE,
	p_prd_pgr_code 				IN products.prd_pgr_code%TYPE,
	p_cod_selling_retail 	IN customer_order_details.cod_selling_retail%TYPE,
  p_cod_royalty_amount  IN customer_order_details.cod_royalty_amount%TYPE,  --MTP60
	p_prd_ven_code 				IN products.prd_ven_code%TYPE,  --mtp155
	p_vro_id							IN volume_rebate_objectives.vro_id%TYPE	DEFAULT NULL --BER886	ajouter un ID spécifique optionnel
)
RETURN NUMBER;

--fonction pour trouver le montant de rabais volume quand on n'a pas le groupe produit, ni la grille rabais volume du client
FUNCTION GET_VOL_REB_MISSING_INFO_FUNC (
	p_prd_code 						IN products.prd_code%TYPE,
	p_cus_code 						IN customers.cus_code%TYPE,
	p_cod_selling_retail 	IN customer_order_details.cod_selling_retail%TYPE,
  p_cod_royalty_amount  IN customer_order_details.cod_royalty_amount%TYPE     --MTP60
)
RETURN NUMBER;

--fonction pour trouver le montant de rabais volume avec tous les paramètres
--si c'est un montant... on le multiplie déjà par la quantité/poids en paramètre
--si c'est un pourcentage... on le multiplie déjà par le PRIX TOTAL passé en paramètre
--fonction utilisé, pour l'instant... par RAP_ANALYSE et RAP_TENDANCE
FUNCTION GET_VOLUME_REB_FOR_REPORT_FUNC (
	p_prd_pgr_code 				IN products.prd_pgr_code%TYPE,
	p_prd_definition			IN products.prd_definition%TYPE,
	p_cod_sum_qty         IN NUMBER,
 	p_cod_sum_wght        IN NUMBER,
 	p_cod_selling_retail 	IN customer_order_details.cod_selling_retail%TYPE,
	p_vro_id							IN volume_rebate_objectives.vro_id%TYPE,
  p_cod_royalty_amount  IN customer_order_details.cod_royalty_amount%TYPE,    --MTP60
	p_prd_ven_code 				IN products.prd_ven_code%TYPE   --mtp155
)
RETURN NUMBER;

FUNCTION GET_VOL_REBATE_PGR_FUNC (
	p_prd_pgr_code 				IN NUMBER,
	p_cod_selling_retail 	IN NUMBER,
	p_vro_id							IN NUMBER
)
RETURN NUMBER;

FUNCTION GET_VOL_REB_PGR_FOR_REPOR_FUNC (
	p_prd_pgr_code 				IN products.prd_pgr_code%TYPE,
	p_prd_definition			IN products.prd_definition%TYPE,
	p_cod_sum_qty         IN NUMBER,
 	p_cod_sum_wght        IN NUMBER,
 	p_cod_selling_retail 	IN customer_order_details.cod_selling_retail%TYPE,
	p_vro_id							IN volume_rebate_objectives.vro_id%TYPE,
  p_cod_royalty_amount  IN customer_order_details.cod_royalty_amount%TYPE
)
RETURN NUMBER;

FUNCTION FIND_FULL_OBJ_REACHED_FUNC(
  p_vrg_code                IN volume_rebate_objectives.vro_vrg_code%TYPE,
  p_amount_sales_per_year     IN NUMBER,
  p_vro_record              OUT volume_rebate_objectives%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION FIND_OBJECTIVE_REACHED_FUNC(
  p_vrg_code                IN volume_rebate_objectives.vro_vrg_code%TYPE,
  p_amount_sales_per_year     IN NUMBER
)
RETURN NUMBER; --retourne un VRO_ID de l'objectif atteint

FUNCTION FIND_FIRST_OBJECTIVE_FUNC(
  p_vrg_code IN volume_rebate_objectives.vro_vrg_code%TYPE
)
RETURN NUMBER; --retourne un VRO_ID de l'objectif atteint;

FUNCTION EXISTS_OBJECTIVE_AMOUNT_FUNC(
  p_vrg_code               IN volume_rebate_grids.vrg_code%TYPE,
  p_vro_objective_amount   IN volume_rebate_objectives.vro_objective_amount%TYPE
)
RETURN BOOLEAN;

END VRO_OPERATION_PACK;
/