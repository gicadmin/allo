CREATE OR REPLACE PACKAGE phenix.WMS_SHIPPING_PACK IS

FUNCTION FIND_SHIPPING_DOCK_FUNC (
  P_PMH_ID    IN  NUMBER,
  P_LOC_CODE  OUT VARCHAR2
)
RETURN PLS_INTEGER;

FUNCTION OPEN_DOCK_FUNC(
  p_cda_id         IN  NUMBER,
  p_language_flag  IN  VARCHAR2,
  p_vocal_switch   IN  NUMBER,
  p_ccr_code       OUT NUMBER,
  p_ccr_message    OUT VARCHAR2
)
RETURN PLS_INTEGER;

FUNCTION CLOSE_DOCK_FUNC (
  p_cda_id         IN  NUMBER,
  p_language_flag  IN  VARCHAR2,
  p_vocal_switch   IN  NUMBER,
  p_ccr_code       OUT NUMBER,
  p_ccr_message    OUT VARCHAR2,
  p_do_commit			IN 	NUMBER DEFAULT 1	--CSC4253, par défaut, on commit, car c'est ce que ca faisait originalement
)
RETURN PLS_INTEGER;

FUNCTION CHANGE_CONTAINER_FUNC(
  p_prf_prd_code   IN  VARCHAR2,
  p_prf_fmt_code   IN  VARCHAR2,
  p_qty_weight     IN  NUMBER,
  p_from_container IN  NUMBER,
  p_to_container   IN  NUMBER,
  p_ccr_code       OUT NUMBER,
  p_use_code       IN  NUMBER
)
RETURN PLS_INTEGER;

FUNCTION DELETE_CONTAINER_FUNC(
	p_container_id	IN	NUMBER,
	p_suffix				IN	VARCHAR2,
	p_error_code 		OUT NUMBER
)
RETURN PLS_INTEGER;

----------------------------------------------------------------------------------------------------------------------
--fonction qui met à jour la ligne de pmd existante avec les nouvelle valeurs déduites de qty et insére une nouvelle ligne avec la qty à transférere
-----------------------------------------------------------------------------------------------------------------------
FUNCTION UPDATE_PMD_MDP_FUNC(
  p_prf_prd_code       						IN	VARCHAR2,	--indique le code de produit à transférer
  p_prf_fmt_code       						IN	VARCHAR2,	--indique le code de format à transférer
  p_original_pmd_id             	IN  NUMBER,		--indique la ligne de mission originale (de laquelle on soustrait)
  p_original_pmd_qty_picked_left 	IN	NUMBER,		--indique la quantité cueillie à laisser sur la ligne de mission originale (de laquelle on soustrait)
  p_original_pmd_wght_pickd_left	IN	NUMBER,		--indique le poids cueilli à laisser sur la ligne de mission originale (de laquelle on soustrait)
  p_destination_pmh_id						IN 	NUMBER,		--indique le no de mission de destination (sur laquelle on ajoute)
  p_destination_pmd_sequence			IN	NUMBER,		--indique la séquence d'affichage à utiliser pour la nouvelle ligne
  p_destination_pmd_qty_picked		IN	NUMBER,		--indique la quantité cueillie à mettre sur la nouvelle ligne
  p_destination_pmd_qty						IN	NUMBER,		--indique la quantité demandée à mettre sur la nouvelle ligne
  p_destination_pmd_wght_picked		IN	NUMBER,		--indique le poids cueilli à mettre sur la nouvelle ligne
  p_destination_pmd_wght					IN	NUMBER,		--indique le poids demandé à mettre sur la nouvelle ligne
  p_destination_pmd_loc_code			IN	VARCHAR2,	--indique la loc de cueillette originale à mettre sur la nouvelle ligne
  p_destination_pmd_id						OUT	NUMBER		--renvoit le ID de la ligne de mission créée
)
RETURN PLS_INTEGER;

--csc3111 création de la fonction pour trouver l'heure-minute de possession du quai
FUNCTION FIND_POSSESSION_TIME_FUNC(
  p_cus_code     				IN NUMBER,
  p_ven_code     				IN NUMBER,
  p_route_code					IN NUMBER,		--sert seulement à savoir si le client est une commande comptoir
  p_shipping_dock_code	IN VARCHAR2,	--doit toujours passé un seul de ces 5 paramètres (aucun nécessaire pour le vendor)
  p_plh_id							IN NUMBER,		--doit toujours passé un seul de ces 5 paramètres (aucun nécessaire pour le vendor)
  p_osm_id     	 				IN NUMBER,		--doit toujours passé un seul de ces 5 paramètres (aucun nécessaire pour le vendor)
  p_pmd_id 							IN NUMBER,		--doit toujours passé un seul de ces 5 paramètres (aucun nécessaire pour le vendor)
  p_pmh_id 							IN NUMBER,		--doit toujours passé un seul de ces 5 paramètres (aucun nécessaire pour le vendor)
  p_separateur   				IN VARCHAR2 DEFAULT NULL  --indique le séparateur entre les heures et minutes
)
RETURN VARCHAR2;

FUNCTION MOVE_CONTAINER_FUNC (
	p_from_loc   IN  VARCHAR2,
	p_to_loc     IN  VARCHAR2,
	p_cont_id    IN  NUMBER,
	p_loc_lsc    IN  VARCHAR2,
	p_use_code	 IN	 NUMBER,
	p_ccr_code   OUT NUMBER
)
RETURN PLS_INTEGER;

--CSC3233 Voir si la mission donnée inclus des cueillettes au sol
FUNCTION FIND_IF_MISSION_ON_GROUND_FUNC(
  p_pmh_id          		IN NUMBER,
  p_pmh_type						IN VARCHAR2,
  p_pmh_counter_switch  IN NUMBER
)
RETURN NUMBER;

FUNCTION FIND_DATE_EXPIRY_INV_FUNC(
  p_loc               IN VARCHAR2,
  p_prd_code          IN VARCHAR2,
  p_fmt_code          IN VARCHAR2,
  p_fifo_date         OUT DATE,
  p_expiry_date       OUT DATE
)
RETURN PLS_INTEGER ;

FUNCTION CREATE_CMA_AUDIT_FUNC(--csc3595
	p_cma_prf_prd_code					IN 	VARCHAR2,
	p_cma_prf_fmt_code					IN 	VARCHAR2,
	p_cma_quantity_moved				IN 	NUMBER,
	p_cma_weight_moved    			IN 	NUMBER,
	p_cma_source_container			IN	VARCHAR2,
	p_cma_destination_container	IN  VARCHAR2,
	p_cma_use_code        			IN  NUMBER ,
	p_cma_loc_code        			IN  VARCHAR2
	)
RETURN PLS_INTEGER;

END WMS_SHIPPING_PACK;
/