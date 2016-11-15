CREATE OR REPLACE PACKAGE phenix.MAH_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep  IN  NUMBER,
  p_max_items        IN  NUMBER
);

FUNCTION LOCK_MAH_FUNC(
	p_mah_ap_invoice_number  IN match_headers.mah_ap_invoice_number%TYPE
)
RETURN BOOLEAN;

--GCL8845 fonction pour locker un MAH et tous ses MAD
FUNCTION LOCK_MAH_AND_MAD_FUNC(
	p_mah_ap_invoice_number  IN match_headers.mah_ap_invoice_number%TYPE
)
RETURN BOOLEAN;

PROCEDURE UPDATE_MAH_STATUS_PROC(
	p_mah_ap_invoice_number IN NUMBER,
	p_new_status						IN VARCHAR2
);

FUNCTION DOES_REF_ALREADY_EXISTS_FUNC(
	p_mah_reference_number 	IN VARCHAR2,
	p_ven_to_pay_code				IN NUMBER
)
RETURN BOOLEAN;

--gcl8845 fonction pour trouver le fournisseur à l'achat (en lien avec la facture donnée)
FUNCTION FIND_PURCHASE_VEN_CODE_FUNC(
  p_mah_ap_invoice_number IN match_headers.mah_ap_invoice_number%TYPE
)
RETURN NUMBER;

--GCL8845 fonction qui essait de fermer une facture invoice matching
PROCEDURE TRY_CLOSING_MAH_PROC(
  p_mah_ap_invoice_number         IN match_headers.mah_ap_invoice_number%TYPE,
  p_use_code                      IN NUMBER,
  p_ctr_super_distributor_switch  IN NUMBER,
  p_log_id                        IN NUMBER DEFAULT NULL
);

--GCL8845 procédure pour mettre à jour les dernier coutant payé lors de la fermeture dune facture fournisseur
PROCEDURE MAH_UPDATE_LAST_PAID_PROC(
  p_ven_purchase_code       IN NUMBER,
  p_prf_prd_code            IN VARCHAR2,
  p_prd_definition          IN VARCHAR2,
  p_mad_list_price          IN NUMBER,
  p_prf_conversion_to_base  IN NUMBER,
  p_pod_list                IN NUMBER,  --BER7618
  p_pod_cost_1              IN NUMBER,  --BER7618
  p_pod_cost_2              IN NUMBER,  --BER7618
  p_pod_cost_3              IN NUMBER,  --BER7618
  p_pod_cost_4              IN NUMBER,  --BER7618
  p_pod_match_cost          IN NUMBER,  --BER7618
  p_rcd_date_closed         IN DATE    --BER7618
);

--GCL8845 job qui essait de fermer automatiquement les factures invoice matching recues par EDI et qui n'ont pas trop de différences etc
PROCEDURE AUTOMATIC_INVOICE_MATCH_PROC(
  p_jsc_id IN NUMBER
);

PROCEDURE CHECK_TO_CLOSE_AUTOMATIC_PROC(
  p_mah_ap_invoice_number       IN match_headers.mah_ap_invoice_number%TYPE,
  p_log_id                      IN NUMBER,
  p_did_we_close_the_mah_switch OUT NUMBER
);

PROCEDURE LOCK_FOR_USER_PROC(
  p_mah_ap_invoice_number IN match_headers.mah_ap_invoice_number%TYPE,
  p_use_code              IN NUMBER
);

PROCEDURE UNLOCK_FROM_USER_PROC(
  p_mah_ap_invoice_number IN match_headers.mah_ap_invoice_number%TYPE,
  p_use_code              IN NUMBER
);

PROCEDURE UNLOCK_MAH_PROC(
  p_mah_ap_invoice_number  IN match_headers.mah_ap_invoice_number%TYPE
);

PROCEDURE CALCULATE_TRANSPORT_COST_PROC (
  p_mah_ap_invoice_number   IN match_headers.mah_ap_invoice_number%TYPE
 ) ;
END MAH_OPERATION_PACK;
/