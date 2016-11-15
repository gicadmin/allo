CREATE OR REPLACE PACKAGE phenix.REP_OPERATION_PACK IS


--la validation du LOCK BD (for update) est supposé avoir été faite AVANT d'appeller cette procédure
PROCEDURE SET_REP_PROCESSING_PROC(
  p_rep_id            IN replenishments.rep_id%TYPE,
  p_use_code          IN replenishments.rep_use_code%TYPE
);

PROCEDURE UPDATE_REQUIRED_WGT_PROC(
  p_rep_id            IN replenishments.rep_id%TYPE,
  p_required_to_add   IN replenishments.rep_weight_required%TYPE
);

PROCEDURE UPDATE_REQUIRED_QTY_PROC(
  p_rep_id            IN replenishments.rep_id%TYPE,
  p_required_to_add   IN replenishments.rep_quantity_required%TYPE
);

FUNCTION LOCK_ALL_FOR_A_REP_FUNC(
  p_rep_id IN replenishments.rep_id%TYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_REP_FUNC(
  p_rep_id      IN replenishments.rep_id%TYPE
)
RETURN BOOLEAN;

--ber3820 fonction pour voir si un produit/format/loc a déjà au moins un réappro d'urgence existant (et non terminé)
FUNCTION DO_URGENCY_REP_EXISTS_FUNC(
  p_loc_code            IN  locations.loc_code%TYPE,
  p_prd_code            IN  replenishments.rep_prf_prd_code%TYPE,
  p_fmt_code            IN  replenishments.rep_prf_fmt_code%TYPE
)
RETURN BOOLEAN;

FUNCTION COUNT_REP_IN_PROGRESS_FUNC(
  p_loc_code            IN  locations.loc_code%TYPE,
  p_prd_code            IN  replenishments.rep_prf_prd_code%TYPE,
  p_fmt_code            IN  replenishments.rep_prf_fmt_code%TYPE
)
RETURN NUMBER;

--ber3820 fonction pour voir sil reste des réappros pas commencé pour le produit/format/loc
FUNCTION COUNT_REP_NOT_IN_PROGRESS_FUNC(
  p_loc_code            IN  locations.loc_code%TYPE,
  p_prd_code            IN  replenishments.rep_prf_prd_code%TYPE,
  p_fmt_code            IN  replenishments.rep_prf_fmt_code%TYPE
)
RETURN NUMBER;

--CSC6701 Retourne un réapprovisionnement qui en progression en ce moment
FUNCTION FIND_REP_IN_PROGRESS_FUNC(
  p_rep_loc_code  IN  locations.loc_code%TYPE,
  p_rep_use_code  OUT replenishments.rep_use_code%TYPE
)
RETURN NUMBER;

PROCEDURE LOCK_AND_PROCESS_REP_PROC(
  p_rep_id    IN replenishments.rep_id%TYPE,
  p_use_code  IN NUMBER
);

--fonction pour valider si un réappro appartient bien à un utilisateur donné
PROCEDURE VALIDATE_THE_REP_USER_PROC( --raise error si qqchose cloche...
  p_rep_id    IN replenishments.rep_id%TYPE,
  p_use_code  IN NUMBER
);

PROCEDURE UNLOCK_REP_PROC(
  p_rep_id    IN replenishments.rep_id%TYPE,
  p_use_code  IN NUMBER
);

PROCEDURE TRANSFER_REP_FROM_USER_PROC(
  p_rep_id            IN replenishments.rep_id%TYPE,
  p_current_use_code  IN NUMBER,
  p_new_use_code      IN NUMBER
);

PROCEDURE UPDATE_REP_TAKEN_PROC(
  p_rep_id               IN replenishments.rep_id%TYPE,
  p_use_code             IN NUMBER,
  p_rep_taken_quantity   IN replenishments.rep_taken_quantity%TYPE,
  p_rep_taken_weight     IN replenishments.rep_taken_weight%TYPE
);

PROCEDURE SET_REP_STATUS_TERMINATED_PROC(
  p_rep_id        IN replenishments.rep_id%TYPE,
  p_use_code      IN NUMBER
);

FUNCTION FIND_AND_LOCK_REP_BY_PRD_FUNC(
  p_prd_code    IN VARCHAR2,
  p_which_prd   IN VARCHAR2,    --S ou D (S pour Source, D pour Destination)
  p_use_code    IN NUMBER,
  p_whs_code    IN VARCHAR2
)
RETURN NUMBER;

--trouver le premier préapro par route/zone et le réserver (si rou_code est null, ca cherchera les réappro SANS ROUTE seulement, les comptoirs)
FUNCTION FIND_AND_LOCK_REP_ROU_FUNC(
  p_whz_code            IN warehouse_zones.whz_code%TYPE, --peut être null, si null, on prend toutes les zones
  p_source_loc_code     IN locations.loc_code%TYPE, --la source OU la DEST doit être rempli...
  p_dest_loc_code       IN locations.loc_code%TYPE,
  p_use_code            IN NUMBER,
  p_whs_code            IN VARCHAR2,
  p_only_greater_switch IN NUMBER,   -- 0 sera >=    1 sera > seulement
  p_rou_code            IN NUMBER DEFAULT NULL  --si NULL, on cherche les réappros SANS ROUTE seulement
)
RETURN NUMBER;

--trouver le premier préapro par zone d'entreposage (urgence ET preventif)
FUNCTION FIND_AND_LOCK_REP_BY_WHZ_FUNC(
  p_whz_code            IN warehouse_zones.whz_code%TYPE, --peut être null, si null, on prend toutes les zones
  p_source_loc_code     IN locations.loc_code%TYPE, --la source OU la DEST doit être rempli...
  p_dest_loc_code       IN locations.loc_code%TYPE,
  p_use_code            IN NUMBER,
  p_whs_code            IN VARCHAR2,
  p_only_greater_switch IN NUMBER,   -- 0 sera >=    1 sera > seulement
  p_from_dock_switch    IN NUMBER
)
RETURN NUMBER;

--trouver le premier réappro PREVENTIF SEULEMENT!!
FUNCTION FIND_AND_LOCK_REP_PLANNED_FUNC(
  p_whz_code            IN warehouse_zones.whz_code%TYPE, --peut être null, si null, on prend toutes les zones
  p_source_loc_code     IN locations.loc_code%TYPE, --la source OU la DEST doit être rempli...
  p_dest_loc_code       IN locations.loc_code%TYPE,
  p_use_code            IN NUMBER,
  p_whs_code            IN VARCHAR2,
  p_only_greater_switch IN NUMBER   -- 0 sera >=    1 sera > seulement
)
RETURN NUMBER;

--procédure appellé lorsqu'un réappro est complété et est prêt à être supprimé
--s'il y avait des quantités/poids requis qui n'ont pas été comblé, on essait de trouver de l'inventaire pour créer un autre réappro
PROCEDURE COMPLETE_REP_PROC(
  p_rep_id    IN replenishments.rep_id%TYPE,
  p_use_code  IN users.use_code%TYPE
);

--procédure appellé par la génération des réappro d'urgence
--procédure qui essait de trouver un réappro avec des qté prises d'une loc de réserve, mais qui ne sont pas REQUIRED sur le reste du réappro
PROCEDURE USE_EXIST_REP_FOR_URGENCY_PROC(
  p_infos_rec                 IN REP_INFO_PACK.T_INFOS_FOR_REPLENISH,
  p_loc_code                  IN VARCHAR2,  --loc à réapprovisionner
  p_qty_wgt_still_missing     IN OUT NUMBER,  --qté/poids restant à trouver (au format de destination)..
  p_file_out          				IN UTL_FILE.file_type
);

--procédure utilisé dans la génération de réappro d'urgence (pour logger)
PROCEDURE WRITE_REP_INFOS_PROC(
  p_rep_record        IN replenishments%ROWTYPE,
  p_file_out          IN UTL_FILE.file_type
);

FUNCTION COMPLETE_INSERT_REP_FUNC(
  p_rep_record  IN OUT replenishments%ROWTYPE,
  p_file_out    IN UTL_FILE.file_type
)
RETURN NUMBER;

--procédure pour noter les infos des réappros venant d'une LOC rendu inutilisable,
--dans le but de pouvoir recréer les réappros venant d'ailleurs s'il y a de l'inventaire
PROCEDURE FIND_INFOS_FROM_REP_PROC(
  p_from_loc_code           IN replenishments.rep_from_loc_code%TYPE,
  p_prf_prd_code            IN replenishments.rep_prf_prd_code%TYPE,
  p_prf_fmt_code            IN replenishments.rep_prf_fmt_code%TYPE,
  p_infos_to_replenish_rec  OUT REP_INFO_PACK.t_infos_to_replenish_rec,
  p_log_id                  IN NUMBER
);

--procédure appellé lors de la génération des réappros d'urgence
PROCEDURE TRANSF_EXIST_REP_FOR_URG_PROC(
  p_infos_rec                 IN REP_INFO_PACK.T_INFOS_FOR_REPLENISH,
  p_loc_code                  IN VARCHAR2,  --loc à réapprovisionner
  p_qty_wgt_still_missing     IN OUT NUMBER,  --qté/poids restant à trouver (au format de destination)..
  p_file_out          				IN UTL_FILE.file_type
);

--CSC6701 Gérer les réapprovisionnements afin de les supprimer
--        car la localisation de destination du réappro. sera mise en retenue
--        Sert pour les localisations de cueillette
PROCEDURE FIX_REP_PICKING_RETAIN_PROC (
  p_to_loc_code   IN replenishment_details.red_to_loc_code%TYPE,
  p_prf_prd_code  IN replenishment_details.red_prf_prd_code%TYPE,
  p_prf_fmt_code  IN replenishment_details.red_prf_fmt_code%TYPE,
  p_log_id        IN NUMBER
);

FUNCTION GET_SUM_RPSH_QTY_WGT_PICK_FUNC (
  p_inv_loc_code        IN  inventories.inv_loc_code%TYPE,
  p_inv_prf_prd_code    IN  inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code    IN  inventories.inv_prf_fmt_code%TYPE,
  p_prd_definition      IN  products.prd_definition%TYPE
)
RETURN NUMBER;

FUNCTION GET_SUM_RPSH_QTY_WGT_OVST_FUNC (
  p_inv_loc_code        IN   inventories.inv_loc_code%TYPE,
  p_inv_prf_prd_code    IN   inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code    IN   inventories.inv_prf_fmt_code%TYPE,
  p_prd_definition      IN   products.prd_definition%TYPE,
  p_status              IN   VARCHAR2  DEFAULT 'C'
)
RETURN NUMBER;

PROCEDURE FIND_OVERSTOCK_PLANNED_PROC(
  p_prd_code                      IN VARCHAR2,    --produit a réapprovisionner
  p_prf_fmt_code                  IN VARCHAR2,    --format à réapprovisionner
  p_loc_code                      IN VARCHAR2,    --loc à réapprovisionner
  p_whs_code                      IN VARCHAR2,    --entrepot concerné
  p_prf_conversion_to_base        IN NUMBER,      --conversion du prf à réapprovisionner
  p_rep_status                    IN VARCHAR2 DEFAULT 'C',
  p_qty_per_pallet_in_fmt_wanted  IN NUMBER,      --qté par palette du prf à réapprovisionner
  p_validate_inventory_switch     IN NUMBER,  --switch a mettre à jour sur les nouveaux RED créés...
  p_qty_wgt_still_missing         IN OUT NUMBER,  --qté/poids restant à trouver (au format de destination)..
  p_nbr_replenishment             IN OUT NUMBER   --retourner le nouveau nombre si on a inséré..
);

FUNCTION ACTIVATE_REP_FUNC(
  p_whs_code	    IN	VARCHAR2,
  p_not_activated OUT NUMBER
)
RETURN PLS_INTEGER;

PROCEDURE DELETE_REP_C_FOR_WHS_PROC(
  p_whs_code IN VARCHAR2
);

FUNCTION GET_COUNT_NBR_REP_FUNC(
  p_rep_whs_code  IN replenishments.rep_whs_code%TYPE
) RETURN NUMBER;

FUNCTION GET_SUM_QTY_WGT_FUNC(
  p_rep_whs_code    IN replenishments.rep_whs_code%TYPE,
  p_rep_status      IN replenishments.rep_status%TYPE
) RETURN NUMBER;

PROCEDURE SELECT_REPLENISHMENTS_PROC(
  p_whs_code IN warehouses.whs_code%TYPE
);

PROCEDURE SPLIT_REPLENISHMENT_PROC(
  p_red_id            IN replenishment_details.red_id%TYPE,
  p_new_dest_loc_code IN replenishment_details.red_to_loc_code%TYPE,
  p_new_quantity      IN replenishments.rep_quantity%TYPE,
  p_new_weight        IN replenishments.rep_weight%TYPE
);

FUNCTION EXISTS_ON_USER_FUNC(
  p_rep_use_code IN replenishments.rep_use_code%TYPE
)
RETURN BOOLEAN;

END REP_OPERATION_PACK;
/