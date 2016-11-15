CREATE OR REPLACE PACKAGE phenix.OIC_PACK IS

FUNCTION GET_OIC_ID_FUNC RETURN NUMBER;

FUNCTION GET_FULL_OIC_BY_ID_FUNC(
	p_oic_id 			IN outstanding_inventory_counts.oic_id%TYPE,
	p_oic_record	OUT outstanding_inventory_counts%ROWTYPE
)
RETURN BOOLEAN;

PROCEDURE INSERT_OIC_PROC(
	p_oic_id                   IN outstanding_inventory_counts.oic_id%TYPE,
	p_oic_loc_code             IN outstanding_inventory_counts.oic_loc_code%TYPE,
	p_oic_prd_code             IN outstanding_inventory_counts.oic_prd_code%TYPE,
	p_oic_type                 IN outstanding_inventory_counts.oic_type%TYPE,
	p_oic_rma_reference_number IN outstanding_inventory_counts.oic_rma_reference_number%TYPE,
	p_oic_status               IN outstanding_inventory_counts.oic_status%TYPE,
	p_oic_creation_date        IN outstanding_inventory_counts.oic_creation_date%TYPE,
	p_oic_whs_code             IN outstanding_inventory_counts.oic_whs_code%TYPE
);

PROCEDURE DELETE_OIC_PROC(
	p_oic_id   IN outstanding_inventory_counts.oic_id%TYPE
);

PROCEDURE UPDATE_OIC_STATUS_PROC(
	p_oic_id 			IN outstanding_inventory_counts.oic_id%TYPE,
	p_oic_status 	IN outstanding_inventory_counts.oic_status%TYPE
);

FUNCTION LOCK_OIC_FUNC(
	p_oic_id 			IN outstanding_inventory_counts.oic_id%TYPE
)
RETURN BOOLEAN;

END OIC_PACK;
 
/