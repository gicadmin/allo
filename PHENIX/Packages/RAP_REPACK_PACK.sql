CREATE OR REPLACE PACKAGE phenix.RAP_REPACK_PACK IS

-- Génère le rapport de préparation requise pour Bertrand
FUNCTION RESERVER_COD_FUNC (
     p_entrepot_cueillette    IN VARCHAR2
    ,p_zone_d_entrepot        IN VARCHAR2
    ,p_date_de_route          IN DATE
    ,p_code_de_route          IN NUMBER
    ,p_code_route_fin         IN NUMBER
    ,p_day_of_week_for_route  IN NUMBER
   ,p_reserved_code          IN VARCHAR2
) RETURN VARCHAR2;

END RAP_REPACK_PACK;
/