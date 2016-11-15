CREATE OR REPLACE PACKAGE phenix.DAC_PACK IS

FUNCTION GET_FULL_DAC_FUNC(
	p_dac_code 		IN delivery_accessories.dac_code%TYPE,
	p_dac_record	OUT delivery_accessories%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_DAC_FUNC(
	p_dac_code IN delivery_accessories.dac_code%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_DAC_DESCRIPTION_FUNC(
	p_dac_code IN delivery_accessories.dac_code%TYPE,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

FUNCTION DO_DAC_EXISTS_FUNC(
  p_dac_code IN delivery_accessories.dac_code%TYPE
)
RETURN BOOLEAN;

END DAC_PACK;
 
/