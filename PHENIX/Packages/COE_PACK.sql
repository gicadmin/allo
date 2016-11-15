CREATE OR REPLACE PACKAGE phenix.COE_PACK IS
/*
*	 GIMAT     DATE      AUTEUR   DESCRIPTION
*	-------	----------	--------- --------------------------------
*	EFE62	 11-10-2011	  Mawuko		Création initiale du package
*
*
*/

FUNCTION GET_COE_ID_FUNC RETURN NUMBER ;

PROCEDURE INSERT_COE_PROC(
	p_coe_cot_cod_coh_id         IN customer_order_exp_dates.coe_cot_cod_coh_id%TYPE,
	p_coe_cot_cod_line_number    IN customer_order_exp_dates.coe_cot_cod_line_number%TYPE,
	p_coe_cot_line_number        IN customer_order_exp_dates.coe_cot_line_number%TYPE,
	p_coe_expiration_date        IN customer_order_exp_dates.coe_expiration_date%TYPE,
	p_coe_quantity               IN customer_order_exp_dates.coe_quantity%TYPE
	) ;
FUNCTION UPDATE_COE_FUNC(
	p_coe_cot_cod_coh_id         IN customer_order_exp_dates.coe_cot_cod_coh_id%TYPE,
	p_coe_cot_cod_line_number    IN customer_order_exp_dates.coe_cot_cod_line_number%TYPE,
	p_coe_cot_line_number        IN customer_order_exp_dates.coe_cot_line_number%TYPE,
	p_coe_expiration_date        IN customer_order_exp_dates.coe_expiration_date%TYPE,
	p_coe_quantity               IN customer_order_exp_dates.coe_quantity%TYPE
	)
RETURN PLS_INTEGER	;

FUNCTION UPDATE_INSERT_COE_FUNC(
  p_coe_cot_cod_coh_id        IN NUMBER,
	p_coe_cot_cod_line_number   IN NUMBER,
	p_coe_cot_line_number       IN NUMBER,
  p_coe_expiration_date       IN DATE,
  p_coe_quantity              IN NUMBER,
  p_vocal_switch              IN NUMBER,
  p_error_code                OUT NUMBER,
  p_error_message             OUT VARCHAR2
)
RETURN PLS_INTEGER;

PROCEDURE DELETE_COE_PROC(
  p_coe_cot_cod_coh_id        IN NUMBER,
	p_coe_cot_cod_line_number   IN NUMBER,
	p_coe_cot_line_number       IN NUMBER
);


END COE_PACK;
 
/