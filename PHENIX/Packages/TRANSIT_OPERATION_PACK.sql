CREATE OR REPLACE PACKAGE phenix.TRANSIT_OPERATION_PACK IS

FUNCTION SET_TRANSIT_WAREHOUSE_FUNC (
	p_pmh_id        IN NUMBER,
  p_language_flag IN VARCHAR2,
  p_vocal_switch  IN NUMBER,
  p_pmh_status    OUT VARCHAR2
)
RETURN PLS_INTEGER;

FUNCTION SET_WAREHOUSE_RETURN_FUNC (
	p_plh_id        	IN NUMBER,
  p_truck_code     	IN NUMBER,
	p_shipping_date  	IN DATE,
	p_src_whs_code   	IN VARCHAR2,
	p_dest_whs_code  	IN VARCHAR2,
	p_use_code       	IN NUMBER,
  p_language_flag  	IN VARCHAR2,
  p_vocal_switch   	IN NUMBER
)
RETURN PLS_INTEGER;

FUNCTION SET_TRANSIT_INTERCO_FUNC (
	p_plh_id                 IN NUMBER,
 	p_truck_code             IN NUMBER,
	p_src_whs_code           IN VARCHAR2,
	p_dest_whs_code          IN VARCHAR2,
	p_expected_shipping_date IN DATE,
	p_use_code               IN NUMBER,
  p_language_flag          IN VARCHAR2,
  p_vocal_switch           IN NUMBER,
	p_trh_id                 OUT NUMBER
)
RETURN PLS_INTEGER;

END TRANSIT_OPERATION_PACK;
/