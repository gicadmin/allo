CREATE OR REPLACE PACKAGE phenix.CUSTOMER_PROMOTIONS_PACK IS

--csc3019 creation de la fonction pour rapporter le prix contenant deja le price change
--si on est super d et que le type de promo est garanti (sinon, retourne prf_price seulement)
--appeller par le bottin des promotions pour linstant
FUNCTION FIND_PRICE_PRX_APPLIED_FUNC(
	p_prd_code 										IN VARCHAR2,
	p_fmt_code 										IN VARCHAR2,
	p_date_debut 									IN DATE,
	p_pty_guaranteed_price_switch IN NUMBER,
	p_super_distributor_switch 		IN NUMBER
)
RETURN NUMBER;

END CUSTOMER_PROMOTIONS_PACK;
/