CREATE OR REPLACE PACKAGE phenix.VENDOR_INVOICE_PACK IS

PROCEDURE INVOICING_VENDOR_DISCOUNT_PROC (
  p_jsc_id IN NUMBER
);

--package pour la creation des factures fournisseurs pour les escomptes accordés---
PROCEDURE DISCOUNT_INVOICING_PROC(
  p_sysdate       IN DATE,  --gic1603
  p_err_code      OUT NUMBER,
  p_err_error     OUT VARCHAR2,
  p_vdt_ven_code  IN NUMBER DEFAULT NULL,--USG808
  p_vdt_dit_code  IN NUMBER DEFAULT NULL, --USG808
  p_form_flag     IN NUMBER DEFAULT 0  --USG808
);

PROCEDURE UPDATE_INVOICE_HEADERS_PROC(
  p_seq_val                   IN NUMBER,
  p_inh_federal_tax_total     IN NUMBER,
  p_inh_cost_price_total      IN NUMBER,
  p_inh_provincial_tax_total  IN NUMBER,
  p_inh_sale_price_total      IN NUMBER,
  p_error_header              OUT NUMBER,
  p_error_message             OUT VARCHAR2
);

PROCEDURE INSERT_INVOICE_PROC(
  p_seq_val             IN NUMBER,
  p_poh_ven_to_pay_code IN NUMBER,
  p_type                IN VARCHAR2,  --CSC1388
  p_ven_original_code   IN NUMBER,    --CSC1518
  p_error_header        OUT NUMBER,
  p_error_message       OUT VARCHAR2
);

FUNCTION COUNT_RECOUNT_DETAILS_FUNC(
  p_inh_code              IN NUMBER,
  p_ven_code              IN NUMBER,
  p_cpr_id                IN NUMBER,      --USG701
  p_log_id                IN NUMBER,      --cvi223
  p_ven_language_flag     IN VARCHAR2,    --GIC2108
  p_cot_invoiced          IN OUT NUMBER,  --gic1911
  p_fed_total             OUT NUMBER,     --csc1584
  p_prov_total            OUT NUMBER,     --csc1584
  p_inh_sale_price_total  OUT NUMBER,     --csc1584
  p_errm                  OUT VARCHAR2
)
RETURN BOOLEAN;

FUNCTION COUNT_RECOUNT_FUNC(
  p_cpr_id  IN NUMBER,    --USG701
  p_inh_id  OUT NUMBER,   --USG334
  p_errm    OUT VARCHAR2  --USG334
)
RETURN BOOLEAN;

--gic1991 procédure pour savoir sil reste des COD pas facturé qui ne pourront pas réclamer les CAR_AMOUNT
FUNCTION ARE_THERE_CAR_LEFT_FUNC(
  p_cpr_id IN NUMBER
)
RETURN NUMBER;  --0 ou 1... pour pouvoir inclure dans les SELECT

--gic1991 procédure pour savoir sil reste des COD pas facturé qui ne pourront pas réclamer les CAR_AMOUNT
PROCEDURE FIND_CAR_NOT_INVOICED_PROC(
  p_cpr_id      IN NUMBER,
  p_car_ordered OUT NUMBER,
  p_car_to_pick OUT NUMBER
);

PROCEDURE DROP_DISCOUNT_INVOICING_PROC(
  p_sysdate       IN DATE,  --gic1603 on prend p_sysdate au lieu de sysdate
  p_err_code      OUT NUMBER,
  p_err_error     OUT VARCHAR2,
  p_vdt_ven_code  IN NUMBER DEFAULT NULL,--USG808
  p_vdt_dit_code  IN NUMBER DEFAULT NULL,  --USG808
  p_form_flag     IN NUMBER DEFAULT 0  --USG808
);

FUNCTION SEND_VEN_INH_FUNC(
  p_inh_id      IN NUMBER,
  p_log_id      IN NUMBER DEFAULT NULL,
  p_errm        OUT VARCHAR2
)
RETURN BOOLEAN;

