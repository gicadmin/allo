CREATE OR REPLACE PACKAGE phenix.OIC_OPERATION_PACK IS

FUNCTION GENERATE_OIC_FOR_CAH_FUNC(
	p_cah_id IN NUMBER
)
RETURN PLS_INTEGER;

PROCEDURE DELETE_OIC_PROC(
  p_oic_id   IN outstanding_inventory_counts.oic_id%TYPE
);

FUNCTION LOCK_OIC_FUNC(
  p_oic_id       IN outstanding_inventory_counts.oic_id%TYPE
)
RETURN BOOLEAN;

FUNCTION CREATE_OIC_FUNC (
  p_oic_loc_code      IN  VARCHAR2,
  p_oic_prd_code      IN  VARCHAR2,
  p_oic_type          IN  VARCHAR2,
  p_oic_id            OUT NOCOPY NUMBER,
  p_cah_id            IN  NUMBER DEFAULT NULL
)
RETURN PLS_INTEGER;

FUNCTION SET_OIC_STATUS_FUNC (
	p_oic_id IN NUMBER
)
RETURN PLS_INTEGER;

END OIC_OPERATION_PACK;
/