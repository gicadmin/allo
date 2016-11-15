CREATE OR REPLACE PACKAGE phenix.BOTTIN_PACK IS

/***************************************************
*	GIMAT				 DATE			 PROGRAMMEUR		DESCRIPTION
*	------		----------	-------------		----------------------------------------------------------
*	GIC1044		25-05-2005	Najoua					Enlever les procédures et fonctions qui ne st jamais appelées
******************************************************/

	TYPE promo_type_rec IS RECORD(
		promo_type 		NUMBER(3),
		promo_switch 	NUMBER(1)
	);

	TYPE promo_type_tab IS TABLE OF promo_type_rec INDEX BY BINARY_INTEGER;

	v_table_rec promo_type_tab;

	v_ctr_company_name           	VARCHAR2(30);
	v_ctr_ctg_last_printed_date  	DATE;
	line_ctr            					NUMBER(4)    := NULL;
	page_ctr            					NUMBER(4)    := NULL;
	new_page            					VARCHAR2(1)  := NULL;

	--nom logique des fichiers--
	file_bottin         utl_file.file_type;
	file_index          utl_file.file_type;
	file_newprod        utl_file.file_type;
	file_delprod        utl_file.file_type;
	file_prchg          utl_file.file_type;
	file_promo          utl_file.file_type;


	--definition des lignes des bottins--
	bottin_line         VARCHAR2(128);
	bottin_index        VARCHAR2(128);
	bottin_newprod      VARCHAR2(128);
	bottin_delprod      VARCHAR2(128);
	bottin_prchg        VARCHAR2(128);
	bottin_promo        VARCHAR2(128);

	--variables globales--
	pk_language             VARCHAR2(1) := NULL;
	pk_from_sequence_header NUMBER(5)   := NULL;
	pk_to_sequence_header   NUMBER(5)   := NULL;
	pk_effective_date       DATE;
	pk_promo_switch         NUMBER(1)   := NULL;
	pk_type_pds_switch      NUMBER(1)   := NULL;

/*Cette fonction cherche le premier format disponible pour un produit selon la valeur
  du champ pgr_sales_format de product_groups. '1' signifie plus petit format de vente
  '2' plus grand format de vente*/
FUNCTION FIND_FORMAT_PRODUCT_PROC(
	p_prd_code IN VARCHAR2
)
RETURN VARCHAR2;

/*Fonction pour verifier les statuts des promos*/
FUNCTION FIND_PROMO_SWITCH_FUNC(
	p_pty_code IN NUMBER
)
RETURN NUMBER;

--initilializer la table des promos saisies---
PROCEDURE INITIALIZE_TABLE_PROMO_PROC;

--ajouter ou modifier selon le cas les promos qui sont saisies---
PROCEDURE TABLE_PROMO_PROC(
	p_promo_type 	IN NUMBER,
	p_switch 		IN NUMBER
);

--ajouter ou modifier selon le cas les promos qui sont saisies---
PROCEDURE FILL_TABLE_PROMO_PROC;

/*procedure pour rechercher et retourner le numero de la meilleure promo de vente pour un
  produit parmis les promos choisit par l'usager */
PROCEDURE CHECK_PROMO_PROC(
  p_prd_code       IN  VARCHAR2,
  p_format         IN  VARCHAR2,
  p_effective_date IN DATE,
  p_cpr_id         OUT NUMBER,
  p_cpr_from_date  OUT DATE,
  p_cpr_to_date    OUT DATE,
  p_cpr_allocation OUT NUMBER
);

FUNCTION EXIST_GRID_FUNC(
  p_dgt_code           IN NUMBER,
  p_sprf_prd_code     IN VARCHAR2,
  p_sprf_fmt_code     IN VARCHAR2,
  p_base_selling      IN OUT NUMBER,
  p_admin_amount      IN OUT NUMBER,
  p_admin_percent     IN OUT NUMBER,
  p_npricing_strategy  IN OUT NUMBER
)
RETURN BOOLEAN;

--csc1292 probleme dans le select du rapport de bottin price change
FUNCTION PRICE_CHANGE_EXISTS_FUNC (
	p_prd_code IN VARCHAR2,
	p_end_date IN DATE
)
RETURN NUMBER;

