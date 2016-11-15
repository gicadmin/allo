CREATE OR REPLACE PACKAGE phenix.PRODUCT_PACK IS
/*
*  GIMAT		 DATE			  AUTEUR	DESCRIPTION
* -------	----------	---------	-----------------------------------------
* EFE70   21-09-2011  Mawuko    Enlever la fonction GET_CONSIGNMENT_FUNC
*/

--fonction pour trouver le rapport de conversion entre deux formats d'un même produit
FUNCTION FORMAT_CONVERSION_FUNC(
	p_sprdcode 			IN	VARCHAR2,
	p_sfromfmtcode 	IN	VARCHAR2,
	p_stofmtcode 		IN	VARCHAR2
)
RETURN NUMBER;

--fonction pour trouver quel est le poids d'un format solide (pour les produits D/B)
--la valeur retournée est selon le format d'inventaire pesé du produit (ex : kg/lb/gr)
FUNCTION FROM_KG_TO_WEIGHTED_INV_FUNC(
  p_prd_code 				IN VARCHAR2,
  p_fmt_solid_code 	IN VARCHAR2
)
RETURN NUMBER;

FUNCTION EXTRACT_LEVEL_GROUP_FUNC(
	p_npgr_code IN NUMBER
)
RETURN NUMBER;

FUNCTION GET_PRODUCT_FORMAT_TYPE_FUNC(
	p_prd_code IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_PRODUCT_FORMAT_TYPE_FUNC(
	p_scale 	IN NUMBER,
	p_solid 	IN VARCHAR2,
	p_weight 	IN VARCHAR2
)
RETURN VARCHAR2;

--Note : La procédure UPDATE_STAT_SUMMARIES_PROC est une procédure servant à remplir les tables de statistiques
--				une fois que le load des commandes clients, facture et note de crédit a été fait...
--			 Elle n'est appellé de nul part, donc pour servir, elle devrait être appellé par nous directement
--				dans SQL....  juste après le load initial..
PROCEDURE UPDATE_STAT_SUMMARIES_PROC;

PROCEDURE UPDATE_STATS_PROC(
	product_code 					IN VARCHAR2,
	pricing_source 				IN VARCHAR2,
	cost_price 						IN NUMBER,          --le coutant total de la ligne (coutant * (qté ou poids))
	sale_price 						IN NUMBER,          --le vendant total de la ligne (vendant * (qté ou poids))
	invoice_quantity 			IN NUMBER,    --la quantité facturé déjà converti en format dinventaire solide
	invoice_weight 				IN NUMBER,      --le poids facturé déjà converti en format d'inventaire pesé s'il y a lieu (seul les produit VRAC 'F' doivent être converti)
	lost_quantity 				IN NUMBER,        --quantité perdue déjà converti en format dinventaire solide
	lost_weight 					IN NUMBER,          --le poids facturé déjà converti en format d'inventaire pesé s'il y a lieu (voir commentaire précédent)
	promotion_type_code 	IN NUMBER,
	p_date 								IN DATE,
	p_inventory_switch 		IN NUMBER,
	p_whs_code            IN VARCHAR2,  --BER1463
	p_do_commit 					IN BOOLEAN := TRUE
);

PROCEDURE UPDATE_VEN_STATS_PROC(
	p_inh_id 						IN NUMBER,
	p_do_commit_switch 	IN NUMBER DEFAULT 1	--cvi145
);

FUNCTION CHECK_DIGIT_FUNC(
	t_upc_code IN VARCHAR2
)
RETURN BOOLEAN;

PROCEDURE GET_PROFIT_RANGE_PROC(
	p_prd_code 								IN VARCHAR2,
	p_minimun_profit_percent 	OUT NUMBER,
	p_maximun_profit_percent 	OUT NUMBER
);

FUNCTION GET_PRD_SALES_FORMAT_FUNC(
  p_prd_code 		IN VARCHAR2,
  p_from 				IN NUMBER DEFAULT 1,
  p_to 					IN NUMBER DEFAULT 1,
  p_separateur	IN VARCHAR2 DEFAULT ''
)
RETURN VARCHAR2;

FUNCTION GET_PRD_SALES_FORMAT_FUNC(
  p_prd_code 					IN VARCHAR2,
  p_pgr_sales_format 	IN NUMBER,
  p_from 							IN NUMBER,
  p_to 								IN NUMBER,
  p_separateur 				IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_MAX_SALE_MULTIPLE(
	p_prd_code 	IN VARCHAR2,
	p_fmt_code 	IN VARCHAR2,
	p_value 		IN NUMBER
)
RETURN NUMBER;

FUNCTION CONVERT_BETWEEN_WEIGHTS_FUNC(
	p_fmt_initial IN VARCHAR2,
	p_fmt_final 	IN VARCHAR2
)
RETURN NUMBER;

--USG323 fonction qui vérifie si le montant de taxe sur les CIGARES
PROCEDURE CALCUL_CIGAR_TAX_PROC(
	p_prd_code 											IN VARCHAR2,
	p_fmt_code 											IN VARCHAR2,
	p_selling_retail 								IN NUMBER,
	p_current_tobacco_tax 					IN NUMBER,
	p_is_fed_taxable								IN NUMBER,	--0 ou 1
	p_prv_code											IN VARCHAR2,
	p_new_selling_retail						OUT NUMBER,
	p_new_tobacco_tax								OUT NUMBER,
	p_new_tobacco_markup_rate				OUT NUMBER,
	p_new_tobacco_tax_rate					OUT NUMBER,
	p_new_number_of_cigars 					OUT NUMBER,
	p_new_selling_before_tob_tax		OUT NUMBER,
	p_new_before_tob_tax_with_fed		OUT NUMBER,
	p_new_selling_bf_tob_per_cigar	OUT NUMBER,
	p_new_taxable_amount_per_cigar	OUT NUMBER,
	p_new_tobacco_tax_per_cigar 		OUT NUMBER
);

--USG323 fonction qui vérifie si le montant de taxe sur les CIGARES
--mais à partir dun taux de majoration etc déjà donnée (utile surtout lorsqu'il y a des overrides / valeurs entrées en retard ) Ex : drop details
PROCEDURE CALCUL_CIGAR_TAX_GVN_RATE_PROC(
	p_prd_code 											IN VARCHAR2,
	p_fmt_code 											IN VARCHAR2,
	p_selling_retail 								IN NUMBER,
	p_current_tobacco_tax 					IN NUMBER,
	p_is_fed_taxable								IN NUMBER,	--0 ou 1
	p_federal_tax_rate							IN NUMBER,	--taux de taxe déjà donné
	p_tobacco_markup_rate						IN NUMBER,	--markup rate déjà donné....
	p_tobacco_tax_rate							IN NUMBER,  --taux de taxe déjà donné...
	p_new_selling_retail						OUT NUMBER,
	p_new_tobacco_tax								OUT NUMBER,
	p_new_number_of_cigars 					OUT NUMBER,
	p_new_selling_before_tob_tax		OUT NUMBER,
	p_new_before_tob_tax_with_fed		OUT NUMBER,
	p_new_selling_bf_tob_per_cigar	OUT NUMBER,
	p_new_taxable_amount_per_cigar	OUT NUMBER,
	p_new_tobacco_tax_per_cigar 		OUT NUMBER
);

--USG323 fonction pour le calcul de la taxe tabac
FUNCTION FIND_SELLING_BEFORE_TOB_FUNC(
	p_selling_retail 					IN NUMBER,
	p_nb_of_cigars						IN NUMBER,
	p_prv_federal_tax 				IN NUMBER, --passer zéro si le produit n'est pas taxable au fédérale
	p_prv_tobacco_markup_rate IN NUMBER,
	p_prv_tobacco_tax_rate 		IN NUMBER
)
RETURN NUMBER;

FUNCTION FIND_FORMAT_FUNC(
  p_prd_code 					IN VARCHAR2,
  p_pgr_code 					IN NUMBER DEFAULT NULL,
  p_pgr_sales_format 	IN NUMBER DEFAULT NULL
)
RETURN VARCHAR2;

FUNCTION GET_MAX_QTY_PER_PALLET_FUNC(
	p_prd_code	IN VARCHAR2,
	p_fmt_code	IN VARCHAR2,
	p_whs_code	IN VARCHAR2	--ber1436
)
RETURN NUMBER;

FUNCTION GET_GREATEST_SELLABLE_FMT_FUNC( --CSC3036
  p_prd_code  IN VARCHAR2
)
RETURN VARCHAR2;

--GIC2217 fonction pour valider que la nouvelle conversion est un multiple de celles déjà existantes
FUNCTION VALIDATE_CONVERSION_FUNC(
	p_prd_code 								IN VARCHAR2,
	p_operation_flag 					IN VARCHAR2,
	p_conversion_to_validate 	IN NUMBER,
	p_fmt_code_to_validate		IN VARCHAR2 DEFAULT NULL
)
RETURN NUMBER;

PROCEDURE UPDATE_TMP_STATS_PROC(  --GIC3139
	p_product_code 					IN VARCHAR2,
	p_pricing_source 				IN VARCHAR2,
	p_cost_price 						IN NUMBER,          --le coutant total de la ligne (coutant * (qté ou poids))
	p_sale_price 						IN NUMBER,          --le vendant total de la ligne (vendant * (qté ou poids))
	p_invoice_quantity 			IN NUMBER,    --la quantité facturé déjà converti en format dinventaire solide
	p_invoice_weight 				IN NUMBER,      --le poids facturé déjà converti en format d'inventaire pesé s'il y a lieu
	p_lost_quantity 				IN NUMBER,        --quantité perdue déjà converti en format dinventaire solide
	p_lost_weight 					IN NUMBER,          --le poids facturé déjà converti en format d'inventaire pesé s'il y a lieu
	p_promotion_type_code 	IN NUMBER,
	p_date 								IN DATE,
	p_inventory_switch 		IN NUMBER,
	p_whs_code            IN VARCHAR2,
	p_do_commit 					IN BOOLEAN := TRUE
)
;

PROCEDURE MAJ_STATS_SUMMARIES_PROC(  --GIC3139
  p_jsc_id IN NUMBER);

END PRODUCT_PACK;
/