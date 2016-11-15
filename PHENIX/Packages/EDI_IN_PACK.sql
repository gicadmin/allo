CREATE OR REPLACE PACKAGE phenix.EDI_IN_PACK IS

PROCEDURE CSC_READ_882_PROC(
	p_vnomfichier IN VARCHAR2
);

PROCEDURE CSC_DROP_ORDER_JOB_PROC(
	p_jsc_id IN NUMBER
);

--csc1266 nouvelle procédure pour les factures (880, 810, 856) selon le nouveau layout pour Colabor
PROCEDURE EXTRACT_880_810_856_JOB_PROC(
	p_jsc_id IN NUMBER
);

END EDI_IN_PACK;
/