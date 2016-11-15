CREATE OR REPLACE PACKAGE phenix.CLM_OPERATION_PACK IS

PROCEDURE CHECK_IF_CHANGED_PROC(
  p_cus_code              IN NUMBER,
	p_mod_source            IN VARCHAR2,
  p_field_name            IN VARCHAR2,
  p_old_value             IN NUMBER,
  p_new_value             IN NUMBER,
  p_use_code              IN NUMBER DEFAULT 99999,
  p_clm_edi_code          IN NUMBER    DEFAULT NULL, --gcl9332
  p_clm_cmt_id            IN NUMBER    DEFAULT NULL,
  p_clm_con_id            IN NUMBER    DEFAULT NULL,
  p_clm_rou_code          IN NUMBER    DEFAULT NULL,
  p_clm_vcl_id            IN NUMBER    DEFAULT NULL,
  p_clm_tec_id            IN NUMBER    DEFAULT NULL,
  p_clm_pty_code          IN NUMBER    DEFAULT NULL,
  p_clm_ctt_code          IN NUMBER    DEFAULT NULL,
  p_clm_cuc_prf_prd_code  IN VARCHAR2  DEFAULT NULL,
  p_clm_cuc_prf_fmt_code  IN VARCHAR2  DEFAULT NULL,
  p_clm_cls_code          IN NUMBER    DEFAULT NULL,
  p_clm_crc_id            IN NUMBER    DEFAULT NULL,
  p_clm_cva_id            IN NUMBER    DEFAULT NULL,
  p_clm_sch_code          IN NUMBER    DEFAULT NULL,
  p_clm_doc_code          IN NUMBER    DEFAULT NULL
);

PROCEDURE CHECK_IF_CHANGED_PROC(
  p_cus_code              IN NUMBER,
	p_mod_source            IN VARCHAR2,
  p_field_name            IN VARCHAR2,
  p_old_value             IN VARCHAR2,
  p_new_value             IN VARCHAR2,
  p_use_code              IN NUMBER DEFAULT 99999,
  p_clm_edi_code          IN NUMBER    DEFAULT NULL, --gcl9332
  p_clm_cmt_id            IN NUMBER    DEFAULT NULL,
  p_clm_con_id            IN NUMBER    DEFAULT NULL,
  p_clm_rou_code          IN NUMBER    DEFAULT NULL,
  p_clm_vcl_id            IN NUMBER    DEFAULT NULL,
  p_clm_tec_id            IN NUMBER    DEFAULT NULL,
  p_clm_pty_code          IN NUMBER    DEFAULT NULL,
  p_clm_ctt_code          IN NUMBER    DEFAULT NULL,
  p_clm_cuc_prf_prd_code  IN VARCHAR2  DEFAULT NULL,
  p_clm_cuc_prf_fmt_code  IN VARCHAR2  DEFAULT NULL,
  p_clm_cls_code          IN NUMBER    DEFAULT NULL,
  p_clm_crc_id            IN NUMBER    DEFAULT NULL,
  p_clm_cva_id            IN NUMBER    DEFAULT NULL,
  p_clm_sch_code          IN NUMBER    DEFAULT NULL ,
  p_clm_doc_code          IN NUMBER    DEFAULT NULL
);

PROCEDURE CHECK_IF_CHANGED_PROC(
  p_cus_code              IN NUMBER,
	p_mod_source            IN VARCHAR2,
  p_field_name            IN VARCHAR2,
  p_old_value             IN DATE,
  p_new_value             IN DATE,
  p_use_code              IN NUMBER DEFAULT 99999,
  p_clm_edi_code          IN NUMBER    DEFAULT NULL, --gcl9332
  p_clm_cmt_id            IN NUMBER    DEFAULT NULL,
  p_clm_con_id            IN NUMBER    DEFAULT NULL,
  p_clm_rou_code          IN NUMBER    DEFAULT NULL,
  p_clm_vcl_id            IN NUMBER    DEFAULT NULL,
  p_clm_tec_id            IN NUMBER    DEFAULT NULL,
  p_clm_pty_code          IN NUMBER    DEFAULT NULL,
  p_clm_ctt_code          IN NUMBER    DEFAULT NULL,
  p_clm_cuc_prf_prd_code  IN VARCHAR2  DEFAULT NULL,
  p_clm_cuc_prf_fmt_code  IN VARCHAR2  DEFAULT NULL,
  p_clm_cls_code          IN NUMBER    DEFAULT NULL,
  p_clm_crc_id            IN NUMBER    DEFAULT NULL,
  p_clm_cva_id            IN NUMBER    DEFAULT NULL,
  p_clm_sch_code          IN NUMBER    DEFAULT NULL,
  p_clm_doc_code          IN NUMBER    DEFAULT NULL
);

