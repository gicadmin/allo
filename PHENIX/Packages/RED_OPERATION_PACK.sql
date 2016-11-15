CREATE OR REPLACE PACKAGE phenix.RED_OPERATION_PACK IS

FUNCTION LOCK_ALL_RED_FOR_A_REP_FUNC(
  p_red_rep_id IN replenishment_details.red_rep_id%TYPE
)
RETURN BOOLEAN;

--BER3820 Création de la fonction pour le ORDER BY dans la génération des réappro...
FUNCTION FIND_MIN_LOC_FUNC(
	p_rep_id 				IN NUMBER
)
RETURN VARCHAR2;

--BER3820 Création de la fonction pour le ORDER BY dans la génération des réappro...
FUNCTION FIND_SOURCE_SUGG_QTY_WGHT_FUNC(
	p_rep_id 				IN NUMBER
)
RETURN NUMBER;

FUNCTION DOES_PRF_EXISTS_FOR_REP_FUNC(
  p_rep_id        IN replenishments.rep_id%TYPE,
  p_prf_prd_code  IN replenishment_details.red_prf_prd_code%TYPE, --GCL8571
  p_prf_fmt_code  IN replenishment_details.red_prf_fmt_code%TYPE,
  p_to_loc_code   IN replenishment_details.red_to_loc_code%TYPE,
  p_red_rec       OUT NOCOPY replenishment_details%ROWTYPE
) RETURN BOOLEAN;

PROCEDURE UPDATE_UNASSIGNED_WEIGHT_PROC(
  p_red_id            IN replenishment_details.red_id%TYPE,
  p_weight_to_delete  IN replenishment_details.red_result_unassigned_weight%TYPE
);

PROCEDURE UPDATE_UNASSIGNED_QTY_PROC(
  p_red_id              IN replenishment_details.red_id%TYPE,
  p_quantity_to_delete  IN replenishment_details.red_result_unassigned_quantity%TYPE
);

PROCEDURE UPDATE_SUGGESTED_QTY_PROC(
  p_red_id            IN replenishment_details.red_id%TYPE,
  p_result_qty_to_add IN replenishment_details.red_result_suggested_quantity%TYPE,
  p_source_qty_to_add IN replenishment_details.red_source_suggested_quantity%TYPE
);

PROCEDURE UPDATE_SUGGESTED_WGT_PROC(
  p_red_id            IN replenishment_details.red_id%TYPE,
  p_result_wgt_to_add IN replenishment_details.red_result_suggested_weight%TYPE,
  p_source_wgt_to_add IN replenishment_details.red_source_suggested_weight%TYPE
);

PROCEDURE UPDATE_QUANTITIES_PROC(
  p_red_id            IN replenishment_details.red_id%TYPE,
  p_source_qty_to_add IN replenishment_details.red_source_suggested_quantity%TYPE,
  p_result_qty_to_add IN replenishment_details.red_result_suggested_quantity%TYPE,
  p_result_unassigned IN replenishment_details.red_result_unassigned_quantity%TYPE
);

PROCEDURE UPDATE_WEIGHTS_PROC(
  p_red_id            IN replenishment_details.red_id%TYPE,
  p_source_wgt_to_add IN replenishment_details.red_source_suggested_weight%TYPE,
  p_result_wgt_to_add IN replenishment_details.red_result_suggested_weight%TYPE,
  p_result_unassigned IN replenishment_details.red_result_unassigned_weight%TYPE
);

PROCEDURE SET_RED_STATUS_LOC_CONF_PROC(
  p_red_id        IN replenishments.rep_id%TYPE,
  p_use_code      IN NUMBER
);

PROCEDURE UPDATE_TAKEN_AND_CLOSE_PROC(
  p_red_id                      IN replenishment_details.red_id%TYPE,
  p_use_code                    IN NUMBER,
  p_red_source_taken_quantity   IN replenishment_details.red_source_taken_quantity%TYPE,
  p_red_source_taken_weight     IN replenishment_details.red_source_taken_weight%TYPE,
  p_red_result_taken_quantity   IN replenishment_details.red_result_taken_quantity%TYPE,
  p_red_result_taken_weight     IN replenishment_details.red_result_taken_weight%TYPE
);

--procédure appellé lors de la génération de réappro d'urgence, pour libérer des qté suggérées (non requises) sur d'autres RED du REP concerné
PROCEDURE TO_FREE_QUANTITY_PROC(
  p_rep_id            IN replenishments.rep_id%TYPE,
  p_quantity_to_free  IN NUMBER,
  p_file_out          IN UTL_FILE.file_type
);

--procédure appellé lors de la génération de réappro d'urgence, pour libérer des poids suggérés (non requis) sur d'autres RED du REP concerné
PROCEDURE TO_FREE_WEIGHT_PROC(
  p_rep_id          IN replenishments.rep_id%TYPE,
  p_weight_to_free  IN NUMBER,
  p_file_out        IN UTL_FILE.file_type
);

