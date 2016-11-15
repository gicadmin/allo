CREATE OR REPLACE PACKAGE phenix.READ_EDI_INVOICE_PACK IS

--loop parmi les headers disponible
PROCEDURE CALL_FIND_ERRORS_PROC(
	p_type 		IN VARCHAR2,
	p_log_id 	IN NUMBER DEFAULT NULL	--csc2362
);

--loop parmi les headers disponible
PROCEDURE CALL_TRANSFERT_PROC(
	p_type 		IN VARCHAR2,
	p_log_id 	IN NUMBER DEFAULT NULL	--csc2362
);

--lecture dun fichier de facture DI et insertion des records dans la table
FUNCTION READ_EDI_INVOICE_DI_FUNC(
	v_file_in 					IN UTL_FILE.FILE_TYPE,
	p_log_id 						IN NUMBER,
	p_loop_file					IN NUMBER,
	p_path_and_name			IN VARCHAR2,
	p_bckpath_and_name	IN VARCHAR2
)
RETURN BOOLEAN;

--procédure qui tag les erreurs dune facture DI spécifique
PROCEDURE FIND_DI_ERRORS_PROC(
	p_hdh_id 	IN NUMBER,
	p_log_id	IN NUMBER DEFAULT NULL
);

--sous-procédure (appellé par FIND_DI_ERRORS_PROC) qui tag les erreurs des lignes de détails dune facture DI
PROCEDURE FIND_DI_DET_ERRORS_PROC(
	p_hdh_id 										IN NUMBER,
	p_hdh_ccr_code							IN OUT NUMBER,
	p_hdh_purch_ven_code				IN NUMBER,
	p_hdh_to_pay_ven_code				IN NUMBER,
	p_hdh_whs_code							IN VARCHAR2,	--ber1480
	p_hdh_indirect_deliv_switch IN NUMBER,	--csc1504
	p_hdh_po_number							IN NUMBER,	--csc1504
	p_ven_is_broker 						IN BOOLEAN,
	p_vendor_send_856_edi 			IN BOOLEAN,
	p_log_id										IN NUMBER DEFAULT NULL	--csc2362
);

--sous procédure (appellé par FIND_DI_DET_ERRORS_PROC) qui tag les erreurs vis à vis des qté/poids facturé d'une facture DI
FUNCTION VALIDATE_QTY_WGHT_FUNC (
	p_prd_definition 				IN VARCHAR2,
	p_quantity 							IN OUT NUMBER,
	p_weight 								IN OUT NUMBER,
	p_new_ccr_code 					IN OUT NUMBER
)
RETURN BOOLEAN;

--procédure utilisé pour transféré une facture DI de la table temporaire vers les vrais tables du système
PROCEDURE TRANSFERT_DI_PROC(
	p_hdh_id 	IN number,
	p_log_id	IN NUMBER DEFAULT NULL
);

--procédure pour créer une ligne ASN a zéro (pour fité une facture qui a une ligne a zéro pour laquelle aucun ASN nexiste)
FUNCTION CREATE_RCD_TO_ZERO_FUNC(
	p_pod_poh_id 						IN NUMBER,
	p_pod_line_number 			IN NUMBER,
	p_prd_code 							IN VARCHAR2,
	p_purch_ven_code	 			IN NUMBER,
	p_mah_ap_invoice_number IN NUMBER,
	p_hdd_invoiced_quantity IN NUMBER,
	p_hdd_invoiced_weight 	IN NUMBER,
	p_hdd_shorted_code 			IN VARCHAR2,
	p_ctr_shr_external_code IN NUMBER
)
RETURN NUMBER;

--lecture dun fichier de facture RE et insertion des records dans la table
FUNCTION READ_EDI_INVOICE_RE_FUNC(
	v_file_in 					IN UTL_FILE.FILE_TYPE,
	p_log_id 						IN NUMBER,
	p_loop_file					IN NUMBER,
	p_path_and_name			IN VARCHAR2,
	p_bckpath_and_name	IN VARCHAR2
)
RETURN BOOLEAN;

--procédure qui tag les erreurs dune facture RE spécifique
PROCEDURE FIND_RE_ERRORS_PROC(
	p_ibh_id IN NUMBER,
	p_log_id IN NUMBER DEFAULT NULL	--csc2362
);

--procédure utilisée pour transférer une facture RE de la table temporaire vers les vrais tables du système
PROCEDURE TRANSFERT_RE_PROC(
	p_ibh_id 	IN NUMBER,
	p_log_id	IN NUMBER DEFAULT NULL
);

--lecture dun fichier de ASN (00) et insertion des records dans la table
FUNCTION READ_EDI_ASN_00_FUNC(
	v_file_in 					IN UTL_FILE.FILE_TYPE,
	p_log_id 						IN NUMBER,
	p_loop_file					IN NUMBER,
	p_path_and_name			IN VARCHAR2,
	p_bckpath_and_name	IN VARCHAR2
)
RETURN BOOLEAN;