FUNCTION CHECK_IF_CHANGED_FUNC(
  p_cus_code              IN NUMBER,
  p_mod_source            IN VARCHAR2,
  p_field_name            IN VARCHAR2,
  p_old_value             IN NUMBER,
  p_new_value             IN NUMBER,
  p_use_code              IN NUMBER DEFAULT 99999,
  p_clm_edi_code          IN NUMBER    DEFAULT NULL, --gcl9332
  p_clm_cmt_id            IN NUMBER    DEFAULT NULL,
  p_clm_con_id            IN NUMBER    DEFAULT NULL,
  p_clm_rou_code          IN NUMBER    DEFAULT NULL,
  p_clm_vcl_id            IN NUMBER    DEFAULT NULL,
  p_clm_tec_id            IN NUMBER    DEFAULT NULL,
  p_clm_pty_code          IN NUMBER    DEFAULT NULL,
  p_clm_ctt_code          IN NUMBER    DEFAULT NULL,
  p_clm_cuc_prf_prd_code  IN VARCHAR2  DEFAULT NULL,
  p_clm_cuc_prf_fmt_code  IN VARCHAR2  DEFAULT NULL,
  p_clm_cls_code          IN NUMBER    DEFAULT NULL,
  p_clm_crc_id            IN NUMBER    DEFAULT NULL,
  p_clm_cva_id            IN NUMBER    DEFAULT NULL,
  p_clm_sch_code          IN NUMBER    DEFAULT NULL,
  p_clm_doc_code          IN NUMBER    DEFAULT NULL
) RETURN NUMBER;

FUNCTION CHECK_IF_CHANGED_FUNC(
  p_cus_code              IN NUMBER,
  p_mod_source            IN VARCHAR2,
  p_field_name            IN VARCHAR2,
  p_old_value             IN VARCHAR2,
  p_new_value             IN VARCHAR2,
  p_use_code              IN NUMBER DEFAULT 99999,
  p_clm_edi_code          IN NUMBER    DEFAULT NULL, --gcl9332
  p_clm_cmt_id            IN NUMBER    DEFAULT NULL,
  p_clm_con_id            IN NUMBER    DEFAULT NULL,
  p_clm_rou_code          IN NUMBER    DEFAULT NULL,
  p_clm_vcl_id            IN NUMBER    DEFAULT NULL,
  p_clm_tec_id            IN NUMBER    DEFAULT NULL,
  p_clm_pty_code          IN NUMBER    DEFAULT NULL,
  p_clm_ctt_code          IN NUMBER    DEFAULT NULL,
  p_clm_cuc_prf_prd_code  IN VARCHAR2  DEFAULT NULL,
  p_clm_cuc_prf_fmt_code  IN VARCHAR2  DEFAULT NULL,
  p_clm_cls_code          IN NUMBER    DEFAULT NULL,
  p_clm_crc_id            IN NUMBER    DEFAULT NULL,
  p_clm_cva_id            IN NUMBER    DEFAULT NULL ,
  p_clm_sch_code          IN NUMBER    DEFAULT NULL,
  p_clm_doc_code          IN NUMBER    DEFAULT NULL
) RETURN NUMBER;

