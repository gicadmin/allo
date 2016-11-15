CREATE OR REPLACE PACKAGE phenix.VENDOR_DISCOUNTS_PACK IS

--fonction appellé par ENTER_DROP_SHIP_ORDERS
FUNCTION GET_VDI_FOR_CDD_FUNC(
	p_ven_code 						IN 	NUMBER,
	p_prd_code 						IN 	VARCHAR2,
	p_fmt_code 						IN 	VARCHAR2,	--format dans lequel la ligne de drop est faite
	p_price 							IN 	NUMBER
)
RETURN NUMBER;

/* procédure utilisé pour inseré un purchase order discounts précis (appellé par UPDATE_PURCHASE_DISCOUNT_PROC) */
PROCEDURE INSERT_PDI_PROC(
	p_dit_code 										IN 	NUMBER,
	p_poh_id 											IN 	NUMBER,
	p_line_number 								IN 	NUMBER,
	p_cost_affected 							IN 	NUMBER,
	p_rebill_switch 							IN 	NUMBER,
	p_amount 											IN 	NUMBER,
	p_percent 										IN 	NUMBER,
	p_affect_match								IN 	NUMBER,		--fre654
	p_ven_code										IN 	NUMBER,		--fre879
	p_ven_to_pay_code							IN 	NUMBER,		--fre879
	p_vdi_qualifier								IN 	VARCHAR,	--csc772
	p_pdi_skip_invoicing_switch		IN 	VARCHAR		--USG808
);

--procédure utilisée pour copier les PDI d'une réservation pige, vers la ligne de commande qui pige dans la réservation
--afin que les 2 lignes aient accès exactement aux même PDI
PROCEDURE INSERT_UNIQUE_PDI_PROC(
	p_pod_poh_id 					IN 	NUMBER,	--numéro de POH qu'on est en train de créer (la pige)
	p_pod_line_number 		IN 	NUMBER,	--numéro de ligne du POD qu'on est en train de créer (la pige)
	p_pod_pod_poh_id 			IN 	NUMBER,	--numéro du POH de réservation qu'on a déjà créer un joue quelconque (POH prebook)
	p_pod_pod_line_number IN 	NUMBER	--numéro de ligne du POH de réservation qu'on a déjà créer un joue quelconque (POH prebook)
);

/* procédure qui créer des purchase_order_discounts à la création du POD selon les vendor_discounts existant à ce moment 	*/
PROCEDURE UPDATE_PURCHASE_DISCOUNT_PROC(
	p_ven_code 							IN 	NUMBER,							--code du fournisseur chez qui on achète
	p_poh_id 								IN 	NUMBER,							--code du PO qu'on est en train de créer
	p_pod_line_number 			IN 	NUMBER,							--code de la ligne pour laquelle on veut les discounts (NULL si on veut pour tout le PO)
	p_vpd_code 							IN 	VARCHAR2,						--code du vendor_products (NULL si c'est pour tout le PO)
	p_vcg_id 								IN 	NUMBER,							--csc772 code de la catégorie de produit (NULL si c'est pour tout le PO)
	p_pod_pod_poh_id 				IN 	NUMBER, 							--code de la réservation dans laquelle on pige si c'est le cas (NULL si c'est pour tout le PO)
	p_pod_pod_line_number 	IN 	NUMBER 							--code de la ligne de réservation dans laquelle on pige si c'est le cas (NULL si c'est pour tout le PO)
);

PROCEDURE GET_DISCOUNT_POD_PROC(		--csc1171 changer de nom, avant elle sappellait GET_DISCOUNT_COD_PROC
	p_poh_id								IN 	NUMBER,
	p_pod_line_number 			IN 	NUMBER,
	p_cost_price 						IN 	NUMBER,
	p_match_before_discount	IN  NUMBER,	--csc1171
	p_discount_1 						OUT NUMBER,
	p_discount_2 						OUT NUMBER,
	p_discount_3 						OUT NUMBER,
	p_discount_4 						OUT NUMBER,
	p_match_discount 				OUT NUMBER		--fre654
);

PROCEDURE GET_DISCOUNT_VPD_PROC(
	p_ven_code 							IN 	NUMBER,
	p_vpd_code 							IN 	VARCHAR2,
	p_vcg_id	 							IN 	NUMBER,	--csc772
	p_cost_price 						IN 	NUMBER,
	p_match_before_discount	IN  NUMBER,	--csc1171
	p_discount_cost_1 			OUT NUMBER,
	p_discount_cost_2 			OUT NUMBER,
	p_discount_cost_3 			OUT NUMBER,
	p_discount_cost_4 			OUT NUMBER,
	p_match_discount 				OUT NUMBER	--fre654
);

/*FRE879 fonction utilisé dans PO_DETAIL_COST.fmb pour montré, dans la lov, seulement des vendor_discounts qui seront appliqué
	c'est à dire, un par type, par fournisseur qui vend le produit...
	Aussi utilisé dans ce package pour valider les discounts avant de les calculer ou insérer */
FUNCTION VALIDATE_VDI_FUNC(		--fre879
	p_ven_code 			IN 	NUMBER,							--code du fournisseur chez qui on achète
	p_prd_code			IN 	VARCHAR2,
	p_vpd_code 			IN 	VARCHAR2,						--code du vendor_products
	p_vcg_id	 			IN 	NUMBER,							--code de la catégorie de produit csc772
	p_vdi_id				IN  NUMBER,
	p_vdi_ven_code	IN 	NUMBER,
	p_dit_code			IN 	NUMBER			--csc772 on envoie le type descompte en plus
)
RETURN NUMBER;

--csc1171 fonction utilisée dans POPUP_PURCHASE_ORDER_DISCOUNTS lorsqu'on modifie des escomptes (INVOICE_MATCHING)
FUNCTION GET_DISCOUNT_AFFECT_MATCH_FUNC(
	p_poh_id						IN 	NUMBER,
	p_pod_line_number 	IN 	NUMBER,
	p_cost_price 				IN 	NUMBER,
	p_cost_excluded			IN  NUMBER DEFAULT  NULL,		--pour exclure les discounts dun des coutant spécifique
	p_manual_discount		IN 	NUMBER DEFAULT 0	--montant du discount exclu calculé manuellement en dehors de la procédure
)
RETURN NUMBER;

--csc1171 fonction utilisée dans POPUP_PURCHASE_ORDER_DISCOUNTS lorsqu'on modifie des escomptes (INVOICE_MATCHING)
PROCEDURE GET_DISCOUNT_PDI_SPECIAL_PROC	(
	p_poh_id								IN 	NUMBER,
	p_pod_line_number 			IN 	NUMBER,
	p_cost_price 						IN 	NUMBER,
	p_match_cost						IN  NUMBER,	--csc1171
	p_cost_excluded			 		IN  NUMBER, 	--pour exclure les discounts dun des coutant spécifique
	p_excluded_discount			IN 	NUMBER, 	--montant du discount exclu calculé manuellement en dehors de la procédure
	p_discount_1 						OUT NUMBER,
	p_discount_2 						OUT NUMBER,
	p_discount_3 						OUT NUMBER,
	p_discount_4 						OUT NUMBER
);

END VENDOR_DISCOUNTS_PACK;

 
/