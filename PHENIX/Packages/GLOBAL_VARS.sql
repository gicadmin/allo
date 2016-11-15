CREATE OR REPLACE PACKAGE phenix.GLOBAL_VARS IS
/*
* GIMAT     DATE        AUTHOR      DESCRIPTION
* ------- ----------  --------- -----------------------------------------------
* GIC1610 15-05-2007  Z.LAHDAMI Initial version
*	GIC3284	09-09-2010	Elise D		Ajouter le tableau dimensionné pour les triggers de product_warehouses
*	GIC3413	01-10-2011  Najoua		Ajouter le tableau dimensionné pour les triggers de warehouse_source_warehouses(transit multidirectionnel)
* GCL9575 19-06-2015  Mouloud B Ajout d'une constanate de conversion de kg au lb.
*/

	--FUNCTION'S RETURN STATUS
	ok                CONSTANT PLS_INTEGER := 0;
	nok               CONSTANT PLS_INTEGER := -1;
	error             CONSTANT PLS_INTEGER := -2;
	warning           CONSTANT PLS_INTEGER := -3;
	-- RTH_TYPE
	po                CONSTANT CHAR (1)    := 'P';
	rma               CONSTANT CHAR (1)    := 'R';
	-- RCH_STATUS
	OPEN              CONSTANT CHAR (1)    := 'O';
	reception         CONSTANT CHAR (1)    := 'R';
	attente_facture   CONSTANT CHAR (1)    := 'A';
	fermer            CONSTANT CHAR (1)    := 'F';
	-- INVENTORY INCOMING,OUTGOING flag
	incoming          CONSTANT CHAR (1)    := 'I';
	outgoing          CONSTANT CHAR (1)    := 'O';
	-- REPLENISHMENTS.REP_STATUS
	creation          CONSTANT CHAR (1)    := 'C';
	awaiting          CONSTANT CHAR (1)    := 'A';
	in_process        CONSTANT CHAR (1)    := 'P';
	-- INVENTORY_COUNT_TRANSACTIONS.ICT_TYPE
	ecart             CONSTANT CHAR (1)    := 'E';
	-- PRODUCTS.PRD_RECEPTION_DATE_TYPE
	expiration        CONSTANT CHAR (1)    := 'E';
	production        CONSTANT CHAR (1)    := 'P';
	-- VENDORS.VEN_EXPIRY_DATE_FORMAT
	gregorian         CONSTANT CHAR (1)    := 'G';
	julian            CONSTANT CHAR (1)    := 'J';
	code              CONSTANT CHAR (1)    := 'C';
  kg_to_lb          CONSTANT NUMBER      := 2.2046;

	--GIC3284 déclaration d'un type de variable dimensionné
	--Utiliser dans les triggers de la table PRODUCT_WAREHOUSES, afin de tenir à jour la table WAREHOUSE_SELLABLE_PRODUCTS qui n'est plus une vue
	TYPE prd_code_tab IS TABLE OF PRODUCT_warehouses.prw_prd_code%TYPE
		INDEX BY BINARY_INTEGER;

  --GIC3284 déclaration de 2 variables tableau dimensionné suivant la déclaration précédente
  prd_code_to_validate 	prd_code_tab;
  Empty_Rows 						prd_code_tab;


	--GIC3413 déclaration d'un type de variable dimensionné utilisé ds les triggers pour la m.a.j de la table warehouse_source_warehouses
	TYPE wsw_to_check IS RECORD (
     whs_code   			VARCHAR2(2),
     group_code   		NUMBER(5) ,
     old_source_code	VARCHAR2(2),
     new_source_code	VARCHAR2(2),
     action 					VARCHAR2(1)    --D pour delete, I pour insert, U pour update
  );

	TYPE wsw_whs_to_check IS TABLE OF wsw_to_check
		 INDEX BY PLS_INTEGER;

  wsw_to_validate 			wsw_whs_to_check;
  init_wsw_to_validate	wsw_whs_to_check;

END GLOBAL_VARS;
/