CREATE OR REPLACE PACKAGE phenix.RAP_VENTE_SOMMAIRE_DETAIL_PACK IS

PROCEDURE RAP_VENTE_SOMMAIRE_CLIENT_PROC (
	p_du_cust 						IN NUMBER,
	p_au_cust 						IN NUMBER,
	p_period	 						IN NUMBER,
	p_year		 						IN NUMBER,
	p_include_retailers		IN VARCHAR2,
	p_fournisseur         IN NUMBER,
	p_maison_mere         IN VARCHAR2
);

END RAP_VENTE_SOMMAIRE_DETAIL_PACK;
/