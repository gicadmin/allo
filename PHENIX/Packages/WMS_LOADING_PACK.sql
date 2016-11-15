CREATE OR REPLACE PACKAGE phenix.WMS_LOADING_PACK IS

--fonction qui crée les SHIPMENT_HEADERS
FUNCTION OPEN_TRUCK_FUNC(							--SHH_OPERATION_PACK
  p_shh_date              IN      DATE,
  p_shh_load_window       IN      NUMBER,
  p_shh_car_code          IN      NUMBER,
  p_shh_trailer_number    IN      VARCHAR2,
  p_shh_loc_code          IN      VARCHAR2,
  p_shh_cus_code          IN      NUMBER,
  p_shh_ven_code          IN      NUMBER,
  p_shh_temperature       IN      NUMBER,
  p_shh_reference_number  IN      VARCHAR2,
  p_shh_id                OUT     NUMBER
) RETURN PLS_INTEGER;

--fonction qui crée les SHIPMENT_AUDITS
FUNCTION UPDATE_SHIP_AUDIT_FUNC(
  p_sha_date              IN      DATE,
  p_sha_load_window       IN      NUMBER,
  p_sha_car_code          IN      NUMBER,
  p_sha_trailer_number    IN      VARCHAR2,
  p_sha_loc_code          IN      VARCHAR2,
  p_sha_cus_code          IN      NUMBER,
  p_sha_ven_code          IN      NUMBER,
  p_sha_container_id      IN      NUMBER,
  p_sha_container_suffix  IN      VARCHAR2,
  p_sha_use_code          IN      NUMBER,
  p_sha_load_unload_flag  IN      VARCHAR2,
  p_sha_reference_number  IN      VARCHAR2,   --CSC3221
  p_sha_pmh_id            IN      NUMBER,   --CSC3221
  p_sha_id                OUT     NUMBER,
  p_sha_actual_loc_code   IN      VARCHAR2   --CSC8347
) RETURN PLS_INTEGER;

--fonction qui supprime les LOCATION_SHIPPING_CONTAINERS
FUNCTION DELETE_LSC_FUNC(
  p_lsc_container_id  IN  NUMBER,
  p_lsc_suffix        IN  VARCHAR2
) RETURN PLS_INTEGER;

--fonction qui charge les missions dans les conteneurs
FUNCTION LOAD_CONTAINER_FUNC(		--CONTAINER_OPERATION_PACK
  p_shh_id        IN      NUMBER,
  p_container_id  IN      NUMBER,
  p_suffix        IN      VARCHAR2,   --CSC3195
  p_use_code      IN      NUMBER,   --CSC3195
  p_ccr_code      OUT     NUMBER
) RETURN PLS_INTEGER;

--fonction qui décharge les missions de la remorque
FUNCTION UNLOAD_CONTAINER_FUNC(		--CONTAINER_OPERATION_PACK
  p_shh_id        IN      NUMBER,
  p_container_id  IN      NUMBER,
  p_suffix        IN      VARCHAR2,   --CSC3195
  p_use_code      IN      NUMBER,   --CSC3195
  p_ccr_code      OUT     NUMBER
) RETURN PLS_INTEGER;

--fonction qui termine le chargement de le remorque
FUNCTION CLOSE_TRUCK_FUNC (
  p_shh_load_window     IN NUMBER,
  p_shh_loc_code        IN VARCHAR2,
  p_shh_cus_code        IN NUMBER,
  p_shh_ven_code        IN NUMBER,
  p_language_flag       IN VARCHAR2,	--CSC3429
  p_vocal_switch        IN NUMBER,  	--CSC3429
  p_ccr_code 		       	OUT NUMBER,
  p_ccr_message         OUT VARCHAR2, 	--CSC3429
  p_prn_id							IN	VARCHAR2 DEFAULT NULL --CSC4619 si l'imprimante est sélectionnée le rapport va sortir sur cette derniére sinon l'imprimante par défaut
) RETURN PLS_INTEGER;

