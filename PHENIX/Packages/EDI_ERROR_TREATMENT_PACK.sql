CREATE OR REPLACE PACKAGE phenix.EDI_ERROR_TREATMENT_PACK IS

--csc2362 automatiser la substitution sans l'approbation de l'utilisateur
FUNCTION SUBSTITUTION_PRODUIT_FUNC(
	p_new_prd_code 					IN VARCHAR2,
	p_pod_poh_id 						IN NUMBER,
	p_pod_line_number 			IN NUMBER,
	p_poh_ven_purchase_code	IN NUMBER,
	p_update_comes_from			IN VARCHAR2,	--RCH OU MAH
	p_log_id 								IN NUMBER DEFAULT NULL
)
RETURN BOOLEAN;

PROCEDURE CHANGE_COD_PROC(
	p_pod_poh_id 			IN NUMBER,
	p_pod_line_number IN NUMBER,
	p_old_prd_code 		IN VARCHAR2,
	p_new_prd_code 		IN VARCHAR2,
	p_new_fmt_code 		IN VARCHAR2,
	p_log_id					IN NUMBER DEFAULT NULL,	--log de la lecture de flatfile etc au cas que ca plante
	v_log_id 					IN NUMBER DEFAULT NULL	--log spécifique pour voir comment a réagi la substitution
);

--fonction pour corriger les lignes de pige etc...
FUNCTION A_PROPOS_DE_PIGE_FUNC (
	p_hdh_id							IN NUMBER,
	p_hdd_sequence				IN NUMBER,
	p_hdd_poh_id					IN NUMBER,
	p_hdd_pod_line_number	IN NUMBER,
	p_pas_assez_de_pige 	IN NUMBER,
	p_ccr_code 						IN OUT NUMBER,
	p_log_id							IN NUMBER
)
RETURN BOOLEAN;

FUNCTION COUNT_MAD_ON_POD_FUNC (
	p_hdh_id 							IN NUMBER,
	p_hdd_poh_id 					IN NUMBER,
	p_hdd_pod_line_number IN NUMBER
)
RETURN NUMBER;

PROCEDURE COUPER_LIEN_SUR_POD_PROC (
	p_pod_poh_id 			IN NUMBER,
	p_pod_line_number IN NUMBER
);

PROCEDURE UPDATE_PREBOOK_FLAG_PROC (
	p_hdh_id 				IN NUMBER,
	p_hdd_sequence 	IN NUMBER,
	p_prebook				IN NUMBER
);

PROCEDURE UPDATE_OLD_POD_PROC (
	p_pod_poh_id 					IN NUMBER,
	p_pod_line_number 		IN NUMBER,
	p_qty_weight_removed 	IN NUMBER,
	p_weight 							IN NUMBER DEFAULT 0
);

FUNCTION INSERT_NEW_POD_FUNC (
	p_pod_poh_id 					IN NUMBER,
	p_pod_line_number 		IN NUMBER,
	p_pod_creation_source IN VARCHAR2,
	p_qty_weight 					IN NUMBER,
	p_weight 							IN NUMBER DEFAULT 0	--indique si le p_qty_weight est du poids (0 = cest une quantité, 1 = cest du poids)
)
RETURN NUMBER;

PROCEDURE MATCH_RCD_ON_NEW_POD_PROC (
	p_rcd_id 					IN NUMBER,
	p_pod_line_number IN NUMBER
);

PROCEDURE MATCH_MAD_ON_NEW_POD_PROC (
	p_hdh_id 					IN NUMBER,
	p_hdd_sequence 		IN NUMBER,
	p_pod_line_number IN NUMBER
);

END EDI_ERROR_TREATMENT_PACK;
/