CREATE OR REPLACE PACKAGE phenix.UPDATE_CUSTOMER_PACK IS

PROCEDURE UPDATE_CUSTOMER_CHARGE_PROC
 (P_JSC_ID IN number
 );

PROCEDURE UPDATE_FSG_CODE_PROC
 (p_log_id     IN NUMBER,
  p_old_value  IN NUMBER,
  p_new_value  IN NUMBER,
	p_use_code   IN NUMBER,
	p_sommaire   OUT VARCHAR2
 );

PROCEDURE UPDATE_DCG_CODE_PROC
 (p_log_id     IN NUMBER,
  p_old_value  IN NUMBER,
  p_new_value  IN NUMBER,
	p_use_code   IN NUMBER,
	p_sommaire   OUT VARCHAR2
 );

PROCEDURE UPDATE_DELIVERY_CHARGE_PROC
 (p_log_id     IN NUMBER,
  p_old_value  IN NUMBER,
  p_new_value  IN NUMBER,
	p_use_code   IN NUMBER,
	p_sommaire   OUT VARCHAR2
 );

PROCEDURE UPDATE_HANDLING_AMOUNT_PROC
 (p_log_id     IN NUMBER,
  p_old_value  IN NUMBER,
  p_new_value  IN NUMBER,
	p_use_code   IN NUMBER,
	p_sommaire   OUT VARCHAR2
 );

PROCEDURE UPDATE_TRANS_CONTRIBUTION_PROC
 (p_log_id     IN NUMBER,
  p_old_value  IN NUMBER,
  p_new_value  IN NUMBER,
	p_use_code   IN NUMBER,
	p_sommaire   OUT VARCHAR2
 );

PROCEDURE UPDATE_MIN_DELIV_CHARGE_PROC
 (p_log_id     IN NUMBER,
  p_old_value  IN NUMBER,
  p_new_value  IN NUMBER,
	p_use_code   IN NUMBER,
	p_sommaire   OUT VARCHAR2
 );

PROCEDURE UPDATE_PROFIT_MIN_AMT_PROC
 (p_log_id     IN NUMBER,
  p_old_value  IN NUMBER,
  p_new_value  IN NUMBER,
	p_use_code   IN NUMBER,
	p_sommaire   OUT VARCHAR2
 );

PROCEDURE UPDATE_PROFIT_MIN_PERC_PROC
 (p_log_id     IN NUMBER,
  p_old_value  IN NUMBER,
  p_new_value  IN NUMBER,
	p_use_code   IN NUMBER,
	p_sommaire   OUT VARCHAR2
 );


END UPDATE_CUSTOMER_PACK;
 
/