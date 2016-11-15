CREATE OR REPLACE PACKAGE phenix.RAP_ALERT_PRODUCTS_PACK IS

PROCEDURE GEN_RAP_ALERTE_PRODUCTS_PROC(
	p_code_entrepot       IN VARCHAR2,
	p_from_buyer          IN NUMBER,
	p_to_buyer            IN NUMBER,
	p_inclure_cueillette  IN VARCHAR2,
  p_produits_alerte     IN VARCHAR2,
	p_produits_expires    IN VARCHAR2,
  p_language_rapport    IN VARCHAR2
);

END RAP_ALERT_PRODUCTS_PACK;
/