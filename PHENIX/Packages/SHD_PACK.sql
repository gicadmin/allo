CREATE OR REPLACE PACKAGE phenix.SHD_PACK IS

FUNCTION GET_SHD_ID_FUNC RETURN NUMBER;

FUNCTION GET_FULL_SHD_BY_ID_FUNC(
	p_shd_id 			IN shipment_details.shd_id%TYPE,
	p_shd_record	OUT shipment_details%ROWTYPE
)
RETURN BOOLEAN;

PROCEDURE INSERT_SHD_PROC(
	p_shd_id                 	IN shipment_details.shd_id%TYPE,
	p_shd_shh_id              IN shipment_details.shd_shh_id%TYPE,
	p_shd_container_id        IN shipment_details.shd_container_id%TYPE,
	p_shd_prf_prd_code        IN shipment_details.shd_prf_prd_code%TYPE,
	p_shd_prf_fmt_code        IN shipment_details.shd_prf_fmt_code%TYPE,
	p_shd_shipped_quantity    IN shipment_details.shd_shipped_quantity%TYPE,
	p_shd_shipped_weight      IN shipment_details.shd_shipped_weight%TYPE,
	p_shd_pmh_id              IN shipment_details.shd_pmh_id%TYPE,
	p_shd_cus_code            IN shipment_details.shd_cus_code%TYPE,
	p_shd_ven_code            IN shipment_details.shd_ven_code%TYPE,
	p_shd_expiry_date         IN shipment_details.shd_expiry_date%TYPE,
	p_shd_fifo_date           IN shipment_details.shd_fifo_date%TYPE
);

PROCEDURE DELETE_SHD_PROC(
	p_shd_id   IN shipment_details.shd_id%TYPE
);

FUNCTION LOCK_SHD_FUNC(
	p_shd_id   IN shipment_details.shd_id%TYPE
)
RETURN BOOLEAN;

END SHD_PACK;
 
/