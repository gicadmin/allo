CREATE OR REPLACE PACKAGE phenix.VCT_OPERATION_PACK IS

PROCEDURE FIND_GL_VALUES_PROC(
  p_vct_code      IN VARCHAR2,
  p_prd_ven_code  IN NUMBER,
  p_whs_code      IN VARCHAR2,
  p_gl_account    OUT VARCHAR2,
  p_ap_ar_flag    OUT VARCHAR2
);

END VCT_OPERATION_PACK;
/