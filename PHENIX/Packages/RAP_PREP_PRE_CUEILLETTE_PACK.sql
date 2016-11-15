CREATE OR REPLACE PACKAGE phenix.RAP_PREP_PRE_CUEILLETTE_PACK IS

-- Génère le rapport de préparation requise pour Bertrand
--Génère le rapport de préparation requise pour Non Bertrand et non charest
FUNCTION RESERVER_COD_FUNC (
  p_zone_d_entrepot        IN VARCHAR2,
  p_credit_check           IN NUMBER,
  p_date_de_route          IN DATE,
  p_code_de_route          IN NUMBER,
  p_code_route_fin         IN NUMBER,
  p_day_of_week_for_route  IN NUMBER,
  p_de_la_localisation     IN VARCHAR2,
  p_a_la_localisation      IN VARCHAR2,
  p_reserved_code          IN VARCHAR2
) RETURN VARCHAR2;

--Génère le rapport de préparation requise pour Non Bertrand et non charest
FUNCTION RESERVER_COD_BER0191_FUNC (
  p_entrepot_cueillette    IN VARCHAR2,
  p_zone_d_entrepot        IN VARCHAR2,
  p_orphelin               IN NUMBER,
  p_credit_check           IN NUMBER,
  p_date_de_route          IN DATE,
  p_code_de_route          IN NUMBER,
  p_code_route_fin         IN NUMBER,
  p_day_of_week_for_route  IN NUMBER,
  p_reserved_code          IN VARCHAR2
) RETURN VARCHAR2;
END RAP_PREP_PRE_CUEILLETTE_PACK;
/