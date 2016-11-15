CREATE OR REPLACE PACKAGE phenix.PHXWEB_PACK AS
/* Created by Tahar Amalou : Groupe Informatique Colabor 2009-11-26 */

FUNCTION URL_PHXWEB_CALL_DRILLDOWN_FUNC (
    p_user_Code          IN NUMBER
) RETURN VARCHAR2;

FUNCTION LOAD_DRILLDOWN_DATAS_FUNC (
   p_from_date           IN DATE,
   p_to_date             IN DATE,
   p_verified            IN NUMBER,
   p_coh_id              IN CUSTOMER_ORDER_HEADERS.COH_ID%TYPE,
   p_cus_code            IN CUSTOMERS.CUS_CODE%TYPE,
   p_use_telemark_code   IN USERS.USE_CODE%TYPE,
   p_inh_id              IN INVOICE_HEADERS.INH_ID%TYPE,
   p_prd_code            IN CUSTOMER_ORDER_DETAILS.COD_PRF_PRD_CODE%TYPE,
   p_whs_delivery        IN CUSTOMER_ORDER_HEADERS.COH_WHS_DELIVERY_CODE%TYPE
) RETURN SYS_REFCURSOR;

FUNCTION LOAD_MIN_MAX_TELE_PROF_FUNC RETURN SYS_REFCURSOR;

FUNCTION FIND_TOTAL_SAR_FUNC (p_coh_id           IN NUMBER,
                              p_cod_line_number  IN NUMBER,
                              p_cad_id           IN NUMBER DEFAULT NULL)
RETURN NUMBER;

PROCEDURE SET_RECONCILIATION_PROC(  p_coh_id                IN CUSTOMER_ORDER_HEADERS.coh_id%type,
                                    p_cod_line_number       IN CUSTOMER_ORDER_DETAILS.cod_line_number%type,
                                    p_use_code              IN USERS.use_code%type,
                                    p_reconciliation_date   IN DATE
);

PROCEDURE LOGIN_PROC (   phx_user IN USERS.use_login%type,
                         password IN USERS.use_password%type
);

FUNCTION GET_USER_FUNC(
     p_use_login     IN users.use_login%TYPE
) RETURN SYS_REFCURSOR;

FUNCTION GET_USER_FUNC(
    p_use_code      IN users.use_code%TYPE
) RETURN SYS_REFCURSOR;

FUNCTION AUTO_LOGIN_FUNC(
    p_param     IN VARCHAR2
) RETURN users.use_code%TYPE;

FUNCTION GET_PERIOD_START_DATE_FUNC
RETURN fiscal_calendars.fca_start_date%TYPE;

FUNCTION CHECK_SPJ_NAME_CONTEXT_FUNC (
    p_spj_name       IN SYSTEM_PROJECTS.SPJ_NAME%TYPE,
    p_spj_context    IN SYSTEM_PROJECTS.SPJ_CONTEXT%TYPE
) RETURN NUMBER;

FUNCTION GET_CONF_BY_NAME_CONTEXT_FUNC (
    p_spj_name       IN SYSTEM_PROJECTS.SPJ_NAME%TYPE,
    p_spj_context    IN SYSTEM_PROJECTS.SPJ_CONTEXT%TYPE
) RETURN SYS_REFCURSOR;

FUNCTION IS_DISCOUNT_FUNC (
  p_ncus_code           IN NUMBER,
  p_sprf_prd_code       IN VARCHAR2,
  p_sprf_fmt_code       IN VARCHAR2,
  p_nadmin_amount       IN OUT NUMBER,
  p_nadmin_percent      IN OUT NUMBER,
  p_npricing_strategy   IN OUT NUMBER,
  p_ncud_cost_used      IN OUT NUMBER --USG730
)
RETURN PLS_INTEGER;

FUNCTION GET_QUOTATION_ID_FUNC(
  p_ncus_code       IN NUMBER,
  p_sprf_prd_code   IN VARCHAR2,
  p_sprf_fmt_code   IN VARCHAR2,
  p_nprf_price      IN OUT NUMBER,
  p_srp_promo_price IN OUT NUMBER,
  p_pty_code        IN OUT NUMBER,
  p_car_amount      IN OUT NUMBER,
  p_srp_quantity    IN OUT NUMBER,
  p_srp_format      IN OUT VARCHAR2
)
RETURN NUMBER;

END PHXWEB_PACK;
/