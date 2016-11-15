CREATE OR REPLACE PACKAGE phenix.GENERATE_ROUTE_PACK IS

/* insère les routes potentielles dans la table temporary_routes */
FUNCTION GENERATE_ROUTE_POTENTIEL_FUNC(
  p_date_livraison    IN DATE,
  p_rou_type          IN VARCHAR2,
  p_rou_code_from     IN NUMBER,
  p_rou_code_to       IN NUMBER,
  p_orphan            IN NUMBER,
  p_whs_delivery_code IN VARCHAR2,  --ber1616
  p_to_pick           IN NUMBER,
  p_to_invoice        IN NUMBER,
  p_invoiced          IN NUMBER,
  p_use_language      IN VARCHAR2,  --ber678
  p_error_code        OUT NUMBER,   --ber678
  p_error_message     OUT VARCHAR2  --ber678
) RETURN BOOLEAN;

PROCEDURE GENERATE_FINAL_ROD_PROC(
  p_date_livraison    IN DATE,
  p_rou_type          IN VARCHAR2,  --BER146
  p_whs_delivery_code IN VARCHAR2,  --ber1616
  p_from_rou_code     IN NUMBER,    --brc32
  p_to_rou_code       IN NUMBER     --brc32
);

END GENERATE_ROUTE_PACK;
/