CREATE OR REPLACE PACKAGE phenix.CONTAINER_OPERATION_PACK IS

--fonction qui transfére un produit d'un conteneur à un autre
--CSC4253 Le code du gun valide que, cette fonction ne peut pas transferer des produits entre 2 conteneurs si un des deux (ou les deux)
--        sont déjà facturé (LOCATION_SHIPPING_CONTAINERS WHERE LSC_INVOICED_SWITCH = 1)
FUNCTION CHANGE_CONTAINER_FUNC(               --à mettre dans CONTAINER_PACK
  p_prf_prd_code    IN      VARCHAR2,   --indique le produit qui est transféré
  p_prf_fmt_code    IN      VARCHAR2,   --indique le format du produit qui est transféré
  p_qty_weight      IN      NUMBER,     --indique la quantité qui est transféré entre les 2 conteneurs
  p_from_container  IN      NUMBER,     --indique le conteneur où produit est en ce moment (selon le système et les PMH)
  p_to_container    IN      NUMBER,     --indique le conteneur dans lequel on veut déplacer le produit
  p_ccr_code        OUT     NUMBER,     --code d'erreur à retransmettre en cas de problème
  p_use_code        IN      NUMBER      --CSC3595 indique l'utilisateur effectuant le changement de conteneur
)
RETURN PLS_INTEGER;

FUNCTION DELETE_CONTAINER_FUNC(
  p_container_id  IN      NUMBER,
  p_suffix        IN      VARCHAR2,
  p_error_code    OUT     NUMBER
)
RETURN PLS_INTEGER;

--CSC2998  FONCTION MOVE_CONTAINER_FUNC
--fonction qui permet de deplacer un container d'une localisation a une autre
FUNCTION MOVE_CONTAINER_FUNC(   --à mettre dans container_pack
  p_from_loc  IN      VARCHAR2,
  p_to_loc    IN      VARCHAR2,
  p_cont_id   IN      NUMBER,
  p_loc_lsc   IN      VARCHAR2,
  p_use_code  IN      NUMBER,   --CSC3214
  p_ccr_code  OUT     NUMBER
)
RETURN PLS_INTEGER;

--fonction qui charge les missions dans les conteneurs
FUNCTION LOAD_CONTAINER_FUNC(   --CONTAINER_OPERATION_PACK
  p_shh_id        IN      NUMBER,
  p_container_id  IN      NUMBER,
  p_suffix        IN      VARCHAR2,   --CSC3195
  p_use_code      IN      NUMBER,   --CSC3195
  p_ccr_code      OUT     NUMBER
)
RETURN PLS_INTEGER;

--fonction qui décharge les missions de la remorque
FUNCTION UNLOAD_CONTAINER_FUNC(   --CONTAINER_OPERATION_PACK
  p_shh_id        IN      NUMBER,
  p_container_id  IN      NUMBER,
  p_suffix        IN      VARCHAR2,   --CSC3195
  p_use_code      IN      NUMBER,   --CSC3195
  p_ccr_code      OUT     NUMBER
)
RETURN PLS_INTEGER;

-- Fonction qui modifie le statut d'un conteneur (chargé sur un camion ou non)
FUNCTION LOAD_OR_UNLOAD_CONTAINER_FUNC(
  p_container_id    IN  NUMBER,
  p_suffix          IN  VARCHAR2,
  p_loaded_switch   IN  NUMBER,
  p_language_flag   IN  VARCHAR2,
  p_vocal_switch    IN  NUMBER,
  p_ccr_code        OUT NUMBER,
  p_ccr_message     OUT VARCHAR2,
  p_loc_code        IN  VARCHAR2 DEFAULT NULL --CSC3624 si on lui envoi une localisation, on met à jour la localisation du conteneur
)
RETURN PLS_INTEGER;

--CSC4253 Utiliser pour les conteneurs qui ne seront pas mis dans le camion
--mais qu'on facture quand même.. il seront dans le prochain camion un autre jour probablement..
--Doit être appeller lorsque l'utilisateur déplace le conteneur... il a le stock déjà dans sa loc user
--et il arrive pour remettre le stock dans une localisation quelconque en attente
--contient l'appel à WMS_SHIPPING_PACK.MOVE_CONTAINER_FUNC après avoir flaggé le conteneur
FUNCTION SET_CONTAINER_PAID_FUNC(
  p_shh_id        IN  NUMBER, --csc4253
  p_from_loc      IN  VARCHAR2,
  p_to_loc        IN  VARCHAR2,
  p_cont_id       IN  NUMBER,
  p_loc_lsc       IN  VARCHAR2,
  p_use_code      IN  NUMBER,
  p_language_flag IN  VARCHAR2,--CSC3429
  p_vocal_switch  IN  NUMBER,  --CSC3429
  p_ccr_code      OUT NUMBER,
  p_ccr_message   OUT VARCHAR2
)
RETURN PLS_INTEGER;

-- BER2804 Déplacer les conteneurs dans une localisation d'urgence (ex : RESOLUTIONPR)
--         lorsque la mission n’a pas été cueilli au complet (« outrepasser »)
--         Le traitement provient de la fonction "WMS RELEASE AND RETAIN_PACK.RELEASE PICK MISSIONS FUNC"
FUNCTION MOVE_CONTAINER_TO_URGENCY_FUNC(
  p_pmh_id                  IN NUMBER,
  p_use_code                IN NUMBER,
  p_language_flag           IN VARCHAR2,
  p_vocal_switch            IN NUMBER,
  p_error_code              OUT NUMBER,
  p_error_message           OUT VARCHAR2,
  p_whs_transit_loc_code    IN VARCHAR2 DEFAULT NULL,
  p_formated_use_loc_code   IN VARCHAR2 DEFAULT NULL
)
RETURN PLS_INTEGER;

PROCEDURE MOVE_CONTAINER_TO_USER_PROC(
  p_pmh_id           IN pick_mission_headers.pmh_id%TYPE,
  p_use_code         IN users.use_code%TYPE,
  p_urgency_loc_code IN locations.loc_code%TYPE,
  p_user_loc_code    IN locations.loc_code%TYPE,
  p_vocal_switch     IN NUMBER
);

END CONTAINER_OPERATION_PACK;
/