--procédure appellé lors de la génération de réappro d'urgence
--procédure qui essait de trouver un réappro avec des qté déjà REQUIRED, mais dont une portion du format résultant n'est pas utilisé
--(pour les brisements de produit/format, une CAISSE brisé en 4 UNITÉS, si 1 seul des UN est vraiment requis, le REQUIRED doit quand même etre 4, mais le UNASSIGNED sera de 3 UN)
PROCEDURE FIND_UNASSIGNED_PROC(
  p_infos_rec               IN REP_INFO_PACK.T_INFOS_FOR_REPLENISH,
  p_loc_code                IN VARCHAR2,  --loc à réapprovisionner
  p_qty_wgt_still_missing   IN OUT NUMBER,  --qté/poids restant à trouver (au format de destination)..
  p_file_out          			IN UTL_FILE.file_type
);

--procédure utilisé pour la génération des réappros d'urgence (pour logger)
PROCEDURE WRITE_RED_INFOS_PROC(
  p_red_record        IN replenishment_details%ROWTYPE,
  p_file_out          IN UTL_FILE.file_type
);

PROCEDURE COMPLETE_INSERT_RED_PROC(
  p_red_rec   IN OUT replenishment_details%ROWTYPE,
  p_infos_rec IN REP_INFO_PACK.T_INFOS_FOR_REPLENISH,
  p_file_out  IN UTL_FILE.file_type
);

--procédure utilisé pour noter les infos d'un RED qu'on va recréer ensuite (à partir d'une autre loc)
PROCEDURE FILL_INFO_TO_RECREATE_RED_PROC(
  p_rep_id                    IN    replenishments.rep_id%TYPE,
  p_infos_to_replenish_rec    OUT   REP_INFO_PACK.t_infos_to_replenish_rec,
  p_plh_vph_info_rec          IN    RPL_OPERATION_PACK.t_plh_vph,
  p_whs_code                  IN    warehouses.whs_code%TYPE,
  p_log_id                    IN    NUMBER
);

FUNCTION IS_THIS_RED_THE_LAST_ONE_FUNC(
  p_given_rep_id      IN replenishment_details.red_rep_id%TYPE,
  p_maybe_last_red_id IN replenishment_details.red_id%TYPE
)
RETURN BOOLEAN;

PROCEDURE TRANSF_EXIST_REP_FOR_PLAN_PROC(
  p_prd_code                    IN VARCHAR2,  --produit a réapprovisionner
  p_prf_fmt_code                IN VARCHAR2,  --format à réapprovisionner
  p_loc_code                    IN VARCHAR2,  --loc à réapprovisionner
  p_whs_code                    IN VARCHAR2,  --entrepot concerné
  p_prd_result_definition       IN VARCHAR2,  --definition du produit à réapprovisionner
  p_rep_status                  IN VARCHAR2 DEFAULT 'C',
  p_validate_inventory_switch   IN NUMBER DEFAULT 0,  --switch a mettre à jour sur les nouveaux RED créés...
  p_qty_wgt_still_missing       IN OUT NUMBER,  --qté/poids restant à trouver du produit à réapprovisionner (au format de destination)..
  p_nbr_replenishment           IN OUT NUMBER   --retourner le nouveau nombre si on a inséré..
);

PROCEDURE USE_EXIST_REP_FOR_PLANNED_PROC(
  p_prd_code                    IN VARCHAR2,  --produit a réapprovisionner
  p_prf_fmt_code                IN VARCHAR2,  --format à réapprovisionner
  p_loc_code                    IN VARCHAR2,  --loc à réapprovisionner
  p_whs_code                    IN VARCHAR2,  --entrepot concerné
  p_prd_definition              IN VARCHAR2,
  p_prf_conversion_to_base      IN NUMBER,      --conversion du prf à réapprovisionner
  p_rep_status                  IN VARCHAR2 DEFAULT 'C',  --
  p_validate_inventory_switch   IN NUMBER DEFAULT 0,  --switch a mettre à jour sur les nouveaux RED créés...
  p_qty_wgt_still_missing       IN OUT NUMBER,  --qté/poids restant à trouver (au format de destination)..
  p_nbr_replenishment           IN OUT NUMBER   --retourner le nouveau nombre si on a inséré..
);

FUNCTION ACTIVATE_RED_FUNC(
  p_red_rep_id IN replenishment_details.red_rep_id%TYPE
)
RETURN PLS_INTEGER;

PROCEDURE REMOVE_RED_IN_PROC(
  p_rep_id  IN replenishments.rep_id%TYPE,
  p_log_id  IN NUMBER DEFAULT NULL
);

PROCEDURE CHANGE_DEST_LOCATION_PROC(
  p_red_id            IN replenishment_details.red_id%TYPE,
  p_new_dest_loc_code IN replenishment_details.red_to_loc_code%TYPE
);

END RED_OPERATION_PACK;
/