PROCEDURE FIND_ASN_00_ERRORS_PROC(
	p_hah_id IN NUMBER,
	p_log_id IN NUMBER DEFAULT NULL --csc2362
);

PROCEDURE FIND_ASN_00_DET_ERRORS_PROC(
	p_hah_id 										IN NUMBER,
	p_hah_ccr_code							IN OUT NUMBER,
	p_hah_purch_ven_code				IN NUMBER,
	p_hah_whs_code							IN VARCHAR2,	--ber1480
	p_ven_is_broker 						IN BOOLEAN,
	p_log_id										IN NUMBER DEFAULT NULL	--csc2362
);

PROCEDURE TRANSFERT_ASN_00_PROC(
	p_hah_id 		IN NUMBER,
	p_use_code 	IN NUMBER DEFAULT NULL,
	p_log_id		IN NUMBER DEFAULT NULL
);

--sous-procédure utilisé pour tagger les erreurs des headers de facture DI/RE et les asn 00
PROCEDURE UPDATE_HEADERS_CCR_PROC (	--remplace UPDATE_HEADERS_CCR_PROC et UPDATE_HEADERS_CCR_PROC
	p_id 								IN NUMBER,
	p_current_ccr_code 	IN OUT NUMBER,
	p_ccr_code 					IN NUMBER,
	p_type_de_ligne			IN VARCHAR2
);

--sous-procédure utilisé pour tagger les erreurs des détails de facture DI/RE et les asn 00
PROCEDURE UPDATE_DETAILS_CCR_PROC (	--remplace UPDATE_HDD__CCR_PROC et UPDATE_IBD__CCR_PROC
	p_id 								IN NUMBER,			--id de la facture
	p_sequence 					IN NUMBER,			--séquence de la ligne spécifique
	p_cur_det_ccr_code 	IN NUMBER,			--code derreur en ce moment sur la ligne de détails
	p_new_det_ccr_code 	IN NUMBER,			--nouveau code derreur quon veut mettre sur la ligne de détails
	p_cur_hdr_ccr_code 	IN OUT NUMBER,	--code derreur en ce moment sur le header
	p_new_hdr_ccr_code 	IN NUMBER,				--nouveau code derreur quon veut mettre sur la ligne de détails
	p_type_de_ligne			IN VARCHAR2
);

--csc1074 fonction créer pour matché les DUNS
FUNCTION TRY_TO_MATCH_DUNS_FUNC(
	p_duns_number IN VARCHAR2,
	p_ven_code 		OUT NUMBER,
	p_ccr_code 		OUT NUMBER
)
RETURN BOOLEAN;

--csc2362 appellé par la validation des factures DI, regroupement de validation presque finales
PROCEDURE VALIDATE_ASN_THERE_PROC (
	p_hdh_id 												IN NUMBER,
	p_hdh_indirect_delivery_switch 	IN NUMBER,
	p_hdh_ccr_code 									IN OUT NUMBER,
	p_log_id 												IN NUMBER
);

--csc2362 appellé par la validation des factures DI, regroupement de validation presque finales
PROCEDURE VALIDATE_MATCH_EXISTS_PROC (
	p_hdh_id 				IN NUMBER,
	p_hdh_ccr_code 	IN OUT NUMBER,
	p_log_id 				IN NUMBER
);

--csc2362 appellé par la validation des factures DI, regroupement de validation presque finales
PROCEDURE VALIDATE_INDIRECT_ETC_PROC (
	p_hdh_id 												IN NUMBER,
	p_hdh_indirect_delivery_switch	IN NUMBER,
	p_hdh_po_number									IN NUMBER,
	p_ctr_super_distributor_switch 	IN NUMBER,
	p_broker_vendor 								IN NUMBER,
	p_hdh_to_pay_ven_code						IN NUMBER,
	p_hdh_ccr_code 									IN OUT NUMBER,
	p_log_id 												IN NUMBER
);

--csc2362	 essayer de fixer les bulletins qui reste de la pige, ou qui en manque
FUNCTION TRY_TO_FIX_PREBOOK_FUNC(
	p_hdh_id 				IN NUMBER,
	p_log_id 				IN NUMBER,
	p_prebook_fixed	OUT NUMBER
)
RETURN BOOLEAN;

--GIC3266 nouvelle fonction pour locker les transactions avant de valider les erreurs etc
FUNCTION TRY_TO_LOCK_FUNC(
	p_type_de_ligne 	IN VARCHAR2,	--INV_DI, INV_RE, ASN_00
	p_id							IN NUMBER,
	p_log_id					IN NUMBER,
	p_called_from			IN VARCHAR2	--sert seulement au log
)
RETURN BOOLEAN;

END READ_EDI_INVOICE_PACK;
/