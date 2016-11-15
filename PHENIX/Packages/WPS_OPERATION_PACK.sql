CREATE OR REPLACE PACKAGE phenix.WPS_OPERATION_PACK AS

PROCEDURE UPDATE_PROC(
  p_source_type       IN VARCHAR2,      --PID (pick/returns)  RTD (receipt/rma)  ICT (décompte)
  p_prd_code          IN products.prd_code%TYPE,
  p_fmt_code          IN formats.fmt_code%TYPE,
  p_whs_code          IN warehouses.whs_code%TYPE,
  p_transaction_type  IN VARCHAR2,      --pour PID: C (Customer)  V (Vendor)   pour RTD:  P (PO)  R (RMA)   pour ICT: null ou n'importe quoi
  p_quantity          IN NUMBER,
  p_weight            IN NUMBER,
  p_date              IN DATE
);

FUNCTION FIND_END_ON_HAND_FUNC(
  p_prd_code        IN VARCHAR2,
  p_whs_code        IN VARCHAR2,
	p_fcw_fca_year 		IN fiscal_calendar_weeks.fcw_fca_year%TYPE,
	p_fcw_fca_period	IN fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_week				IN fiscal_calendar_weeks.fcw_week%TYPE
)
RETURN NUMBER;

FUNCTION FIND_START_ON_HAND_FUNC(
  p_prd_code        IN VARCHAR2,
  p_whs_code        IN VARCHAR2,
	p_fcw_fca_year 		IN fiscal_calendar_weeks.fcw_fca_year%TYPE,
	p_fcw_fca_period	IN fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_week				IN fiscal_calendar_weeks.fcw_week%TYPE
)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_wps_prw_prd_code IN weekly_product_summaries.wps_prw_prd_code%TYPE
);

END WPS_OPERATION_PACK;
/