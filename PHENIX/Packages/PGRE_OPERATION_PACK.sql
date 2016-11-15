CREATE OR REPLACE PACKAGE phenix.PGRE_OPERATION_PACK AS

PROCEDURE GET_PROFIT_INF_SUP_PROC(
  p_profit                  IN NUMBER,
  p_minimun_profit_percent  IN product_groups.pgr_minimum_profit_percent%TYPE,
  p_maximun_profit_percent  IN product_groups.pgr_maximum_profit_percent%TYPE,
	p_min_profit_percent 	    OUT product_groups.pgr_minimum_profit_percent%TYPE,
	p_max_profit_percent 	    OUT product_groups.pgr_maximum_profit_percent%TYPE,
  p_result_comparaison      OUT VARCHAR2
);

PROCEDURE VALIDATE_CUS_PROFIT_PROC(
  p_cus_code            IN customers.cus_code%TYPE,
	p_prd_code 						IN products.prd_code%TYPE,
  p_profit              IN NUMBER,
  p_ctr_profit_range    IN VARCHAR2 DEFAULT 'T',
	p_min_profit_percent 	OUT product_groups.pgr_minimum_profit_percent%TYPE,
	p_max_profit_percent 	OUT product_groups.pgr_maximum_profit_percent%TYPE,
  p_result_comparaison  OUT VARCHAR2,
	p_min_profit_televent OUT product_groups.pgr_minimum_profit_percent%TYPE, --juste pour l'affichage ds televente la valeur VAL_34
	p_max_profit_televent OUT product_groups.pgr_minimum_profit_percent%TYPE  --juste pour l'affichage ds televente la valeur VAL_35
);

FUNCTION DOES_PGRE_EXISTS_FUNC(
  p_pgre_pgr_code    IN product_group_exceptions.pgre_pgr_code%TYPE,
  p_pgre_cus_code    IN product_group_exceptions.pgre_cus_code%TYPE,
  p_pgre_qty_code    IN product_group_exceptions.pgre_qty_code%TYPE,
  p_pgre_pug_code    IN product_group_exceptions.pgre_pug_code%TYPE,
  p_pgre_cgr_code    IN product_group_exceptions.pgre_cgr_code%TYPE,
  p_pgre_id          IN product_group_exceptions.pgre_id%TYPE,
  p_status           IN VARCHAR2 DEFAULT 'INSERT'
)RETURN BOOLEAN;
END PGRE_OPERATION_PACK;
/