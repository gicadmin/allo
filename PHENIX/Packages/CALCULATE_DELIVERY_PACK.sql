CREATE OR REPLACE PACKAGE phenix.CALCULATE_DELIVERY_PACK IS

FUNCTION CALCULATE_DELIVERY_FUNC(
	p_cus_code 						IN NUMBER,
	p_total_order_amount 	IN NUMBER
)
RETURN NUMBER;

--appel au calcul de frais quand on connait déjà plusieurs informations sur le client et le record dans control
--sert seulement à éviter de réappeller des curseur inutilement
FUNCTION CALCULATE_DELIVERY_INFO_FUNC(
	p_cus_code 										IN NUMBER,
	p_cus_dcg_code								IN NUMBER,
	p_cus_fsg_code								IN NUMBER,
	p_cus_surcharge_per_delivery	IN NUMBER,
	p_total_order_amount 					IN NUMBER,
	p_trt_current_fuel_price			IN NUMBER,
	p_trt_base_fuel_price         IN NUMBER,
	p_trt_fuel_weight_percent     IN NUMBER,
	p_handling_amount			 				IN NUMBER		--gic3181 indique les frais de manutentions
)
RETURN NUMBER;

--ber886 calculer le montant minimum de profit (que le client soit saisi en pourcentage ou directement un montant
FUNCTION CALCULATE_MINIMUM_PROFIT_FUNC(
	p_minimum_amount 					IN NUMBER,		--pour un client, il devrait y avoir soit le pourcent OU le montant minimum de rempli
	p_minimum_percent 				IN NUMBER,		--pour un client, il devrait y avoir soit le pourcent OU le montant minimum de rempli
	p_total_cost							IN NUMBER,		--indique le coutant total sur lequel on veut appliquer le montant minimum
	p_admin_method						IN VARCHAR2	--indique la méthode de calcul de l'admin (de control)
)
RETURN NUMBER;

--BRC32 création d'une fonction servant seulement à calculer la surcharge de carburant (utilisé aussi pour le transport)
FUNCTION FIND_FUEL_SURCHARGE_FUNC(
	p_fsg_code 								IN NUMBER,
	p_ctr_current_fuel_price 	IN NUMBER , --BER6337
	p_ctr_base_fuel_price 		IN NUMBER , --BER6337
	p_ctr_fuel_weight_percent IN NUMBER , --BER6337
  p_invoiced_amount         IN NUMBER DEFAULT NULL -- BER1995
)

RETURN NUMBER;

FUNCTION CALCULATE_CHARGES_INFO_FUNC(
	p_cus_code 							IN NUMBER,
	p_sales_amount 					IN NUMBER,
	p_cost_amount		      	IN NUMBER
)
RETURN NUMBER;


END CALCULATE_DELIVERY_PACK;
/