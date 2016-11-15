CREATE OR REPLACE PACKAGE phenix.CMA_PACK IS

FUNCTION GET_CMA_ID_FUNC RETURN NUMBER;

FUNCTION GET_FULL_CMA_BY_ID_FUNC(
	p_cma_id 			IN container_movement_audits.cma_id%TYPE,
	p_cma_record	OUT container_movement_audits%ROWTYPE
)
RETURN BOOLEAN;

PROCEDURE INSERT_CMA_PROC(
	p_cma_id                   		IN container_movement_audits.cma_id%TYPE,
	p_cma_prf_prd_code          	IN container_movement_audits.cma_prf_prd_code%TYPE,
	p_cma_prf_fmt_code          	IN container_movement_audits.cma_prf_fmt_code%TYPE,
	p_cma_quantity_moved        	IN container_movement_audits.cma_quantity_moved%TYPE,
	p_cma_weight_moved          	IN container_movement_audits.cma_weight_moved%TYPE,
	p_cma_source_container      	IN container_movement_audits.cma_source_container%TYPE,
	p_cma_destination_container 	IN container_movement_audits.cma_destination_container%TYPE,
	p_cma_date                  	IN container_movement_audits.cma_date%TYPE,
	p_cma_use_code              	IN container_movement_audits.cma_use_code%TYPE,
	p_cma_loc_code               	IN container_movement_audits.cma_loc_code%TYPE
);

END CMA_PACK;
 
/