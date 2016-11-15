CREATE OR REPLACE PACKAGE phenix.DIFFERENT_PACK IS

----------------------------------------------------------------------------------------------------

--recoit des paramètres VARCHAR, et retourne un boolean
FUNCTION IS_DIFFERENT_CHAR_BOOL_FUNC(
	p_param1 IN VARCHAR2,
	p_param2 IN VARCHAR2
)
RETURN BOOLEAN;

----------------------------------------------------------------------------------------------------

--recoit des paramètres DATE, et retourne un boolean
FUNCTION IS_DIFFERENT_DATE_BOOL_FUNC(
	p_param1 IN DATE,
	p_param2 IN DATE
)
RETURN BOOLEAN;

----------------------------------------------------------------------------------------------------

--recoit des paramètres NUMBER, et retourne un boolean
FUNCTION IS_DIFFERENT_NUM_BOOL_FUNC(
	p_param1 IN NUMBER,
	p_param2 IN NUMBER
)
RETURN BOOLEAN;

----------------------------------------------------------------------------------------------------

--recoit des paramètres VARCHAR, et retourne un NUMBER
FUNCTION IS_DIFFERENT_CHAR_NUM_FUNC (
	p_param1 IN VARCHAR2,
	p_param2 IN VARCHAR2
)
RETURN NUMBER;

----------------------------------------------------------------------------------------------------

--recoit des paramètres DATE, et retourne un NUMBER
FUNCTION IS_DIFFERENT_DATE_NUM_FUNC(
	p_param1 IN DATE,
	p_param2 IN DATE
)
RETURN NUMBER;

----------------------------------------------------------------------------------------------------

--recoit des paramètres NUMBER, et retourne un NUMBER
FUNCTION IS_DIFFERENT_NUM_NUM_FUNC(
	p_param1 IN NUMBER,
	p_param2 IN NUMBER
)
RETURN NUMBER;

----------------------------------------------------------------------------------------------------

END DIFFERENT_PACK;
 
/