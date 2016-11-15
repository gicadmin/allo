CREATE OR REPLACE PACKAGE phenix.CMA_OPERATION_PACK IS

--CSC3595 fonction pour insérer dans la table CONTAINER_MOVEMENT_AUDITS
FUNCTION CREATE_CMA_AUDIT_FUNC(
	p_cma_prf_prd_code					IN 	VARCHAR2,
	p_cma_prf_fmt_code					IN 	VARCHAR2,
	p_cma_quantity_moved				IN 	NUMBER,
	p_cma_weight_moved    			IN 	NUMBER,
	p_cma_source_container			IN	VARCHAR2,
	p_cma_destination_container	IN  VARCHAR2,
	p_cma_use_code        			IN  NUMBER ,
	p_cma_loc_code        			IN  VARCHAR2
)
RETURN PLS_INTEGER;

PROCEDURE PURGE_PROC(
  p_cma_prf_prd_code IN container_movement_audits.cma_prf_prd_code%TYPE,
  p_cma_prf_fmt_code IN container_movement_audits.cma_prf_fmt_code%TYPE
);

END CMA_OPERATION_PACK;
/