CREATE OR REPLACE PACKAGE phenix.RAP_VENTE_DETAILS_PACK IS

PROCEDURE RAP_VENTE_DETAILS_PROC(
	p_de_date 							IN DATE,
	p_a_date 								IN DATE,
	p_du_groupe 						IN NUMBER,
	p_au_groupe 						IN NUMBER,
	p_du_client 						IN NUMBER,
	p_au_client 						IN NUMBER,
	p_du_vendeur 						IN NUMBER,
	p_au_vendeur 						IN NUMBER,
	p_de_date_passee				IN DATE,
	p_a_date_passee         IN DATE,
	p_date_period_1         IN DATE,
	p_date_period_1_passee  IN DATE,
	p_product_details				IN NUMBER DEFAULT 0,
	p_du_groupe_majeur			IN NUMBER DEFAULT NULL,			--utilisé seulement si p_product_details = 1
  p_au_groupe_majeur			IN NUMBER DEFAULT NULL,			--utilisé seulement si p_product_details = 1
  p_code_entrepot					IN VARCHAR2	DEFAULT NULL,					--BER1481
  p_coutant               IN NUMBER DEFAULT NULL,     --BER3031
  p_language_rapport      IN VARCHAR2 DEFAULT 'FR'    --BER3031
);

END RAP_VENTE_DETAILS_PACK;
/