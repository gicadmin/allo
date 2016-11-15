CREATE OR REPLACE PACKAGE phenix.RECEPTION_OPERATION_PACK IS

FUNCTION GET_RECEIVED_WEIGHT_FUNC(
	p_rtd_prf_prd_code      IN VARCHAR2,
  p_rtd_prf_fmt_code      IN VARCHAR2,
  p_average_weight        IN NUMBER,
  p_product_rec           IN OUT NOCOPY products%ROWTYPE,
  p_product_formats_rec   IN OUT NOCOPY product_formats%ROWTYPE,
  p_formats_rec           IN OUT NOCOPY formats%ROWTYPE,
  p_rcd_received_quantity IN NUMBER,
  p_rcd_received_weight   OUT NOCOPY NUMBER
)
RETURN PLS_INTEGER;

END RECEPTION_OPERATION_PACK;
 
/