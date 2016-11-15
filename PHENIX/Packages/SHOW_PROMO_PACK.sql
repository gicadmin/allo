CREATE OR REPLACE PACKAGE phenix.SHOW_PROMO_PACK IS
FUNCTION CREATE_SHOW_PROMO_FUNC(
	p_cpr_prf_prd_code                IN customer_promotions.cpr_prf_prd_code%TYPE,
	p_cpr_pty_code                    IN customer_promotions.cpr_pty_code%TYPE,
	p_cpr_allocation_amount           IN customer_promotions.cpr_allocation_amount%TYPE,
	p_cpr_from_date                   IN customer_promotions.cpr_from_date%TYPE,
	p_cpr_to_date                     IN customer_promotions.cpr_to_date%TYPE,
	p_cpr_ven_car_code                IN customer_promotions.cpr_ven_car_code%TYPE	,
	p_cpr_car_amount                  IN customer_promotions.cpr_car_amount%TYPE		,
	p_cpr_prebook_price               IN customer_promotions.cpr_prebook_price%TYPE	,
	p_cpr_message_1                   IN customer_promotions.cpr_message_1%TYPE,
	p_pbd_delivery_date               IN prebook_deliveries.pbd_delivery_date%TYPE,
	p_cpr_special_allocation          IN customer_promotions.cpr_special_allocation%TYPE
)
RETURN PLS_INTEGER;

END SHOW_PROMO_PACK;
/