--CSC4253 procédure créer pour le SGE Phenix
--presque pareil comme CUSTOMER_INVOICE_PACK.CREATE_TPC_COT_TO_ZERO_PROC
--appeller seulement pour les identifiants... alors pas besoin de valider la switch
FUNCTION VALIDATE_COT_PER_PLH_FUNC(
	p_plh_id 							IN NUMBER,
	p_shh_trailer_number	IN VARCHAR2,
	p_language_flag       IN VARCHAR2,--CSC3429
  p_vocal_switch        IN NUMBER,  --CSC3429
  p_ccr_code 		       	OUT NUMBER,
  p_ccr_message         OUT VARCHAR2 --CSC3429
) RETURN PLS_INTEGER;

-- Fonction qui modifie le statut d'un conteneur (chargé sur un camion ou non)
FUNCTION LOAD_OR_UNLOAD_CONTAINER_FUNC(
	p_container_id		IN	NUMBER,
	p_suffix					IN	VARCHAR2,
	p_loaded_switch		IN	NUMBER,
	p_language_flag  	IN  VARCHAR2,
  p_vocal_switch   	IN  NUMBER,
  p_ccr_code       	OUT NUMBER,
  p_ccr_message    	OUT VARCHAR2,
  p_loc_code				IN	VARCHAR2 DEFAULT NULL --CSC3624 si on lui envoi une localisation, on met à jour la localisation du conteneur
) RETURN PLS_INTEGER;

--CSC4253 Utiliser pour les conteneurs qui ne seront pas mis dans le camion
--mais qu'on facture quand même.. il seront dans le prochain camion un autre jour probablement..
--Doit être appeller lorsque l'utilisateur déplace le conteneur... il a le stock déjà dans sa loc user
--et il arrive pour remettre le stock dans une localisation quelconque en attente
--contient l'appel à WMS_SHIPPING_PACK.MOVE_CONTAINER_FUNC après avoir flaggé le conteneur
FUNCTION SET_CONTAINER_PAID_FUNC(
  p_shh_id        IN  NUMBER,	--csc4253
  p_from_loc      IN  VARCHAR2,
  p_to_loc        IN  VARCHAR2,
  p_cont_id       IN  NUMBER,
  p_loc_lsc       IN  VARCHAR2,
  p_use_code      IN  NUMBER,
  p_language_flag IN  VARCHAR2,--CSC3429
	p_vocal_switch  IN  NUMBER,  --CSC3429
  p_ccr_code      OUT NUMBER,
  p_ccr_message   OUT VARCHAR2
) RETURN PLS_INTEGER;

FUNCTION SET_TRANSIT_WAREHOUSE_FUNC (
	p_pmh_id        IN NUMBER,
  p_language_flag IN VARCHAR2,
  p_vocal_switch  IN NUMBER,
  p_pmh_status    OUT VARCHAR2
) RETURN PLS_INTEGER;

FUNCTION SET_WAREHOUSE_RETURN_FUNC (
	p_plh_id        	IN NUMBER,
  p_truck_code     	IN NUMBER,
	p_shipping_date  	IN DATE,
	p_src_whs_code   	IN VARCHAR2,
	p_dest_whs_code  	IN VARCHAR2,
	p_use_code       	IN NUMBER,
  p_language_flag  	IN VARCHAR2,
  p_vocal_switch   	IN NUMBER
) RETURN PLS_INTEGER;

FUNCTION SET_TRANSIT_INTERCO_FUNC (
	p_plh_id                 IN NUMBER,
 	p_truck_code             IN NUMBER,
	p_src_whs_code           IN VARCHAR2,
	p_dest_whs_code          IN VARCHAR2,
	p_expected_shipping_date IN DATE,
	p_use_code               IN NUMBER,
  p_language_flag          IN VARCHAR2,
  p_vocal_switch           IN NUMBER,
	p_trh_id                 OUT NUMBER
) RETURN PLS_INTEGER;

END WMS_LOADING_PACK;
/