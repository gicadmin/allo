CREATE OR REPLACE PACKAGE phenix.VENDOR_AGREEMENT_PACK IS

--Procédure pour calculer les montants à mettre dans le cod_vendor_reclaim_amount
PROCEDURE CALCULATE_VENDOR_RECLAIM_PROC(
  p_coh_cus_code          IN NUMBER,
  p_cod_coh_id            IN NUMBER,            --devra etre rempli si on veut lié les réclamations à un COD  fre739
  p_cod_line_number       IN NUMBER,            --devra etre rempli si on veut lié les réclamations à un COD  fre739
  p_cad_id                IN NUMBER,            --devra etre rempli si on veut lié les réclamations à un CAD  fre739
  p_cod_prf_prd_code      IN VARCHAR2,
  p_cod_prf_fmt_code      IN VARCHAR2,
  p_cod_selling_retail    IN NUMBER,
  p_cod_tobacco_tax       IN NUMBER,            --fre739 si le produit est tabac, on doit déduire le tabac du cod_selling_retail
  p_total_reclaim_found   OUT NUMBER,
  p_do_commit             IN NUMBER DEFAULT 0,  --fre739  indique si on veut que la procédure commit toute seule
  p_do_delete_first       IN NUMBER DEFAULT 1,  --fre739  indique si on veut débuter la procédure en s'assurant qu'il ne reste pas déjà d'autre SAR pour la ligne
  p_only_add_total        IN NUMBER DEFAULT 0,  --fre739  indique si on veut seulement trouvé le total des réclamations, ou si on veut inserer aussi
  p_cod_freegood_switch   IN NUMBER DEFAULT 0   --BER3060 Indique si on réclame une gratuité
);

--fonction pour trouver de quel coutant on se sert pour calculer les ententes
--selon le ved_cost_used, et conversion du prix vers le format voulu
FUNCTION FIND_COST_FUNC(
  p_cost_used IN NUMBER,
  p_prd_code  IN VARCHAR2,
  p_fmt_code  IN VARCHAR2
)
RETURN NUMBER;

--fonction calculant le montant/pourcentage pour un détail d'entente... sur un produit etc..
FUNCTION CALCUL_AGREEMENT_DETAILS_FUNC( --fre739
  p_ctr_admin_method    IN VARCHAR2,  --fre0157
  p_prd_code            IN VARCHAR2,
  p_fmt_searched        IN VARCHAR2,
  p_cost_used           IN VARCHAR2,
  p_agreement_type      IN VARCHAR2,
  p_agreement_amount    IN NUMBER,
  p_agreement_percent   IN NUMBER,
  p_guaranteed_cost     IN NUMBER,  --fre0157
  p_cod_selling_retail  IN NUMBER,
  p_qtd_admin_amount    OUT NUMBER  --Cha451 pour garder à part le montant trouvé sur la soumission (VP seulement)
)
RETURN NUMBER;

--tâche pour refacturer les montants dans les ententes dont la date est arrivée
PROCEDURE INVOICE_AGREEMENT_PROC(
  p_jsc_id IN NUMBER
);

--fonction appelle par INVOICE_AGREEMENT_PROC pour créer le invoice headers
FUNCTION CREATE_INH_FUNC(
  p_ven_payable  IN NUMBER,
  p_ven_original IN NUMBER, --GIC2108
  p_inh_id       OUT NUMBER,
  p_errm         OUT VARCHAR2
)
RETURN BOOLEAN;

--fonction appellé par INVOICE_AGREEMENT_PROC pour créer les vendor_billing details
FUNCTION CREATE_VBD_FUNC (
  p_cod_prf_prd_code          IN VARCHAR2,
  p_cod_prf_fmt_code          IN VARCHAR2,
  p_whs_code                  IN VARCHAR2,  --ber1466
  p_cot_invoiced_quantity     IN NUMBER,
  p_cot_invoiced_weight       IN NUMBER,
  p_cod_vendor_reclaim_amount IN NUMBER,
  p_inh_id                    IN NUMBER,
  p_ven_payable               IN NUMBER,
  p_fed_tax                   IN NUMBER,
  p_prov_tax                  IN NUMBER,
  p_vsa_description           IN VARCHAR2, --GIC1357
  p_cus_name                  IN VARCHAR2, --GIC1357
  p_vbd_from_date             IN DATE,--CVI181
  p_vbd_to_date               IN DATE,--CVI181
  p_vbd_message               IN VARCHAR2,  --GIC2108
  p_vbd_invoiced_ext_price    IN vendor_billing_details.vbd_invoiced_ext_price%TYPE, --BER3866
  p_vbd_invoiced_ext_admin    IN vendor_billing_details.vbd_invoiced_ext_admin%TYPE, --BER3866
  p_vbd_vsi_code              IN vendor_billing_details.vbd_vsi_code%TYPE,--BEA90
  p_line_number               IN OUT NUMBER,
  p_vbd_id                    IN OUT NUMBER,  --USG566
  p_errm                      OUT VARCHAR2
)
RETURN BOOLEAN;

--fonction appellé par INVOICE_AGREEMENT_PROC pour updater les totaux du invoice_headers
FUNCTION UPDATE_INH_FUNC(
  p_inh_federal_tax_total     IN NUMBER,
  p_inh_provincial_tax_total  IN NUMBER,
  p_inh_sale_price_total      IN NUMBER,
  p_inh_cost_price_total      IN NUMBER,
  p_inh_id                    IN NUMBER,
  p_vsa_ap_ar_flag            IN VARCHAR2,  --ber186
  p_errm                      OUT VARCHAR2
)
RETURN BOOLEAN;

/* Procédure servant à copier les reclaims d'un COD vers un CAD (sans les liens vers les VED à date..) */
PROCEDURE COPY_RECLAIM_COD_TO_CAD_PROC(   --fre739
  p_cod_coh_id      IN NUMBER,
  p_cod_line_number IN NUMBER,
  p_cad_id          IN NUMBER,
  p_do_commit       IN NUMBER DEFAULT 0
);

--BER886 trouver le total des ententes fournisseurs existantes
FUNCTION FIND_TOTAL_SAR_FUNC(
  p_coh_id          IN NUMBER,
  p_cod_line_number IN NUMBER,
  p_cad_id          IN NUMBER
) RETURN NUMBER;

--usg808 fonction qui traite un vsa_code à la fois,cette fonction va etre appelée de la forme des ententes quand on change la methode à aucune facturation
FUNCTION SINGLE_INVOICE_AGREEMENT_FUNC(
  p_vsa_code                IN NUMBER,
  p_vsa_description         IN VARCHAR2,
  p_vsa_ven_code            IN NUMBER,
  p_ven_payable             IN NUMBER,
  p_ven_language_flag       IN VARCHAR2,
  p_vsa_billing_method      IN VARCHAR2,
  p_vsa_output_file_switch  IN NUMBER,
  p_vsa_ap_ar_flag          IN VARCHAR2,
  p_vsa_date_last_billed    IN DATE,
  p_force_invoicing         IN NUMBER DEFAULT 0, --sert pour l'appel à partir de la forme...
  p_log_id                  IN NUMBER DEFAULT NULL,
  p_invoice_created         IN OUT NUMBER,
  p_nb_email_sent           IN OUT NUMBER,
  p_nb_email_echec          IN OUT NUMBER,
  p_nb_vsa_valider          IN OUT NUMBER,
  p_inh_id_used             IN OUT VARCHAR2,
  p_inh_id_depasse          IN OUT NUMBER
) RETURN BOOLEAN;

END VENDOR_AGREEMENT_PACK;
/