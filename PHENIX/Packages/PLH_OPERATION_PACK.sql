CREATE OR REPLACE PACKAGE phenix.PLH_OPERATION_PACK IS

--gic1700 procédure créer pour le SGE Phenix
PROCEDURE CREATE_TPC_COT_TO_ZERO_PROC(
  p_log_id IN NUMBER
);

--gic1700 procédure créer pour le SGE Phenix
PROCEDURE VALIDATE_SHORT_FOR_IDT_PROC(
  p_log_id IN NUMBER
);

--BER590 procédure pour le chargement de conteneur
--validation s'il reste toujours des conteneurs pas chargé pour la cueillette
FUNCTION IS_PLH_COMPLETED_FOR_IDT_FUNC(
  p_plh_id IN NUMBER
)
RETURN NUMBER;  --1 = completed  0 = pas completed

--BER590 procédure créer pour le SGE Phenix
PROCEDURE VALIDATE_SHRT_FOR_TRANSIT_PROC(
  p_log_id IN NUMBER
);

FUNCTION VALIDATE_PLH_FOR_TRANSIT_FUNC(
  p_plh_id          IN NUMBER,
  p_language_flag   IN VARCHAR2,
  p_error_message   OUT VARCHAR2
)
RETURN BOOLEAN;

--CSC4253 procédure créer pour le SGE Phenix
--presque pareil comme CUSTOMER_INVOICE_PACK.CREATE_TPC_COT_TO_ZERO_PROC
--appeller seulement pour les identifiants... alors pas besoin de valider la switch
FUNCTION VALIDATE_COT_PER_PLH_FUNC(
  p_plh_id              IN NUMBER,
  p_shh_trailer_number  IN VARCHAR2,
  p_language_flag       IN VARCHAR2,--CSC3429
  p_vocal_switch        IN NUMBER,  --CSC3429
  p_ccr_code            OUT NUMBER,
  p_ccr_message         OUT VARCHAR2 --CSC3429
)
RETURN PLS_INTEGER;

PROCEDURE PURGE_PROC(
  p_plh_id  IN  pick_list_headers.plh_id%TYPE
);

FUNCTION EXIST_OPEN_CUS_FUNC (
  p_plh_cus_code  IN pick_list_headers.plh_cus_code%TYPE)
RETURN NUMBER;

FUNCTION EXISTS_CUS_ROU_DATE_FUNC(
  p_plh_cus_code                 IN pick_list_headers.plh_cus_code%TYPE,
  p_plh_delivery_rou_code        IN pick_list_headers.plh_delivery_rou_code%TYPE,
  p_plh_date_generated           IN pick_list_headers.plh_date_generated%TYPE
)
RETURN BOOLEAN;

FUNCTION EXISTS_UNCLOSED_FUNC(
  p_plh_cus_code                 IN pick_list_headers.plh_cus_code%TYPE,
  p_plh_delivery_rou_code        IN pick_list_headers.plh_delivery_rou_code%TYPE,
  p_plh_date_generated           IN pick_list_headers.plh_date_generated%TYPE,
  p_whs_delivery_code            IN pick_list_headers.plh_whs_delivery_code%TYPE
)
RETURN BOOLEAN;

--ber4898 trouver le nombre de livraison ayant eu lieu au cours d'une semaine fiscale (même si la date de facture n'est pas dans la même semaine)
FUNCTION CALC_NB_DELIV_FOR_WEEK_FUNC(
  p_cus_code        IN weekly_customer_stats.wcs_cus_code%TYPE,
  p_fcw_fca_year    IN fiscal_calendar_weeks.fcw_fca_year%TYPE,
  p_fcw_fca_period  IN fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_week        IN fiscal_calendar_weeks.fcw_week%TYPE
)
RETURN NUMBER;

--ber4898 fonction pour trouver la date de livraison d'une facture (même si le inh_route_date est p-ê encore null)
FUNCTION FIND_DELIVERY_DATE_FUNC(
  p_inh_id IN NUMBER
)
RETURN DATE;

END PLH_OPERATION_PACK;
/