--USG566 procedure pour la creation des factures fournisseurs pour les valeurs des billbacks
PROCEDURE GENERATE_BILLBACK_PROC(
  p_jsc_id IN NUMBER
);

--USG566 fonction appellé par GENERATE_BILLBACK_PROC pour insérer les VBD selon l'allocation validée
FUNCTION VBD_PER_ALLOCATION_FUNC(
  p_log_id                    IN NUMBER,
  p_prf_prd_code              IN VARCHAR2,
  p_prf_fmt_code              IN VARCHAR2,
  p_whs_code                  IN VARCHAR2,    --ber1466
  p_inh_id                    IN NUMBER,
  p_mah_ap_invoice_number     IN NUMBER,
  p_mad_line_number           IN NUMBER,
  p_allocation                IN NUMBER,
  p_mad_invoiced_quantity     IN NUMBER,
  p_mad_invoiced_weight       IN NUMBER,
  p_ven_purchase_code         IN NUMBER,
  p_vbd_seq                   IN OUT NUMBER,
  p_inh_federal_tax_total     IN OUT NUMBER,
  p_inh_cost_price_total      IN OUT NUMBER,
  p_inh_provincial_tax_total  IN OUT NUMBER,
  p_inh_sale_price_total      IN OUT NUMBER,
  p_error_message             OUT VARCHAR2
)
RETURN BOOLEAN;

--ber1466 création de la fonction
FUNCTION FIND_PURCHASE_WAREHOUSE_FUNC(
  p_prd_code          IN VARCHAR2,
  p_deliv_or_picking_whs_code IN VARCHAR2 --gic3413
)
RETURN VARCHAR2;  --retourne le whs_code

--USG701 tâche pour refacturer les count and recount
PROCEDURE COUNT_RECOUNT_INVOICING_PROC(
  p_jsc_id IN NUMBER
);

--USG808 fonction de refacturation des escomptes pretes ou d un escompte bien determinéee qd c appeler de la forme
FUNCTION SINGLE_INVOICE_DISCOUNT_FUNC(
  p_sysdate       IN DATE,
  p_vdt_ven_code  IN NUMBER DEFAULT NULL,
  p_vdt_dit_code  IN NUMBER DEFAULT NULL,
  p_form_flag     IN NUMBER DEFAULT 0,   --sert pour l'appel à partir de la forme...
  p_log_id        IN NUMBER DEFAULT NULL
)
RETURN BOOLEAN;

-----
PROCEDURE INVOICE_RECEIPT_CHARGES_PROC;
FUNCTION SINGLE_INV_TEL_COUNTER_FUNC(
  p_ctt_code                IN NUMBER,
  p_ctt_description         IN VARCHAR2,
  p_prd_ven_code            IN NUMBER,
  p_ven_payable             IN NUMBER,
  p_ven_language_flag       IN VARCHAR2,
  p_ctt_billing_method      IN VARCHAR2,
  p_ctt_date_last_billed    IN DATE,
  p_force_invoicing         IN NUMBER DEFAULT 0, --sert pour l'appel à partir de la forme...
  p_log_id                  IN NUMBER DEFAULT NULL,
  p_invoice_created         IN OUT NUMBER,
  p_nb_email_sent           IN OUT NUMBER,
  p_nb_email_echec          IN OUT NUMBER,
  p_nb_ctt_valider          IN OUT NUMBER,
  p_inh_id_used             IN OUT VARCHAR2,
  p_inh_id_depasse          IN OUT NUMBER
)
RETURN BOOLEAN;
--BER6830 ber4652 tâche pour refacturer les montants des compteurs de téléventedont la date est arrivée
PROCEDURE TELEMARK_COUNTER_INVOICE_PROC(
  p_jsc_id IN NUMBER
);

PROCEDURE SEND_VEN_INH_PROC(
  p_inh_id      IN NUMBER
);

END VENDOR_INVOICE_PACK;
/