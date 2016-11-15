CREATE OR REPLACE PACKAGE phenix.WPC_OPERATION_PACK IS

FUNCTION GET_WPC_EFFECTIVE_DATE_FUNC(
  p_wpc_prw_prd_code   IN  warehouse_price_changes.wpc_prw_prd_code%TYPE,
  p_cus_code           IN  customers.cus_code%TYPE,
  p_wpc_effective_date IN  warehouse_price_changes.wpc_effective_date%TYPE,
  p_wpc_rec            OUT warehouse_price_changes%ROWTYPE
) RETURN BOOLEAN;

PROCEDURE PURGE_PROC(
  p_wpc_prw_prd_code IN warehouse_price_changes.wpc_prw_prd_code%TYPE
);

--BEA238  fonction pour trouver un price change futur d'ajout de transport, mais avant une date donnée
FUNCTION FIND_ADDED_TRANSPORT_FUNC(
  p_whs_code                  IN VARCHAR2,
  p_prd_code                  IN VARCHAR2,
  p_to_date                   IN DATE,
  p_wpc_added_transp_amount   IN OUT NUMBER --renvoie l'ajout de transport des futurs price change (AU FORMAT D''INVENTAIRE!!)
)
RETURN BOOLEAN;

END WPC_OPERATION_PACK;
/