FUNCTION EXIST_GRID_AND_MINIMUM_FUNC(  --BER926
	p_dgt_code 						IN NUMBER,
	p_sprf_prd_code 			IN VARCHAR2,
	p_sprf_fmt_code 			IN VARCHAR2,
	p_cost_selon_ctr_flag	IN NUMBER,
	p_base_selling  			IN OUT NUMBER,
	p_admin_amount  			IN OUT NUMBER,
	p_admin_percent 			IN OUT NUMBER,
	p_npricing_strategy		IN OUT NUMBER,
	p_minimum_price				IN OUT NUMBER
)
RETURN BOOLEAN;

--CVI1456 checher autre format que le format pour cash and carry selon le groupe pour un produit
FUNCTION FIND_FMT_NOT_CASH_CARRY_FUNC(
	p_prd_code IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION PRINT_BOTTIN_FUNC(
  p_pro_name                 IN programs.pro_name%TYPE,
  p_cus_code                 IN customers.cus_code%TYPE,
  p_prn_code_catalog         IN printers.prn_code%TYPE,
  p_prn_id_catalog           IN printers.prn_id%TYPE
) RETURN VARCHAR2;

FUNCTION PRINT_DETAIL_BOTTIN_FUNC(
  p_use_code                 IN users.use_code%TYPE,
  p_inactif_product_switch   IN NUMBER,
  p_srt_code                 IN NUMBER,
  p_dgt_code                 IN NUMBER,
  p_specorder_product_switch IN NUMBER,
  p_language                 IN VARCHAR2,
  p_effective_date           IN DATE,
  p_from_sequence_header     IN NUMBER,
  p_to_sequence_header       IN NUMBER,
  p_whs_code                 IN warehouses.whs_code%TYPE
) RETURN VARCHAR2;

FUNCTION PRINT_DETAIL_BOTTIN_INDEX_FUNC(
  p_use_code         IN users.use_code%TYPE,
  p_language         IN VARCHAR2,
  p_effective_date   IN DATE,
  p_whs_code         IN warehouses.whs_code%TYPE
) RETURN VARCHAR2;

FUNCTION PRINT_NEW_PRODUCT_FUNC(
  p_use_code                  IN users.use_code%TYPE,
  p_language                  IN VARCHAR2,
  p_srt_code                  IN NUMBER,
  p_dgt_code                  IN NUMBER,
  p_specorder_product_switch  IN NUMBER,
  p_effective_date            IN DATE,
  p_from_sequence_header      IN NUMBER,
  p_to_sequence_header        IN NUMBER,
  p_whs_code                  IN warehouses.whs_code%TYPE
) RETURN VARCHAR2;

FUNCTION PRINT_DELETED_PRODUCT_FUNC(
  p_use_code              IN users.use_code%TYPE,
  p_language              IN VARCHAR2,
  p_dgt_code              IN NUMBER,
  p_effective_date        IN DATE,
  p_from_sequence_header  IN NUMBER,
  p_to_sequence_header    IN NUMBER,
  p_whs_code              IN warehouses.whs_code%TYPE
) RETURN VARCHAR2;

FUNCTION PRINT_PRICE_CHANGE_FUNC(
  p_use_code                  IN users.use_code%TYPE,
  p_language                  IN VARCHAR2,
  p_srt_code                  IN NUMBER,
  p_dgt_code                  IN NUMBER,
  p_specorder_product_switch  IN NUMBER,
  p_effective_date            IN DATE,
  p_from_sequence_header      IN NUMBER,
  p_to_sequence_header        IN NUMBER,
  p_whs_code                  IN warehouses.whs_code%TYPE
) RETURN VARCHAR2;

FUNCTION PRINT_PROMOTION_FUNC(
  p_use_code                  IN users.use_code%TYPE,
  p_language                  IN VARCHAR2,
  p_dgt_code                  IN NUMBER,
  p_specorder_product_switch  IN NUMBER,
  p_effective_date            IN DATE,
  p_from_sequence_header      IN NUMBER,
  p_to_sequence_header        IN NUMBER,
  p_whs_code                  IN warehouses.whs_code%TYPE
) RETURN VARCHAR2;

END BOTTIN_PACK;
/