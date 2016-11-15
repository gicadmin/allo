CREATE OR REPLACE PACKAGE phenix.RAP_A_COURT_ACHETEUR_PACK IS

PROCEDURE GENERATE_REP_A_COURT_DATA_PROC(
	p_date_debut    		IN DATE,
	p_date_fin      		IN DATE,
	p_heure_debut   		IN NUMBER,
	p_heure_fin     		IN NUMBER,
	p_de_acheteur   		IN NUMBER,
	p_a_acheteur    		IN NUMBER,
	p_commande_spec 		IN VARCHAR2,
	p_whs_code      		IN VARCHAR2  DEFAULT NULL, --BER1716 s il y a l entrepot on prendra les COD_PICKING dont lentrepôt en paramètre sinon tous
	P_LANGUAGE_RAPPORT	IN VARCHAR2  DEFAULT 'FR', --USG901
	p_de_client     		IN NUMBER DEFAULT NULL, --CSC8410
	p_a_client      		IN NUMBER	DEFAULT NULL
);

END RAP_A_COURT_ACHETEUR_PACK;
/