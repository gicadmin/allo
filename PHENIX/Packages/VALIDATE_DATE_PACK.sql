CREATE OR REPLACE PACKAGE phenix.VALIDATE_DATE_PACK IS

----------------------------------------------------------------------------------------------------

FUNCTION FIND_IF_DATE_IS_BETWEEN_FUNC(
	p_from_date		IN DATE,
	p_to_date			IN DATE,
	p_given_date	IN DATE DEFAULT SYSDATE,
	p_check_week 	IN NUMBER DEFAULT 0	--GIC1172 parametre optionnel pour valider si une date de la semaine est dans l'interval
)
RETURN NUMBER;

----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------

END VALIDATE_DATE_PACK;
 
/