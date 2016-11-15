CREATE OR REPLACE PACKAGE phenix.CPR_OPERATION_PACK IS

FUNCTION GET_BEST_PROMO_WITH_DATE_FUNC(
  p_prf_prd_code 	IN VARCHAR2,
  p_prf_fmt_code 	IN VARCHAR2,
  p_cus_code 			IN NUMBER,
  p_use_code 			IN NUMBER,
  p_date					IN DATE
)
RETURN NUMBER;

--utiliser dans CAPS
PROCEDURE GET_BEST_SALES_PROMO_PROC(
	p_prd_code 				IN VARCHAR2,
	p_cpr_start_date 	OUT DATE,
	p_cpr_end_date		OUT DATE,
	p_cpr_amount_best	OUT NUMBER
);

PROCEDURE CUSTOMER_PROMO_PURGE_PROC(
	p_purge_customer_promo_days IN NUMBER,
	p_log_id 										IN NUMBER,
	p_nb_deleted								OUT NUMBER
);

PROCEDURE GET_QTY_SOLD_DURING_PROMO_PROC(
  p_cpr_pty_code     IN customer_promotions.cpr_pty_code%TYPE,
  p_cpr_prf_prd_code IN customer_promotions.cpr_prf_prd_code%TYPE,
  p_cpr_prf_fmt_code IN customer_promotions.cpr_prf_fmt_code%TYPE,
  p_cpr_from_date    IN customer_promotions.cpr_from_date%TYPE,
  p_cpr_to_date      IN customer_promotions.cpr_to_date%TYPE,
  p_quantity         OUT NUMBER,
  p_weight           OUT NUMBER
);

--BER286 -Fonction qui retourne le nombre de promotions d'un produit pour un client
FUNCTION COUNT_CPR_NOT_FINISHED_FUNC(
	p_prd_code IN VARCHAR2
)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_cpr_prf_prd_code IN customer_promotions.cpr_prf_prd_code%TYPE,
  p_cpr_prf_fmt_code IN customer_promotions.cpr_prf_fmt_code%TYPE
);

FUNCTION GET_ACTUAL_CPR_FUNC(
  p_cpy_pty_code     IN  customer_promotion_types.cpy_pty_code%TYPE,
  p_cpy_cus_code     IN  customer_promotion_types.cpy_cus_code%TYPE,
  p_cpr_prf_prd_code IN  customer_promotions.cpr_prf_prd_code%TYPE,
  p_cpr_prf_fmt_code IN  customer_promotions.cpr_prf_fmt_code%TYPE,
  p_cpr_rec          OUT customer_promotions%ROWTYPE
)
RETURN BOOLEAN;

PROCEDURE PURGE_PROC(
  p_cpr_ven_code IN customer_promotions.cpr_ven_car_code%TYPE
);

FUNCTION GET_BEST_ALLOCATION_FUNC(
  p_cus_code                      IN customers.cus_code%TYPE,
  p_cpr_prf_prd_code              IN customer_promotions.cpr_prf_prd_code%TYPE,
  p_cpr_prf_fmt_code              IN customer_promotions.cpr_prf_fmt_code%TYPE,
  p_cpr_from_date                 IN customer_promotions.cpr_from_date%TYPE,
  p_cpr_to_date                   IN customer_promotions.cpr_to_date%TYPE,
  p_pty_telemark_only             IN promotion_types.pty_telemark_only_switch%TYPE,
  p_whs_c_and_c_pricing_cus_code  IN customers.cus_code%TYPE DEFAULT NULL   --bea257
)
RETURN NUMBER;

FUNCTION GET_BEST_SP_ALLOCATION_FUNC(
  p_cus_code                      IN customers.cus_code%TYPE,
  p_cpr_prf_prd_code              IN customer_promotions.cpr_prf_prd_code%TYPE,
  p_cpr_prf_fmt_code              IN customer_promotions.cpr_prf_fmt_code%TYPE,
  p_cpr_from_date                 IN customer_promotions.cpr_from_date%TYPE,
  p_cpr_to_date                   IN customer_promotions.cpr_to_date%TYPE,
  p_pty_telemark_only             IN promotion_types.pty_telemark_only_switch%TYPE,
  p_whs_c_and_c_pricing_cus_code  IN customers.cus_code%TYPE DEFAULT NULL   --bea257
)
RETURN NUMBER;

FUNCTION GET_BEST_ALLOCATION_FUNC(
  p_cus_code                      IN customers.cus_code%TYPE,
  p_cpr_prf_prd_code              IN customer_promotions.cpr_prf_prd_code%TYPE,
  p_cpr_prf_fmt_code              IN customer_promotions.cpr_prf_fmt_code%TYPE,
  p_cpr_date                      IN customer_promotions.cpr_from_date%TYPE,
  p_pty_telemark_only             IN promotion_types.pty_telemark_only_switch%TYPE,
  p_whs_c_and_c_pricing_cus_code  IN customers.cus_code%TYPE DEFAULT NULL   --bea257
)
RETURN NUMBER;

FUNCTION GET_BEST_SP_ALLOCATION_FUNC(
  p_cus_code                      IN customers.cus_code%TYPE,
  p_cpr_prf_prd_code              IN customer_promotions.cpr_prf_prd_code%TYPE,
  p_cpr_prf_fmt_code              IN customer_promotions.cpr_prf_fmt_code%TYPE,
  p_cpr_date                      IN customer_promotions.cpr_from_date%TYPE,
  p_pty_telemark_only             IN promotion_types.pty_telemark_only_switch%TYPE,
  p_whs_c_and_c_pricing_cus_code  IN customers.cus_code%TYPE DEFAULT NULL   --bea257
)
RETURN NUMBER;

FUNCTION GET_BEST_PREBOOK_FUNC(
  p_cus_code         IN  customers.cus_code%TYPE,
  p_cpr_prf_prd_code IN  customer_promotions.cpr_prf_prd_code%TYPE,
  p_cpr_prf_fmt_code IN  customer_promotions.cpr_prf_fmt_code%TYPE,
  p_prebook_date     IN  prebook_deliveries.pbd_delivery_date%TYPE,
  p_cpy_id           OUT customer_promotion_types.cpy_id%TYPE
)
RETURN NUMBER;

PROCEDURE UPDATE_CPR_MODIF_DATE_PROC(
  p_pbd_cpr_id  IN prebook_deliveries.pbd_cpr_id%TYPE
);
END CPR_OPERATION_PACK;
/