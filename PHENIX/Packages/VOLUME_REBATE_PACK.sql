CREATE OR REPLACE PACKAGE phenix.VOLUME_REBATE_PACK IS

--fonction pour trouver le montant de rabais volume avec moins de paramètres
FUNCTION GET_VOLUME_REBATE_FUNC (
	p_prd_code 						IN products.prd_code%TYPE,
	p_cus_code 						IN customers.cus_code%TYPE,
	p_cod_selling_retail 	IN customer_order_details.cod_selling_retail%TYPE,
  p_cod_royalty_amount  IN customer_order_details.cod_royalty_amount%TYPE   --MTP60
)
RETURN NUMBER;

--fonction pour trouver le montant de rabais volume avec tous les paramètres
FUNCTION GET_VOLUME_REBATE_FUNC (
	p_prd_code 						IN products.prd_code%TYPE,
	p_prd_pgr_code 				IN products.prd_pgr_code%TYPE,
	p_cus_code 						IN customers.cus_code%TYPE,
	p_cus_vrg_code 				IN customers.cus_vrg_code%TYPE,
	p_cod_selling_retail 	IN customer_order_details.cod_selling_retail%TYPE,
  p_cod_royalty_amount  IN customer_order_details.cod_royalty_amount%TYPE,  --MTP60
	p_vro_id							IN volume_rebate_objectives.vro_id%TYPE DEFAULT NULL	--BER886	ajouter un ID spécifique optionnel
)
RETURN NUMBER;

--USG519 fonction pour trouver le montant de rabais volume des DROP avec tous les paramètres
FUNCTION GET_DROP_VOLUME_REBATE_FUNC (
	p_ven_code 						IN NUMBER,
	p_cus_code 						IN NUMBER,
	p_cus_vrg_code 				IN NUMBER,
	p_total_sales_amount 	IN NUMBER,
	p_vro_id							IN NUMBER DEFAULT NULL
)
RETURN NUMBER;

END VOLUME_REBATE_PACK;
/