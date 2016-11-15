CREATE OR REPLACE PACKAGE phenix.VALIDATION_CODE_PACK IS

FUNCTION VALIDATE_PASSWORD_FUNC(
	p_new_password IN VARCHAR2
)
RETURN BOOLEAN;

--cvi1487 Fonction wrapée pour l'utilisation de Louis-Francois.. qui ne peut pas recevoir de boolean
FUNCTION VALIDATE_PASSWORD_NUM_FUNC(
	p_new_password IN VARCHAR2
)
RETURN PLS_INTEGER;

--CHA455 Cette fonction vérifie le chiffre de contrôle lors de la saisie d'un code de produit
FUNCTION CHECK_DIGIT_FUNC (
  p_prd_code      IN VARCHAR2,
  p_check_digit  	OUT NUMBER,
  p_ccr_code 		 	OUT NUMBER
)
RETURN PLS_INTEGER;

FUNCTION CHECK_UPC_DIGIT_FUNC(
	t_upc_code IN VARCHAR2
)
RETURN BOOLEAN;

--CSC5368 permet de valider le code GTIN pour le cubiscan
FUNCTION VALIDATE_GTIN_FUNC(
	p_gtin_code     IN VARCHAR2,
	p_language      IN VARCHAR2
)
RETURN VARCHAR2;

END VALIDATION_CODE_PACK;
 
/