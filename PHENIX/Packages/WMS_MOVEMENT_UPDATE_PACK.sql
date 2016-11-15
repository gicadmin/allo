CREATE OR REPLACE PACKAGE phenix.WMS_MOVEMENT_UPDATE_PACK IS

--------------------------------------------------------------------------------

FUNCTION CREATE_OIC_FUNC (
  p_oic_loc_code      IN  VARCHAR2,
  p_oic_prd_code      IN  VARCHAR2,
  p_oic_type          IN  VARCHAR2,
  p_oic_id            OUT NOCOPY NUMBER,
  p_cah_id            IN  NUMBER DEFAULT NULL
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION CREATE_INM_FUNC (
   p_inm_prf_prd_code         IN  VARCHAR2,
   p_inm_prf_source_fmt_code  IN  VARCHAR2,
   p_inm_moved_quantity_out   IN  NUMBER,
   p_inm_moved_weight_out     IN  NUMBER,
   p_inm_use_code             IN  NUMBER,
   p_inm_from_loc_code        IN  VARCHAR2,
   p_inm_start_date           IN  DATE,
   p_inm_planned_switch       IN  NUMBER,
   p_inm_trans_type           IN  VARCHAR2,
   p_inm_fifo_date            IN  DATE,  -- GIC3396
   p_inm_expiry_date          IN  DATE,  --CVI98 + GIC3396
   p_inm_id                   OUT NOCOPY NUMBER,
   p_inm_source_ide_id        IN  NUMBER  DEFAULT NULL      --CSC2799
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION UPDATE_INM_FUNC (
  p_inm_id                         IN   NUMBER,
  p_inm_prf_destination_fmt_code   IN   VARCHAR2,
  p_inm_moved_quantity_in          IN   NUMBER,
  p_inm_moved_weight_in            IN   NUMBER,
  p_inm_to_loc_code                IN   VARCHAR2,
  p_inm_end_date                   IN   DATE,
  p_inm_destination_ide_id         IN   NUMBER  DEFAULT NULL,  ---CSC2799
  p_inm_dmr_code									 IN 	NUMBER	DEFAULT NULL,			--CSC3441
  p_inm_destination_prd_code			 IN	 	VARCHAR2 DEFAULT NULL			--BER1019
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION UPDATE_MOVEMENT_FUNC (
  p_inv_loc_code         IN   VARCHAR2,
  p_inv_prf_prd_code     IN   VARCHAR2,
  p_inv_prf_fmt_code     IN   VARCHAR2,
  p_inv_qty_mvt_in_out   IN   NUMBER,
  p_inv_wgt_mvt_in_out   IN   NUMBER,
  p_inv_fifo_date        IN   DATE,
  p_inv_expiry_date      IN   DATE,
  p_inv_in_out_flag      IN   CHAR
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION RAZ_MOVEMENT_FUNC (
	p_inv_prf_prd_code   IN   VARCHAR2,
	p_inv_loc_code       IN   VARCHAR2,
	p_inv_prf_fmt_code   IN   VARCHAR2    --GIC1830
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION TRANSFER_INVENTORY_FMT_FUNC (
  p_loc_code          IN              VARCHAR2,
  p_prd_code          IN              VARCHAR2,
  p_fmt_code          IN              VARCHAR2,
  p_prd_definition    IN              VARCHAR2,
  p_wanted_qty_wght   IN OUT NOCOPY   NUMBER,
  p_check_osm_switch	IN 							NUMBER DEFAULT 1	--ber1802
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION SET_OIC_STATUS_FUNC (
	p_oic_id IN NUMBER
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION FIND_ORIGINAL_INM_FUNC (--csc3555
  p_inm_prf_prd_code       	IN VARCHAR2,
  p_inm_prf_fmt_code				IN VARCHAR2,
  p_inm_use_code           	IN VARCHAR2,
  p_inm_from_loc_code      	IN VARCHAR2,
  p_inm_trans_type         	IN VARCHAR2,
  p_inm_group_id            OUT NOCOPY NUMBER
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION FIND_ORIGINAL_INM_MV2_FUNC (--csc3555
  p_identifier       	IN NUMBER,
  p_inm_use_code      IN VARCHAR2,
  p_inm_from_loc_code IN VARCHAR2,
  p_inm_to_loc_code   IN VARCHAR2,
  p_inm_group_id      OUT NOCOPY NUMBER
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------
END WMS_MOVEMENT_UPDATE_PACK;
/