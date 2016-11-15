CREATE OR REPLACE PACKAGE phenix.VLM_PACK IS

PROCEDURE INSERT_INTO_VLM_PROC (
  p_use_code   		    IN NUMBER,
	p_ven_code   		    IN NUMBER,
	p_name_fld   		    IN VARCHAR2,
	p_befr_mod   		    IN VARCHAR2,
	p_aftr_mod   		    IN VARCHAR2,
	p_mod_source 		    IN VARCHAR2,
	p_address_type	    IN VARCHAR2 DEFAULT NULL,
	p_category   		    IN VARCHAR2 DEFAULT NULL,
	p_whs_code   		    IN VARCHAR2 DEFAULT NULL,
	p_vlm_dit_code      IN NUMBER   DEFAULT NULL, --csc8216
  p_vlm_edi_code      IN NUMBER   DEFAULT NULL, --gcl9332
  p_vlm_vmt_id        IN NUMBER   DEFAULT NULL,
  p_vlm_con_id        IN NUMBER   DEFAULT NULL,
  p_vlm_vwg_pgr_code  IN NUMBER   DEFAULT NULL,
  p_vlm_vcl_id        IN NUMBER   DEFAULT NULL,
  p_vlm_tec_id        IN NUMBER   DEFAULT NULL,
  p_vlm_vfe_fmt_code  IN VARCHAR2 DEFAULT NULL,
  p_vlm_dcs_cus_code  IN NUMBER   DEFAULT NULL,
  p_vlm_vpra_id       IN NUMBER   DEFAULT NULL
);

FUNCTION DELETE_VENDOR_LOG_FUNC
RETURN NUMBER;

PROCEDURE CHECK_IF_CHANGED_VEN_PROC(
  p_ven_code          IN NUMBER,
  p_mod_source        IN VARCHAR2,
  p_field_name        IN VARCHAR2,
  p_old_value         IN NUMBER,
  p_new_value         IN NUMBER,
  p_use_code          IN NUMBER DEFAULT 99999,
  p_address_type      IN VARCHAR2 DEFAULT NULL,
  p_category          IN VARCHAR2 DEFAULT NULL,
  p_whs_code          IN VARCHAR2 DEFAULT NULL,
  p_vlm_dit_code      IN NUMBER DEFAULT NULL,   --csc8216
  p_vlm_edi_code      IN NUMBER   DEFAULT NULL, --gcl9332
  p_vlm_vmt_id        IN NUMBER   DEFAULT NULL,
  p_vlm_con_id        IN NUMBER   DEFAULT NULL,
  p_vlm_vwg_pgr_code  IN NUMBER   DEFAULT NULL,
  p_vlm_vcl_id        IN NUMBER   DEFAULT NULL,
  p_vlm_tec_id        IN NUMBER   DEFAULT NULL,
  p_vlm_vfe_fmt_code  IN VARCHAR2 DEFAULT NULL,
  p_vlm_dcs_cus_code  IN NUMBER   DEFAULT NULL,
  p_vlm_vpra_id       IN NUMBER   DEFAULT NULL
);

PROCEDURE CHECK_IF_CHANGED_VEN_PROC(
  p_ven_code          IN NUMBER,
  p_mod_source        IN VARCHAR2,
  p_field_name        IN VARCHAR2,
  p_old_value         IN VARCHAR2,
  p_new_value         IN VARCHAR2,
  p_use_code          IN NUMBER DEFAULT 99999,
	p_address_type      IN VARCHAR2 DEFAULT NULL,
	p_category          IN VARCHAR2 DEFAULT NULL,
	p_whs_code          IN VARCHAR2 DEFAULT NULL,
	p_vlm_dit_code      IN NUMBER DEFAULT NULL,   --csc8216
  p_vlm_edi_code      IN NUMBER   DEFAULT NULL, --gcl9332
  p_vlm_vmt_id        IN NUMBER   DEFAULT NULL,
  p_vlm_con_id        IN NUMBER   DEFAULT NULL,
  p_vlm_vwg_pgr_code  IN NUMBER   DEFAULT NULL,
  p_vlm_vcl_id        IN NUMBER   DEFAULT NULL,
  p_vlm_tec_id        IN NUMBER   DEFAULT NULL,
  p_vlm_vfe_fmt_code  IN VARCHAR2 DEFAULT NULL,
  p_vlm_dcs_cus_code  IN NUMBER   DEFAULT NULL,
  p_vlm_vpra_id       IN NUMBER   DEFAULT NULL
);

PROCEDURE CHECK_IF_CHANGED_VEN_PROC(
  p_ven_code          IN NUMBER,
  p_mod_source        IN VARCHAR2,
  p_field_name        IN VARCHAR2,
  p_old_value         IN DATE,
  p_new_value         IN DATE,
  p_use_code          IN NUMBER DEFAULT 99999,
	p_address_type      IN VARCHAR2 DEFAULT NULL,
	p_category          IN VARCHAR2 DEFAULT NULL,
	p_whs_code          IN VARCHAR2 DEFAULT NULL,
	p_vlm_dit_code      IN NUMBER DEFAULT NULL,   --csc8216
  p_vlm_edi_code      IN NUMBER   DEFAULT NULL, --gcl9332
  p_vlm_vmt_id        IN NUMBER   DEFAULT NULL,
  p_vlm_con_id        IN NUMBER   DEFAULT NULL,
  p_vlm_vwg_pgr_code  IN NUMBER   DEFAULT NULL,
  p_vlm_vcl_id        IN NUMBER   DEFAULT NULL,
  p_vlm_tec_id        IN NUMBER   DEFAULT NULL,
  p_vlm_vfe_fmt_code  IN VARCHAR2 DEFAULT NULL,
  p_vlm_dcs_cus_code  IN NUMBER   DEFAULT NULL,
  p_vlm_vpra_id       IN NUMBER   DEFAULT NULL
);


PROCEDURE GET_CONTEXT_USER_SOURCE_PROC(
		p_use_code      OUT NUMBER,
    p_source        OUT VARCHAR2
);

PROCEDURE SET_CONTEXT_USE_SOURCE_PROC(
    p_use_code      IN NUMBER,
		p_source        IN VARCHAR2
);

FUNCTION IS_DEFAULT_CONTEXT_FUNC
    RETURN BOOLEAN;

PROCEDURE RESET_CONTEXT_USE_SOURCE_PROC;

END VLM_PACK;
/