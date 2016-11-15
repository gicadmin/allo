CREATE OR REPLACE PACKAGE phenix.ACCPAC_PACK IS

PROCEDURE AC_CALCULATE_AMOUNT_DUE_PROC (
  p_cus_code                 IN  NUMBER,
  p_amount_due               OUT NUMBER,
  p_head_office_amount_due   OUT NUMBER,
  p_amount_pass              OUT NUMBER,--fre2924
  p_head_office_amount_pass  OUT NUMBER --fre2924
);

PROCEDURE AR_CUSTOMER_ADJUSTMENT_PROC (
  p_invoice IN NUMBER
);

PROCEDURE AR_CUSTOMER_INVOICING_PROC (
  p_invoice IN NUMBER
);

PROCEDURE AP_VEND_INVOICE_MATCH_PROC (
  p_mah_ap_invoice_number IN NUMBER
);

PROCEDURE AR_AP_VENDOR_INVOICING_PROC (
  p_invoice        IN NUMBER,
  p_type_invoice   IN VARCHAR2,
  p_allow_rollback IN NUMBER DEFAULT 0,  --0 permet pas le rollback dans les exception.. 1 le permets
  p_va_type        IN VARCHAR2  DEFAULT NULL  --BER186 : 'P' ou 'R'... valeur utilisé seulement lors des inh de type 'VA' (vendor sales agreements)
);

PROCEDURE UPDATE_ACC_CUST_PROC (
  p_from_cus_code IN NUMBER,
  p_to_cus_code   IN NUMBER,
  p_update_code   IN VARCHAR2
);

PROCEDURE UPDATE_ACC_PROC (
  p_from_ven_code IN NUMBER,
  p_to_ven_code   IN NUMBER,
  p_update_code   IN VARCHAR2   --'A ' pour ajouter    'M' pour modifier ...
);

FUNCTION GET_CUSTOMER_AGEING_FUNC (
  p_cus_code                IN  NUMBER,
  p_term                    IN  VARCHAR2,
  p_include_unposted_switch IN  NUMBER,  --USG366
  p_amount_current          OUT NUMBER,  --USG366
  p_amount_1_to_7           OUT NUMBER,
  p_amount_8_to_14          OUT NUMBER,
  p_amount_15_to_21         OUT NUMBER,
  p_amount_22_to_28         OUT NUMBER,
  p_amount_29_plus          OUT NUMBER,
  p_postdated_checks_amount OUT NUMBER,
  p_credit_amount           OUT NUMBER,
  p_term_description        OUT VARCHAR2
)
RETURN NUMBER;

PROCEDURE LOAD_INITIAL_CUS_PROC (
  p_from_cus_code IN NUMBER,
  p_to_cus_code   IN NUMBER,
  p_update_code   IN VARCHAR2
);

FUNCTION FIND_AMOUNT_INVOICE (
  p_cus_code IN NUMBER
)
RETURN NUMBER;

--CVI64 fonction utilisée pour déterminé le bon compte GL lorsque le systeme post par territories seulement
--cvi105 Modifier la fonction pour prendre en compte les nouveaux comptes GL pour les coutants.
--les valeurs du paramétre p_transaction_type sont:
--  DR = drop,            CR = credit/débit,          SR = sales,
--  DC = drop_coutant,    CC = credit/débit_coutant,  SC = sales_coutant,
--  TI = etiquettes,      TR = transport
FUNCTION DETERMINE_GL_FUNC(
  p_transaction_type  IN VARCHAR2,
  p_cus_code          IN NUMBER,
  p_prd_code          IN VARCHAR2 DEFAULT NULL,
  p_cus_trt_code      IN NUMBER DEFAULT NULL,
  p_prd_pgr_code      IN NUMBER DEFAULT NULL
)
RETURN VARCHAR2;

--USG323 changement de facon de calculer la taxe par le gouvernement fédérale
PROCEDURE AP_VEND_CIGAR_PROC (
  p_inh_id IN NUMBER
);

--BRC32 nouvelle procédure pour poster à ACCPAC les factures de transport
PROCEDURE AR_AP_TRANSPORT_INVOICING_PROC (
  p_invoice IN NUMBER
);

--BER2527 Procédure pour poster à ACCPAC les crédits de transport
PROCEDURE AR_TRANSPORT_CREDIT_PROC (
  p_invoice IN NUMBER
);

--RTD25 Procédure pour poster à ACCPAC les inventaire des transferts
PROCEDURE INTERCO_POSTING_PROC (
  p_trh_id IN NUMBER,
  p_flag   IN VARCHAR2
);

PROCEDURE PALLET_INVOICE_PROC(
  p_inh_id  IN NUMBER
);

PROCEDURE RECEIPT_CHARGE_PROC(
p_inh_id  IN NUMBER
);

--cvi2821 création de la procédure basé un peu sur l'envoi à ACCPAC des transactions VA...
PROCEDURE OA_INVOICE_PROC(
  p_inh_id    IN NUMBER,
  p_qualifier IN VARCHAR2  --OA  ou TPA (Accepte aussi OAGR, TPAH, TPAB)
);

PROCEDURE PURGE_ARSTOBL_PROC;

PROCEDURE PURGE_AROBL_PROC;

PROCEDURE PURGE_ARSTCUS_PROC;

PROCEDURE CM_INVOICE_PROC (
  p_inh_id IN NUMBER
);

PROCEDURE VM_INVOICE_PROC (
  p_inh_id IN NUMBER
);

PROCEDURE VT_INVOICE_PROC(
  p_inh_id         IN NUMBER
);

PROCEDURE CASH_REGISTER_PROC(
  p_srtd_id  IN sales_register_trans_details.srtd_id%TYPE
);

PROCEDURE AR_PAYMENT_PROC(
  p_srth_id IN sales_register_trans_headers.srth_id%TYPE
);

END ACCPAC_PACK;
/