CREATE OR REPLACE PACKAGE phenix.LSC_OPERATION_PACK IS

--function pour créer les LSC des pick_missions
FUNCTION INSERT_LSC_FOR_GIVEN_PMH_FUNC(
	p_ctr_identifiers_switch 	IN NUMBER,
	p_pmh_id									IN NUMBER,
	p_shipping_dock_loc_code	IN VARCHAR2,
	p_log_message							OUT VARCHAR2,
	p_log_error								OUT VARCHAR2,
  v_file_out       					IN  UTL_FILE.file_type	--sert seulement à remplir un fichier de trace, on le garde
)
RETURN BOOLEAN;

--fonction qui retourne un quai d'expédition pour une mission donnée
FUNCTION FIND_SHIPPING_DOCK_FUNC(
  p_pmh_id    IN  NUMBER,
  p_loc_code  OUT VARCHAR2
)
RETURN PLS_INTEGER;

--fonction qui supprime les LOCATION_SHIPPING_CONTAINERS
FUNCTION DELETE_LSC_AND_LOG_FUNC(
  p_lsc_container_id  IN  NUMBER,
  p_lsc_suffix        IN  VARCHAR2
)
RETURN PLS_INTEGER;

END LSC_OPERATION_PACK;
/