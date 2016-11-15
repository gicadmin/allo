CREATE OR REPLACE PACKAGE phenix.COP_OPERATION_PACK IS

--CSC1515  utilisé pour vérifier la quantité et le poids facturé comparé avec la quantité et le poids sur les palettes
PROCEDURE UPDATE_COP_PROC(
	p_inh_id IN NUMBER
);

PROCEDURE FIND_COP_SUM_FOR_PRF_PROC(
	p_prf_prd_code 	IN VARCHAR2,
	p_prf_fmt_code 	IN VARCHAR2,
	p_container_id 	IN NUMBER,
	p_pmd_id				IN NUMBER,
	p_sum_quantity	OUT NUMBER,
	p_sum_weight		OUT NUMBER
);

END COP_OPERATION_PACK;
 
/