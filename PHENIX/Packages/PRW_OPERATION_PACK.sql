CREATE OR REPLACE PACKAGE phenix.PRW_OPERATION_PACK IS

G_whs_code product_warehouses.prw_whs_code%TYPE := NULL;

-- Fonction qui met à jour la palettisation d'un produit
FUNCTION SET_PALLET_PATTERN_FUNC(
	p_prd_code								IN	VARCHAR2,
	p_prw_items_per_pallet		IN	NUMBER,
	p_prw_items_per_row				IN	NUMBER,
	p_use_code								IN 	NUMBER,		--ber1460
	p_vocal_switch						IN	NUMBER,
	p_language_flag						IN	VARCHAR2,
	p_ccr_code								OUT	NUMBER,
	p_ccr_message							OUT	VARCHAR2
)
RETURN PLS_INTEGER;

FUNCTION GET_FULL_FUNC(
  p_prw_prd_code  IN  product_warehouses.prw_prd_code%TYPE,
  p_dgt_code      IN  discount_grid_types.dgt_code%TYPE,
  p_prw_rec       OUT product_warehouses%ROWTYPE
) RETURN BOOLEAN;

FUNCTION GET_FULL_FUNC(
  p_prw_prd_code  IN  product_warehouses.prw_prd_code%TYPE,
  p_cus_code      IN  customers.cus_code%TYPE,
  p_prw_rec       OUT product_warehouses%ROWTYPE
) RETURN BOOLEAN;

FUNCTION SEND_DECOMPTE_INV_FUNC(
  p_prd_code     IN VARCHAR2,
  p_prd_status   IN VARCHAR2
)RETURN VARCHAR2;

FUNCTION GET_PRW_SHR_CODE_FUNC(
  p_prw_prd_code      IN product_warehouses.prw_prd_code%TYPE,
  p_whs_picking_code  IN product_warehouses.prw_whs_code%TYPE
) RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_prw_prd_code IN product_warehouses.prw_prd_code%TYPE
);

--CSC7041 trouver le nombre de semaine de réappro du produit entrepot... ou du fournisseur entrepot sinon (toujours du manuf du produit)
FUNCTION GET_REPLENISH_NB_OF_WEEK_FUNC (
  p_prw_prd_code IN product_warehouses.prw_prd_code%TYPE,
  p_prw_whs_code IN product_warehouses.prw_whs_code%TYPE
)
RETURN NUMBER;

--csc7041 création d'une fonction pour locker un produit entrepot
FUNCTION LOCK_PRW_FUNC(
  p_prw_prd_code IN product_warehouses.prw_prd_code%TYPE,
  p_prw_whs_code IN product_warehouses.prw_whs_code%TYPE
)
RETURN BOOLEAN;

--csc7041 fonction pour remettre à null les 3 champs (1 à la fois) qui concernent le nouveau calcul de CAPS etc..
FUNCTION RESET_VALUE_TO_NULL_FUNC(
  p_prd_ven_code  IN NUMBER,
  p_whs_code      IN product_warehouses.prw_whs_code%TYPE,
  p_field_name    IN VARCHAR2
)
RETURN BOOLEAN;

PROCEDURE ADD_ALL_WAREHOUSES_PROC(
  p_prd_code             IN products.prd_code%TYPE,
  p_prd_default_whz_code IN products.prd_default_whz_code%TYPE
);

PROCEDURE UPDATE_ALL_WAREHOUSES_PROC(
  p_prd_code IN products.prd_code%TYPE
);

PROCEDURE SEND_DECOMPTE_INV_PROC(
  p_prd_code    IN products.prd_code%TYPE,
  p_prd_status  IN products.prd_status%TYPE
);

FUNCTION FIND_WHS_FOR_SEND_DEC_INV_FUNC(
  p_prd_code  IN VARCHAR2
) RETURN BOOLEAN;

PROCEDURE SET_SHORT_REASON_PROC(
  p_prw_prd_code IN product_warehouses.prw_prd_code%TYPE,
  p_prw_whs_code IN product_warehouses.prw_whs_code%TYPE,
  p_prw_shr_code IN product_warehouses.prw_shr_code%TYPE
);

PROCEDURE SET_WAREHOUSE_PROC(
  p_whs_code IN product_warehouses.prw_whs_code%TYPE
);
PRAGMA RESTRICT_REFERENCES (SET_WAREHOUSE_PROC,RNDS,WNDS);

FUNCTION GET_WAREHOUSE_FUNC
RETURN VARCHAR2;
PRAGMA RESTRICT_REFERENCES (GET_WAREHOUSE_FUNC,RNDS,WNDS);

END PRW_OPERATION_PACK;
/