FUNCTION CHECK_IF_CHANGED_FUNC(
  p_cus_code              IN NUMBER,
  p_mod_source            IN VARCHAR2,
  p_field_name            IN VARCHAR2,
  p_old_value             IN DATE,
  p_new_value             IN DATE,
  p_use_code              IN NUMBER DEFAULT 99999,
  p_clm_edi_code          IN NUMBER    DEFAULT NULL, --gcl9332
  p_clm_cmt_id            IN NUMBER    DEFAULT NULL,
  p_clm_con_id            IN NUMBER    DEFAULT NULL,
  p_clm_rou_code          IN NUMBER    DEFAULT NULL,
  p_clm_vcl_id            IN NUMBER    DEFAULT NULL,
  p_clm_tec_id            IN NUMBER    DEFAULT NULL,
  p_clm_pty_code          IN NUMBER    DEFAULT NULL,
  p_clm_ctt_code          IN NUMBER    DEFAULT NULL,
  p_clm_cuc_prf_prd_code  IN VARCHAR2  DEFAULT NULL,
  p_clm_cuc_prf_fmt_code  IN VARCHAR2  DEFAULT NULL,
  p_clm_cls_code          IN NUMBER    DEFAULT NULL,
  p_clm_crc_id            IN NUMBER    DEFAULT NULL,
  p_clm_cva_id            IN NUMBER    DEFAULT NULL,
  p_clm_sch_code          IN NUMBER    DEFAULT NULL,
  p_clm_doc_code          IN NUMBER    DEFAULT NULL
) RETURN NUMBER;

PROCEDURE INSERT_CON_PROC(
  p_use_code                      IN NUMBER,
  p_module                        IN VARCHAR2,
  p_con_id                        IN NUMBER,
  p_con_cty_code                  IN VARCHAR2,
  p_con_first_name                IN VARCHAR2,
  p_con_last_name                 IN VARCHAR2,
  p_con_ven_cus_code              IN NUMBER,
  p_con_email                     IN VARCHAR2,
  p_con_extension                 IN NUMBER,
  p_con_extension_2               IN NUMBER,
  p_con_fax                       IN NUMBER,
  p_con_remark                    IN VARCHAR2,
  p_con_telephone                 IN NUMBER,
  p_con_telephone_2               IN NUMBER,
  p_con_print_badge_report_swi    IN NUMBER
 );

PROCEDURE DELETE_CON_PROC(
  p_use_code                      IN NUMBER,
  p_module                        IN VARCHAR2,
  p_con_id                        IN NUMBER,
  p_con_cty_code                  IN VARCHAR2,
  p_con_first_name                IN VARCHAR2,
  p_con_last_name                 IN VARCHAR2,
  p_con_ven_cus_code              IN NUMBER,
  p_con_email                     IN VARCHAR2,
  p_con_extension                 IN NUMBER,
  p_con_extension_2               IN NUMBER,
  p_con_fax                       IN NUMBER,
  p_con_remark                    IN VARCHAR2,
  p_con_telephone                 IN NUMBER,
  p_con_telephone_2               IN NUMBER,
  p_con_print_badge_report_swi    IN NUMBER
);
PROCEDURE MODIF_CON_PROC(
  p_use_code                      IN NUMBER,
  p_module                        IN VARCHAR2,
  p_old_con_id                    IN NUMBER,
  p_old_con_cty_code              IN VARCHAR2,
  p_old_con_first_name            IN VARCHAR2,
  p_old_con_last_name             IN VARCHAR2,
  p_old_con_ven_cus_code          IN NUMBER,
  p_old_con_email                 IN VARCHAR2,
  p_old_con_extension             IN NUMBER,
  p_old_con_extension_2           IN NUMBER,
  p_old_con_fax                   IN NUMBER,
  p_old_con_remark                IN VARCHAR2,
  p_old_con_telephone             IN NUMBER,
  p_old_con_telephone_2           IN NUMBER,
  p_old_con_print_badge_report_s  IN NUMBER,
  p_new_con_cty_code              IN VARCHAR2,
  p_new_con_first_name            IN VARCHAR2,
  p_new_con_last_name             IN VARCHAR2,
  p_new_con_email                 IN VARCHAR2,
  p_new_con_extension             IN NUMBER,
  p_new_con_extension_2           IN NUMBER,
  p_new_con_fax                   IN NUMBER,
  p_new_con_remark                IN VARCHAR2,
  p_new_con_telephone             IN NUMBER,
  p_new_con_telephone_2           IN NUMBER,
  p_new_con_print_badge_report_s  IN NUMBER
  );

END CLM_OPERATION_PACK;
/