CREATE OR REPLACE PACKAGE phenix.STAT_DIRECT_LINK_PACK IS
PROCEDURE GEN_DIRECT_LINK_STATS_PROC
 (P_JSC_ID IN number ) ;
PROCEDURE EXTRACT_DIRECT_LINK_STATS_PROC(
	p_from_date	IN DATE,
	p_to_date		IN DATE,
	p_whs_code 	IN VARCHAR2,
	p_whs_name 	IN VARCHAR2);
END STAT_DIRECT_LINK_PACK;
/