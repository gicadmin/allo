CREATE OR REPLACE PACKAGE phenix.PLM_PACK IS

PROCEDURE INSERT_INTO_PLM_PROC (
  p_use_code   	IN NUMBER,
	p_prd_code   	IN VARCHAR2,
	p_fmt_code   	IN VARCHAR2,
	p_whs_code   	IN VARCHAR2,
	p_name_chp   	IN VARCHAR2,
	p_befr_mod   	IN VARCHAR2,
	p_aftr_mod   	IN VARCHAR2,
	p_mod_source 	IN VARCHAR2,
	p_ven_code		IN NUMBER	DEFAULT NULL	--EFE81 si c'est un VPD qui est modifié
);

FUNCTION DELETE_PRODUCT_LOG_FUNC
RETURN NUMBER;

PROCEDURE CHECK_IF_CHANGED_PRD_NUM_PROC(
	p_prd_code 		IN VARCHAR2,
	p_source			IN VARCHAR2,
	p_field_name	IN VARCHAR2,
	p_old_value 	IN NUMBER,
	p_new_value 	IN NUMBER,
	p_fmt_code		IN VARCHAR DEFAULT NULL,
	p_whs_code		IN VARCHAR DEFAULT NULL,
	p_use_code		IN NUMBER DEFAULT 99999,
	p_ven_code		IN NUMBER	DEFAULT NULL		--EFE81 si c'est un VPD qui est modifié
);

PROCEDURE CHECK_IF_CHANGED_PRD_CHR_PROC(
	p_prd_code 		IN VARCHAR2,
	p_source			IN VARCHAR2,
	p_field_name	IN VARCHAR2,
	p_old_value 	IN VARCHAR2,
	p_new_value 	IN VARCHAR2,
	p_fmt_code		IN VARCHAR DEFAULT NULL,
	p_whs_code		IN VARCHAR DEFAULT NULL,
	p_use_code		IN NUMBER DEFAULT 99999,
	p_ven_code		IN NUMBER	DEFAULT NULL		--EFE81 si c'est un VPD qui est modifié
);

PROCEDURE CHECK_IF_CHANGED_PRD_DATE_PROC(
	p_prd_code 		IN VARCHAR2,
	p_source			IN VARCHAR2,
	p_field_name	IN VARCHAR2,
	p_old_value 	IN DATE,
	p_new_value 	IN DATE,
	p_fmt_code		IN VARCHAR DEFAULT NULL,
	p_whs_code		IN VARCHAR DEFAULT NULL,
	p_use_code		IN NUMBER DEFAULT 99999,
	p_ven_code		IN NUMBER	DEFAULT NULL		--EFE81 si c'est un VPD qui est modifié
);

PROCEDURE CHECK_IF_CHANGED_PRD_FLO_PROC( --BER3659
	p_prd_code 		IN VARCHAR2,
	p_source			IN VARCHAR2,
	p_field_name	IN VARCHAR2,
	p_old_value 	IN NUMBER,
	p_new_value 	IN NUMBER,
	p_fmt_code		IN VARCHAR  DEFAULT NULL,
	p_whs_code		IN VARCHAR  DEFAULT NULL,
	p_use_code		IN NUMBER   DEFAULT 99999,
	p_ven_code		IN NUMBER	  DEFAULT NULL,		--EFE81 si c'est un VPD qui est modifié
  p_mask_format IN VARCHAR2 DEFAULT NULL -- mask pour l'affichage ds le rapport...
);

PROCEDURE GET_CONTEXT_USER_SOURCE_PROC(   --ber3659
		p_use_code      OUT NUMBER,
    p_source        OUT VARCHAR2
);

PROCEDURE SET_CONTEXT_USE_SOURCE_PROC(   --ber3659
    p_use_code      IN NUMBER,
		p_source        IN VARCHAR2
);

PROCEDURE RESET_CONTEXT_USE_SOURCE_PROC;     --ber3659

END PLM_PACK;
/