CREATE OR REPLACE PACKAGE phenix.CLM_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_log_modifs%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_clm_id                  IN customer_log_modifs.clm_id%TYPE,
  p_clm_use_code            IN customer_log_modifs.clm_use_code%TYPE,
  p_clm_cus_code            IN customer_log_modifs.clm_cus_code%TYPE,
  p_clm_name_field          IN customer_log_modifs.clm_name_field%TYPE,
  p_clm_modification_date   IN customer_log_modifs.clm_modification_date%TYPE,
  p_clm_modification_source IN customer_log_modifs.clm_modification_source%TYPE,
  p_clm_befr_modif          IN customer_log_modifs.clm_befr_modif%TYPE         DEFAULT NULL,
  p_clm_after_modif         IN customer_log_modifs.clm_after_modif%TYPE        DEFAULT NULL,
  p_clm_edi_code            IN customer_log_modifs.clm_edi_code%TYPE           DEFAULT NULL, --gcl9332
  p_clm_cmt_id              IN customer_log_modifs.clm_cmt_id%TYPE             DEFAULT NULL,
  p_clm_con_id              IN customer_log_modifs.clm_con_id%TYPE             DEFAULT NULL,
  p_clm_rou_code            IN customer_log_modifs.clm_rou_code%TYPE           DEFAULT NULL,
  p_clm_vcl_id              IN customer_log_modifs.clm_vcl_id%TYPE             DEFAULT NULL,
  p_clm_tec_id              IN customer_log_modifs.clm_tec_id%TYPE             DEFAULT NULL,
  p_clm_pty_code              IN customer_log_modifs.clm_pty_code%TYPE         DEFAULT NULL,
  p_clm_ctt_code            IN customer_log_modifs.clm_ctt_code%TYPE           DEFAULT NULL,
  p_clm_cuc_prf_prd_code    IN customer_log_modifs.clm_cuc_prf_prd_code%TYPE   DEFAULT NULL,
  p_clm_cuc_prf_fmt_code    IN customer_log_modifs.clm_cuc_prf_fmt_code%TYPE   DEFAULT NULL,
  p_clm_cls_code            IN customer_log_modifs.clm_cls_code%TYPE           DEFAULT NULL,
  p_clm_crc_id              IN customer_log_modifs.clm_crc_id%TYPE             DEFAULT NULL,
  p_clm_cva_id              IN customer_log_modifs.clm_cva_id%TYPE             DEFAULT NULL,
  p_clm_sch_code            IN customer_log_modifs.clm_sch_code%TYPE           DEFAULT NULL,
  p_clm_doc_code            IN customer_log_modifs.clm_doc_code%TYPE           DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_log_modifs%ROWTYPE);

FUNCTION DELETE_CUSTOMER_LOG_FUNC
RETURN NUMBER;

PROCEDURE SET_CONTEXT_USE_SOURCE_PROC(
  p_use_code      IN NUMBER,
	p_source        IN VARCHAR2
);

PROCEDURE GET_CONTEXT_USER_SOURCE_PROC(
	p_use_code      OUT NUMBER,
  p_source        OUT VARCHAR2
);

FUNCTION IS_DEFAULT_CONTEXT_FUNC
  RETURN BOOLEAN;

PROCEDURE RESET_CONTEXT_USE_SOURCE_PROC;

END CLM_PACK;
/