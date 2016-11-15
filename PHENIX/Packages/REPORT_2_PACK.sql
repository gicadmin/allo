CREATE OR REPLACE PACKAGE phenix.REPORT_2_PACK AS

  ----------------------------------------------------------------------------------------------
   --Fonction utilisée pour remplir la table temporaire du rapport RAP_ACHAT_VENTE_PAR_MANUF
  ----------------------------------------------------------------------------------------------
	PROCEDURE FILL_TRP_TABLE_PROC(
		p_de_date								IN DATE,
		p_a_date								IN DATE,
		p_du_manufacturier 			IN NUMBER,
		p_a_manufacturier				IN NUMBER,
		p_type_ordre						IN VARCHAR2,
		p_dernier_coutant_paye 	IN VARCHAR2,
		p_prd_code 							IN VARCHAR2,
		p_whs_code							IN VARCHAR2,
    p_du_fournisseur        IN NUMBER,
    p_a_fournisseur         IN NUMBER,
    p_du_groupe_produit     IN NUMBER,
    p_a_groupe_produit      IN NUMBER,
    p_choix_selection       IN VARCHAR2,
    p_calcul_dpp            IN VARCHAR2,
		p_de_marque							IN NUMBER,
		p_a_marque 						  IN NUMBER,
    p_language_rapport      IN VARCHAR2  DEFAULT 'FR' --ARM353
	);
	-----------------------------------------------------------------------------------------------------------------------------
	--CVI1831 chercher s'il existe un price change appliqué entre la date envoyé comme paramétre et aujourd'hui
	-----------------------------------------------------------------------------------------------------------------------------
	FUNCTION PRICE_CHANGE_POSTED_FUNC (
		p_prd_code IN VARCHAR2,
		p_de_date IN DATE
	)
	RETURN NUMBER;

  -----------------------------------------------------------------------------------------------------------------------------
	--FRE3292 Retourne le dernier prix payé ou la moyenne selon le type de calcul désiré
	-----------------------------------------------------------------------------------------------------------------------------
  FUNCTION GET_LAST_PRICE_PAID_FUNC (
    p_de_date         IN DATE,
    p_a_date          IN DATE,
    p_prd_code        IN VARCHAR2,
    p_calcul_dpp      IN VARCHAR2,
    p_ven_code        IN NUMBER
  ) RETURN NUMBER;

FUNCTION GET_INVOICED_AMOUNT_FUNC(
  p_prd_code  IN VARCHAR2,
  p_ven_code  IN NUMBER,
  p_whs_code  IN VARCHAR2,
  p_de_date   IN DATE,
  p_a_date    IN DATE
) RETURN NUMBER;

END REPORT_2_PACK;
/