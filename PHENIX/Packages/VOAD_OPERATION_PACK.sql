CREATE OR REPLACE PACKAGE phenix.VOAD_OPERATION_PACK IS

FUNCTION GET_FULL_CURRENT_CUS_PRF_FUNC(
  p_voad_voah_id                   IN         vend_order_agreement_details.voad_voah_id%TYPE,
  p_voad_cus_code                  IN         vend_order_agreement_details.voad_cus_code%TYPE,
  p_voad_prf_prd_code              IN         vend_order_agreement_details.voad_prf_prd_code%TYPE,
  p_voad_prf_fmt_code              IN         vend_order_agreement_details.voad_prf_fmt_code%TYPE,
  p_voad_rec                       OUT NOCOPY vend_order_agreement_details%ROWTYPE
)
RETURN BOOLEAN;

PROCEDURE IMPORT_OA_TPA_PROC(
  p_jsc_id IN NUMBER
);

FUNCTION IS_THERE_AGREEMENT_FUNC(
  p_cus_code          IN NUMBER,
  p_prf_prd_code      IN VARCHAR2,
  p_prf_fmt_code      IN VARCHAR2,
  p_start_date        IN DATE DEFAULT SYSDATE
)
RETURN BOOLEAN;

FUNCTION IS_THERE_VOAD_FUNC(
  p_cus_code          IN NUMBER,
  p_prd_code      IN VARCHAR2,
  p_start_date        IN DATE DEFAULT SYSDATE
)
RETURN BOOLEAN;

PROCEDURE SEND_REJECT_EMAIL_PROC(
  p_ven_code  IN NUMBER,
  p_log_id    IN NUMBER
);

--Procédure pour calculer les montants à mettre dans le cod vendor reclaim amount
PROCEDURE CALCULATE_TOTAL_AGREEMENT_PROC(
  p_coh_cus_code          IN NUMBER,
  p_cod_coh_id            IN NUMBER,            --devra etre rempli si on veut lié les réclamations à un COD
  p_cod_line_number       IN NUMBER,            --devra etre rempli si on veut lié les réclamations à un COD
  p_cad_id                IN NUMBER,
  p_cod_prf_prd_code      IN VARCHAR2,
  p_cod_prf_fmt_code      IN VARCHAR2,
  p_total_agreement_found OUT NUMBER,
  p_do_commit             IN NUMBER DEFAULT 0,  --indique si on veut que la procédure commit toute seule
  p_do_delete_first       IN NUMBER DEFAULT 1,  --indique si on veut débuter la procédure en s'assurant qu'il ne reste pas déjà d'autre VOAR pour la ligne
  p_only_add_total        IN NUMBER DEFAULT 0,  --indique si on veut seulement trouvé le total des réclamations, ou si on veut inserer aussi
  p_start_date            IN DATE DEFAULT SYSDATE --indique la date à traiter... en général ca devrait être sysdate
);

PROCEDURE PURGE_PROC(
  p_voad_prf_prd_code IN vend_order_agreement_details.voad_prf_prd_code%TYPE,
  p_voad_prf_fmt_code IN vend_order_agreement_details.voad_prf_fmt_code%TYPE
);

END VOAD_OPERATION_PACK;
/