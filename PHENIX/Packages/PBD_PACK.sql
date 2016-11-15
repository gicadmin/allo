CREATE OR REPLACE PACKAGE phenix.PBD_PACK IS

FUNCTION GET_DELIVERY_DATES_FUNC (	--ajouter par Rostom
	p_cpr_id 				IN NUMBER,
	p_nbr_of_dates 	IN NUMBER
)
RETURN VARCHAR2;

PROCEDURE DELETE_PBD_BY_CPR_ID_PROC(
	p_cpr_id 					IN NUMBER
);

END PBD_PACK;
 
/