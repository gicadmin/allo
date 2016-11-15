CREATE OR REPLACE PACKAGE phenix.VPR_PACK IS

PROCEDURE GET_BEST_PROMO_ANY_VEN_PROC(
	p_prd_code 				IN VARCHAR2,
	p_vpr_start_date 	OUT DATE,
	p_vpr_end_date		OUT DATE,
	p_vpr_amount_best	OUT NUMBER
);

PROCEDURE VENDOR_PROMO_PURGE_PROC(
	p_old_date		IN DATE,
	p_log_id 			IN NUMBER,
	p_pbd_deleted OUT NUMBER,
	p_vpr_deleted OUT NUMBER
);


END VPR_PACK;
 
/