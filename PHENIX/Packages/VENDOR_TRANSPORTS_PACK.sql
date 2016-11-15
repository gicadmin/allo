CREATE OR REPLACE PACKAGE phenix.VENDOR_TRANSPORTS_PACK IS

--BRC32 fonction pour trouver l'entente de transport concernant ces fournisseur, clients et date
FUNCTION FIND_CUSTOMER_FUNC(
  p_ven_code          IN NUMBER,
  p_cus_code          IN NUMBER,
  p_invoiced_cus_code IN NUMBER,
  p_delivery_date     IN DATE
)
RETURN NUMBER; --retourne un VTR_ID

--BRC32 fonction de facturation des ententes de transport etc
PROCEDURE INVOICE_TRANSPORTS_PROC(
  p_jsc_id IN NUMBER
);

--fonction qui valide si on trouve un niveau pour les valeurs demandées
--fonction à appellé lorsqu'on ne veut pas de "rapport" de la situation dans une chaine varchar
FUNCTION FIND_LEVEL_FUNC(
  p_vtr_id                    IN NUMBER,
  p_vtt_skip_invoicing_switch IN NUMBER,
  p_vtr_invoicing_method      IN VARCHAR2,
  p_vtr_fixed_amount          IN NUMBER,
  p_vtt_weight_uom            IN VARCHAR2,
  p_vtt_weight                IN NUMBER,
  p_vtt_number_of_pallets     IN NUMBER,
  p_vtt_number_of_packages    IN NUMBER,
  p_vtt_value                 IN NUMBER,
  p_invoiced_trans_amount     OUT NUMBER
)
RETURN BOOLEAN;

--fonction qui valide si on trouve un niveau pour les valeurs demandées
FUNCTION FIND_LEVEL_WITH_LOG_FUNC(
  p_vtr_id                    IN NUMBER,
  p_vtt_skip_invoicing_switch IN NUMBER,
  p_vtr_invoicing_method      IN VARCHAR2,
  p_vtr_fixed_amount          IN NUMBER,
  p_vtt_weight_uom            IN VARCHAR2,
  p_vtt_weight                IN NUMBER,
  p_vtt_number_of_pallets     IN NUMBER,
  p_vtt_number_of_packages    IN NUMBER,
  p_vtt_value                 IN NUMBER,
  p_charge_rate               OUT NUMBER,
  p_invoiced_trans_amount     OUT NUMBER,
  p_situation                 IN OUT VARCHAR2   --sert seulement au log...
)
RETURN BOOLEAN;

--Cette fonction insère une facture vide et retourne le numéro INH_ID
FUNCTION INSERT_TRANSPORT_INH_FUNC(
  p_cus_code      IN NUMBER,
  p_type          IN VARCHAR2,
  p_cus_invoice   IN NUMBER
)
RETURN NUMBER;


END VENDOR_TRANSPORTS_PACK;
/