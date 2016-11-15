CREATE OR REPLACE PACKAGE phenix.EDI_OUT_PACK IS

PROCEDURE CREATE_EDI_INVOICE_PROC(
  p_inh_id IN NUMBER
);

PROCEDURE CREATE_EDI_ASN_PROC(
  p_plh_id IN NUMBER
);

PROCEDURE CREATE_875_PROC (
  p_poh_id IN NUMBER
);

--appellé par la réconciliation des DROP (ACCPAC_PACK)
PROCEDURE CREATE_EDI_DROP_PROC(
  p_inh_id IN NUMBER,
  p_log_id IN NUMBER  --USG323 ajouter le log id
);

--csc1266 ce code était directement dans CREATE_EDI_DROP_PROC avant...
PROCEDURE CREATE_EDI_NORMAL_DROP_PROC(
  p_inh_id IN NUMBER
);

--csc1266 procédure pour générer le flat file des factures drop 810 dont les données sont encore dans les tables temporaires
PROCEDURE CREATE_EDI_810_REBILL_PROC(
  p_inh_id IN NUMBER
);

--csc1266 procédure pour détruire les 810 gardé dans les tables temporaire quand on nen a plus besoin
PROCEDURE DELETE_INDIRECT_BILLING_PROC(
  p_inh_id IN NUMBER,
  p_commit IN NUMBER DEFAULT 1
);

--nouvelle procédure créée par CSC2723
PROCEDURE RECALCULATE_EDI_810_TAX_PROC(
  p_inh_id  IN NUMBER,
  p_log_id  IN NUMBER
);
--GI3359 procédure permettant de regénérer unfichier edi sortant à partir d'un numéero de factrue
PROCEDURE CREATE_EDI_INVOICE_JOB_PROC(
  p_jsc_id IN NUMBER
);

PROCEDURE CREATE_882_FROM_NI_PROC(
  p_inh_id  IN  invoice_headers.inh_id%TYPE
);

END EDI_OUT_PACK;
/