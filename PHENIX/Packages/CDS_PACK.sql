CREATE OR REPLACE PACKAGE phenix.CDS_PACK IS

--fonction appellé nul par pour l'instant.. calcul le coûtant des drops (en incluant les infos du fournisseur)
FUNCTION FIND_DROP_COMPLETE_COST_FUNC(
	p_cds_cost_amount      		IN NUMBER,
	p_cds_tobacco_tax      		IN NUMBER,
	p_cds_cigar_tax        		IN NUMBER,
	p_reference_number     		IN VARCHAR2,    --validera contre le CDS_... et le CDD_CDS...
	p_cus_code                IN NUMBER,        --validera contre le CDS_... et le CDD_CDS..
	p_vds_id                  IN NUMBER,            --validera contre le CDS_... et le CDD_CDS..
	p_vds_detailled_switch		IN NUMBER,
	p_ven_quart_drop_ship_avr IN NUMBER,
	p_ven_drop_terms       		IN NUMBER
)
RETURN NUMBER;

--GIC3566 mettre ce calcul en fonction pour éviter de rappeller plusieurs fois le même calcul (pour RAP_ANALYSE_PROFIT)
--calcul le coûtant des drop AVANT d'appliquer les infos du fournisseurs
FUNCTION FIND_DROP_COST_BEFORE_VEN_FUNC(
	p_cds_cost_amount      		IN NUMBER,
	p_cds_tobacco_tax      		IN NUMBER,
	p_cds_cigar_tax        		IN NUMBER,
	p_reference_number     		IN VARCHAR2,    --validera contre le CDS_... et le CDD_CDS...
	p_cus_code                IN NUMBER,        --validera contre le CDS_... et le CDD_CDS..
	p_vds_id                  IN NUMBER,            --validera contre le CDS_... et le CDD_CDS..
	p_vds_detailled_switch		IN NUMBER
)
RETURN NUMBER;

--GIC3566 recopier la fonction bassé sur FIND_DROP_DISCOUNTS_FUNC, mais en recevant déjà si c'est détaillé ou pas
FUNCTION FIND_DROP_DISC_KNOWN_DET_FUNC(
	p_reference_number 	IN VARCHAR2,	--validera contre le CDS_... et le CDD_CDS...
	p_cus_code 					IN NUMBER,		--validera contre le CDS_... et le CDD_CDS..
	p_vds_id 						IN NUMBER,			--validera contre le CDS_... et le CDD_CDS..
	p_details_switch		IN NUMBER
)
RETURN NUMBER;

END CDS_PACK;
 
/