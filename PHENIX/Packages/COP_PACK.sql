CREATE OR REPLACE PACKAGE phenix.COP_PACK IS

FUNCTION GET_COP_ID_FUNC RETURN NUMBER;

PROCEDURE INSERT_COP_PROC(
	p_cop_id                 	IN customer_order_pallets.cop_id%TYPE,
	p_cop_cot_cod_coh_id     	IN customer_order_pallets.cop_cot_cod_coh_id%TYPE,
	p_cop_cot_cod_line_number IN customer_order_pallets.cop_cot_cod_line_number%TYPE,
	p_cop_cot_line_number     IN customer_order_pallets.cop_cot_line_number%TYPE,
	p_cop_pallet_number       IN customer_order_pallets.cop_pallet_number%TYPE,
	p_cop_pallet_quantity     IN customer_order_pallets.cop_pallet_quantity%TYPE,
	p_cop_pallet_weight       IN customer_order_pallets.cop_pallet_weight%TYPE,
	p_cop_trailer_number      IN customer_order_pallets.cop_trailer_number%TYPE,
	p_cop_real_container_id   IN customer_order_pallets.cop_real_container_id%TYPE
);

--csc3566 copie de la fonction dans CATALYST_PACK pour mettre ici car encore utile
PROCEDURE INSERT_OR_UPDATE_COP_QTY_PROC(
 	p_cot_cod_coh_id      IN NUMBER,
  p_cot_cod_line_number IN NUMBER,
  p_cot_line_number     IN NUMBER,
  p_pallet_number       IN NUMBER,
  p_quantity            IN NUMBER,
  p_weight              IN NUMBER,
  p_prd_definition 			IN VARCHAR2
);

PROCEDURE SET_TRAILER_NUMBER_PROC(
	p_cop_cot_cod_coh_id     	IN customer_order_pallets.cop_cot_cod_coh_id%TYPE,
	p_cop_cot_cod_line_number IN customer_order_pallets.cop_cot_cod_line_number%TYPE,
	p_cop_cot_line_number     IN customer_order_pallets.cop_cot_line_number%TYPE,
	p_cop_trailer_number      IN customer_order_pallets.cop_trailer_number%TYPE
);

PROCEDURE DELETE_COP_PROC(
	p_cop_id IN customer_order_pallets.cop_id%TYPE
);

PROCEDURE DELETE_COP_FOR_COT_PROC(
	p_cop_cot_cod_coh_id     	IN customer_order_pallets.cop_cot_cod_coh_id%TYPE,
	p_cop_cot_cod_line_number IN customer_order_pallets.cop_cot_cod_line_number%TYPE,
	p_cop_cot_line_number     IN customer_order_pallets.cop_cot_line_number%TYPE
);

END COP_PACK;
 
/