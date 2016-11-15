CREATE OR REPLACE PACKAGE phenix.PROFILE_ORDER_BY_PACK IS

/* 	Fonction retournant 0 ou 1 dépendant si le produit format existe
			sur la commande passée en paramètre
		Utilisé dans CUSTOMER PROFILES pour le ORDER_BY du BLOC					*/
FUNCTION EXIST_IN_COH_FUNC (
	p_coh_id 		IN NUMBER,
	p_prd_code 	IN VARCHAR2,
	p_fmt_code 	IN VARCHAR2
)
RETURN NUMBER;

/* 	Fonction retournant le code de catalog du produit passé en paramètre
		Utilisé dans CUSTOMER PROFILES pour le ORDER_BY du BLOC					*/
FUNCTION FULL_CATALOG_FUNC (	--fre1593 pour avoir les 2 champ de catalog ensemble
	p_prd_code IN VARCHAR2
)
RETURN NUMBER;

/* 	Fonction retournant le code de catalog du produit passé en paramètre
		Utilisé dans CUSTOMER PROFILES pour le ORDER_BY du BLOC					*/
FUNCTION CATALOG_HEADER_FUNC (
	p_prd_code IN VARCHAR2
)
RETURN NUMBER;

/* 	Fonction retournant la séquence de catalog du produit passé en paramètre
		Utilisé dans CUSTOMER PROFILES pour le ORDER_BY du BLOC					*/
FUNCTION CATALOG_SEQ_FUNC (
	p_prd_code IN VARCHAR2
)
RETURN NUMBER;

/* 	Fonction retournant la description du produit passé en paramètre
		Utilisé dans CUSTOMER PROFILES pour le ORDER_BY du BLOC					*/
FUNCTION PRD_DESCRIPTION_FUNC (
	p_prd_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/* 	Fonction retournant 0 ou 1 dépendant si le produit a déjà été
			commandé à un moment quelconque de la vie du client
		Utilisé dans POPUP_PRE_DELETED_PRODUCTS pour le ORDER_BY du BLOC					*/
FUNCTION CUS_ALREADY_ORDERED_PRD_FUNC (	--USG256
	p_cus_code IN NUMBER,
	p_prd_code IN VARCHAR2
)
RETURN NUMBER;

/* 	Fonction retournant le NCH_PRINT_SEQUENCE*/
FUNCTION NCH_PRINT_SEQUENCE_FUNC (
	p_nch_id 		IN NUMBER,
  p_nac_code	IN NUMBER
)
RETURN NUMBER;

FUNCTION FIND_DPA_DISPLAY_SEQ_FUNC (	--CSC1254
 p_dpa_id IN NUMBER
)
RETURN NUMBER;

--------------------------------------------------------------------------------------------
-- Fonction retournant le code de produit client dans les soummissions dépendant si le produit format existe
--sinon la fonction retourne null,utilisée pour le ORDER_By du bottin personnalisé de Bertrand
--------------------------------------------------------------------------------------------
FUNCTION EXIST_QTD_FUNC (--ber776
	p_cus_code					IN NUMBER,
	p_cus_qty_code			IN NUMBER,
	p_cus_naz_nac_code	IN NUMBER,
	p_cus_naz_zone_code	IN NUMBER,
	p_prd_code					IN VARCHAR2,
	p_fmt_code					IN VARCHAR2
)
RETURN VARCHAR2;

--GIC3268 fonction pour la date de création d'un po, utilisé dans popup_correct_wrong_costs.fmb
FUNCTION FIND_POH_ORDER_DATE_FUNC(
	p_poh_id IN NUMBER
)
RETURN DATE;

--GIC3268 fonction pour la date de création/facturation d'une commande client, utilisé dans popup_correct_wrong_costs.fmb
FUNCTION FIND_COD_DATE_FUNC(
	p_cod_coh_id 				IN NUMBER,
	p_cod_line_number 	IN NUMBER,
	p_cod_creation_date	IN DATE
)
RETURN DATE;

END PROFILE_ORDER_BY_PACK;
 
/