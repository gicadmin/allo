CREATE OR REPLACE PACKAGE phenix.WMS_PRINT_PACK IS

PROCEDURE PRINT_SPEC_ORDER_TICKET_PROC(
  p_prd_code  IN VARCHAR2,
  p_fmt_code  IN VARCHAR2,
  p_nb_ticket IN NUMBER,
  p_use_code  IN NUMBER,
  p_prn_code  IN VARCHAR2 DEFAULT NULL
);

PROCEDURE PRINT_LOCATION_TICKET_PROC(
  p_use_code IN NUMBER
);

PROCEDURE PRINT_WRAPPING_STICKERS_PROC (
  p_pmh_id            IN NUMBER,
  p_use_code          IN NUMBER,
  p_printer_code      IN VARCHAR2,
  p_stickers_quantity IN NUMBER
);

PROCEDURE PRINT_CONTAINERS_PROC(
  p_pmh_id      IN  NUMBER,
  p_use_code    IN  NUMBER,
  p_prn_code    IN  VARCHAR2
);

FUNCTION PRINT_CONTAINER_STICKER_FUNC(
  p_cont_id                 IN  NUMBER,
  p_ident_suffix            IN  VARCHAR2,
  p_use_code                IN  NUMBER,
  p_ctr_default_ias         IN  VARCHAR2,
  p_ctr_default_environment IN  VARCHAR2,
  p_already_printed         OUT NUMBER,   --sera 0... sauf si le rapport est envoyé au printer avec succès
  p_ccr_code                OUT NUMBER,   --sera rempli si un probleme connu arrive à la création de la job
  p_error_message           OUT VARCHAR2, --sera rempli seulement si un erreur WHEN OTHERS arrive (et le ccr_code devrait être null)
  p_output                  OUT VARCHAR2  --contiendra le PATH du rapport (pdf)
)
RETURN BOOLEAN;

PROCEDURE PRINT_IDENT_TICKET_PROC(
  p_prd_code  IN VARCHAR2,
  p_fmt_code  IN VARCHAR2,
  p_nb_ticket IN NUMBER,
  p_use_code  IN NUMBER,
  p_prn_code  IN VARCHAR2 DEFAULT NULL
);

--BER3036 Impression du rapport RAP_LOADED_TRUCK
PROCEDURE PRINT_LOADED_TRUCK_PROC(
  p_rsh_id   IN NUMBER,
  p_use_code IN NUMBER,
  p_prn_id   IN NUMBER,
  p_whs_code IN VARCHAR2,
  p_language IN VARCHAR2 DEFAULT 'FR'
);

--BER3036 Impression du rapport RAP_TRANSPORT_CHARGEMENT
PROCEDURE PRINT_LOADING_TRANSPORT_PROC(
  p_pro_name IN VARCHAR2,
  p_rsh_id   IN NUMBER,
  p_use_code IN NUMBER,
  p_prn_id   IN NUMBER,
  p_whs_code IN VARCHAR2,
  p_language IN VARCHAR2 DEFAULT 'FR'
);

--BER4396 Impression des rapports RAP_TRANSPORT_CHARGEMENT / RAP_TRANSP_CHARGEMENT_DETAILS
PROCEDURE PRINT_LOADING_TRANSPORT_PROC(
  p_rsh_id         IN NUMBER,
  p_use_code       IN NUMBER,
  p_prn_id         IN NUMBER,
  p_whs_code       IN VARCHAR2,
  p_print_details  IN BOOLEAN,
  p_language       IN VARCHAR2 DEFAULT 'FR'
);

--BER3036 Impression du rapport RAP_TRANSPORT_PALETTE
PROCEDURE PRINT_TRANSPORT_PALLET_PROC(
  p_pco_id   IN NUMBER,
  p_use_code IN NUMBER,
  p_prn_id   IN NUMBER,
  p_whs_code IN VARCHAR2,
  p_language IN VARCHAR2 DEFAULT 'FR'
);

--BER3036 Impression du rapport RAP_ETIQUETTE_PALETTE ou RAP_PAPIER_PALETTE
PROCEDURE PRINT_PALLET_TICKET_PAPER_PROC(
  p_pco_id               IN NUMBER,
  p_use_code             IN NUMBER,
  p_prn_code             IN VARCHAR2,
  p_print_prd_not_picked IN VARCHAR  DEFAULT 'NO', -- ne pas imprimer seulement les produits non cueillis
  p_language             IN VARCHAR2 DEFAULT 'FR',
  p_pmh_id               IN NUMBER   DEFAULT NULL,
  p_last_pmh_switch      IN NUMBER   DEFAULT 0
);

PROCEDURE IDENTIFIER_PRINT_PROC (
  p_num_debut          IN NUMBER,
  p_number_to_generate IN NUMBER
  );

FUNCTION PRINT_CONTAINER_STICKER_FUNC(
  p_cont_id          IN  NUMBER,
  p_ident_suffix     IN  VARCHAR2,
  p_use_code         IN  NUMBER,
  p_already_printed  OUT NUMBER,
  p_ccr_code         OUT NUMBER,
  p_error_message    OUT VARCHAR2,
  p_output           OUT VARCHAR2
) RETURN BOOLEAN;

END WMS_PRINT_PACK;
/