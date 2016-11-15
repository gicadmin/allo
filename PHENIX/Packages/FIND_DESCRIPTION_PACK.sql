CREATE OR REPLACE PACKAGE phenix.FIND_DESCRIPTION_PACK IS

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_BRN_DESCRIPTION_FUNC(
	p_brn_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_BRN_MANUF_FUNC(
	p_prd_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_CAR_NAME_FUNC(
	p_car_code IN NUMBER
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_CCR_MESSAGE_FUNC(
	p_ccr_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_CLS_DESCRIPTION_FUNC(
	p_cls_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_CMD_DESCRIPTION_FUNC(
	p_cmd_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_CNS_DESCRIPTION_FUNC(
	p_cns_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_CTT_DESCRIPTION_FUNC(
	p_ctt_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_CUN_DESCRIPTION_FUNC(
	p_cun_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_CGR_DESCRIPTION_FUNC(
	p_cgr_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_CUS_NAME_FUNC(
	p_cus_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_DMR_DESCRIPTION_FUNC(
	p_dmr_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_DCG_DESCRIPTION_FUNC(
	p_dcg_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_DGT_DESCRIPTION_FUNC(
	p_dgt_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_DIT_DESCRIPTION_FUNC(
	p_dit_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_FSG_DESCRIPTION_FUNC(
	p_fsg_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_HAZ_DESCRIPTION_FUNC(
	p_haz_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_IAT_DESCRIPTION_FUNC(
	p_iat_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_LTY_DESCRIPTION_FUNC(
	p_lty_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_MNI_DESCRIPTION_FUNC(
	p_mni_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_MON_DESCRIPTION_FUNC(
	p_mon_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_NAC_DESCRIPTION_FUNC(
	p_nac_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_PPF_DESCRIPTION_FUNC(
	p_ppf_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_PRF_DESCRIPTION_FUNC(
	p_prf_prd_code IN VARCHAR2,
	p_prf_fmt_code IN VARCHAR2
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_PGR_DESCRIPTION_FUNC(
	p_pgr_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_PRD_DESCRIPTION_FUNC(
	p_prd_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_PTY_DESCRIPTION_FUNC(
	p_pty_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_PRV_NAME_FUNC(
	p_prv_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_QTY_DESCRIPTION_FUNC(
	p_qty_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_RAC_DESCRIPTION_FUNC(
	p_rac_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_RCM_NAME_FUNC(
	p_rcm_code IN NUMBER
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_RLT_DESCRIPTION_FUNC(
	p_rlt_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_RCT_DESCRIPTION_FUNC(
	p_rct_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_ROL_DESCRIPTION_FUNC(
	p_rol_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_ROU_DESCRIPTION_FUNC(
	p_rou_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_SCH_DESCRIPTION_FUNC(
	p_sch_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_SGR_DESCRIPTION_FUNC(
	p_sgr_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_SHR_DESCRIPTION_FUNC(
	p_shr_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_STT_DESCRIPTION_FUNC(
	p_stt_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_SRT_DESCRIPTION_FUNC(
	p_srt_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_TTY_DESCRIPTION_FUNC(
	p_tty_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_TRT_DESCRIPTION_FUNC(
	p_trt_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_TIP_DESCRIPTION_FUNC(
	p_tip_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_TOT_DESCRIPTION_FUNC(
	p_tot_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_USE_NAME_FUNC(
	p_use_code 								IN NUMBER,
	p_last_name_first_switch 	IN NUMBER DEFAULT 1
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_VCT_DESCRIPTION_FUNC(
	p_vct_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_VPD_DESCRIPTION_FUNC(
	p_vpd_ven_code 			IN NUMBER,									--on doit toujours remplir le VEN_CODE
	p_vpd_prd_code			IN VARCHAR2 DEFAULT NULL,		--on doit remplir le PRD_CODE ou le VPD_CODE
	p_vpd_code					IN VARCHAR2 DEFAULT NULL,		--on doit remplir le PRD_CODE ou le VPD_CODE
	p_language 					IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_VSA_DESCRIPTION_FUNC(
	p_vsa_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_VTS_DESCRIPTION_FUNC(
	p_vts_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_VEN_NAME_FUNC(
	p_ven_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_VRG_DESCRIPTION_FUNC(
	p_vrg_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_WHC_DESCRIPTION_FUNC(
	p_whc_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/

FUNCTION FIND_WHZ_DESCRIPTION_FUNC(
	p_whz_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/


FUNCTION FIND_NAME_OF_DAY_FUNC(
	p_day 			IN NUMBER,
	p_language 	IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

/*-------------------------------------------------------------------------------*/


END FIND_DESCRIPTION_PACK;
/