CREATE OR REPLACE PACKAGE phenix.PRINT_JOB_PACK IS

PROCEDURE SET_JOB_TO_PRINT_PROC(
	p_jsc_id IN  NUMBER
);

PROCEDURE REPRINT_REPORTS_PROC(
  p_route_code    IN NUMBER,
  p_date          IN DATE,
  p_whs_code      IN VARCHAR2,
  p_user          IN NUMBER
);

--BRC32 procédure BATCH_BATCH_SELECT_INVOICE_PROC va imprimer tous les types de factures,(note de crédit, drop, facture,BF,VA,VC,VD..)
--  pour un intervalle de date donné et qui les envoie à l'imprimante reçu en paramètre.
PROCEDURE BATCH_PRINT_INVOICES_PROC(
	p_jsc_id IN NUMBER
);

FUNCTION PRINT_RAP_FEUIL_DE_ROUTE_FUNC(
 p_use_code           IN users.use_code%TYPE,
 p_date               IN DATE,
 p_rou_min            IN NUMBER,
 p_rou_max            IN NUMBER,
 p_whs_delivery_code  IN warehouses.whs_code%TYPE,
  p_pro_name          IN VARCHAR2,
 p_language           IN VARCHAR2
) RETURN VARCHAR2;

FUNCTION PRINT_WMS_ROUTE_SHORT_FUNC(
  p_tro_rou_code    IN temporary_routes.tro_rou_code%TYPE,
  p_use_code        IN users.use_code%TYPE,
  p_date_livraison  IN DATE,
  p_language        IN VARCHAR2
) RETURN VARCHAR2;

PROCEDURE ACTIVATE_JOB_TO_PRINT_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

FUNCTION PRINT_RAP_FEUILL_DE_CHAR_PROC(
  p_tro_rou_code    IN temporary_routes.tro_rou_code%TYPE,
  p_use_code        IN users.use_code%TYPE,
  p_date_livraison  IN DATE,
  p_language        IN VARCHAR2
) RETURN VARCHAR2;

FUNCTION ADD_JOB_TO_PRINT_FUNC(
  p_use_code          IN users.use_code%TYPE,
  p_whs_delivery_code IN warehouses.whs_code%TYPE,
  p_route_date        IN DATE,
  p_route_min         IN NUMBER,
  p_route_max         IN NUMBER,
  p_route_type        IN VARCHAR2
)
RETURN NUMBER;

PROCEDURE SET_C_AND_C_JOB_TO_PRINT_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

FUNCTION ADD_C_AND_C_JOB_TO_PRINT_FUNC(
  p_cus_code IN customers.cus_code%TYPE,
  p_use_code IN users.use_code%TYPE,
  p_whs_code IN warehouses.whs_code%TYPE,
  p_cre_code IN cash_registers.cre_code%TYPE
)
RETURN NUMBER;

PROCEDURE GEN_ACCOUNT_FOR_ROUTE_PROC(
  p_rou_date      IN DATE,
  p_rou_type      IN routes.rou_type%TYPE,
  p_rou_whs_code  IN routes.rou_whs_delivery_code%TYPE,
  p_from_rou_code IN routes.rou_code%TYPE,
  p_to_rou_code   IN routes.rou_code%TYPE,
  p_use_code      IN users.use_code%TYPE
);

END PRINT_JOB_PACK;
/