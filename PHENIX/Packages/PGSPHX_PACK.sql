CREATE OR REPLACE PACKAGE phenix.PGSPHX_PACK IS

PROCEDURE INSERT_CIU_PROC (
  p_ciu_prf_prd_code        IN  cubiscan_interface_updates.ciu_prf_prd_code%TYPE,
  p_ciu_prf_fmt_code        IN  cubiscan_interface_updates.ciu_prf_fmt_code%TYPE,
  p_ciu_prf_height          IN  cubiscan_interface_updates.ciu_prf_height%TYPE,
  p_ciu_prf_width           IN  cubiscan_interface_updates.ciu_prf_width%TYPE,
  p_ciu_prf_length          IN  cubiscan_interface_updates.ciu_prf_length%TYPE,
  p_ciu_prf_purchase_weight IN  cubiscan_interface_updates.ciu_prf_purchase_weight%TYPE,
  p_ciu_prf_upc_code        IN  cubiscan_interface_updates.ciu_prf_upc_code%TYPE,
  p_ciu_loc_code            IN  cubiscan_interface_updates.ciu_loc_code%TYPE
);

FUNCTION GET_CUBISCAN_ALERT_EMAIL_FUNC
RETURN system_parameters.spa_value%TYPE;

PROCEDURE UPDATE_CIU_PROC (
  p_ciu_prf_prd_code        IN  cubiscan_interface_updates.ciu_prf_prd_code%TYPE,
  p_ciu_prf_fmt_code        IN  cubiscan_interface_updates.ciu_prf_fmt_code%TYPE,
  p_ciu_prf_height          IN  cubiscan_interface_updates.ciu_prf_height%TYPE,
  p_ciu_prf_width           IN  cubiscan_interface_updates.ciu_prf_width%TYPE,
  p_ciu_prf_length          IN  cubiscan_interface_updates.ciu_prf_length%TYPE,
  p_ciu_prf_purchase_weight IN  cubiscan_interface_updates.ciu_prf_purchase_weight%TYPE,
  p_ciu_prf_upc_code        IN  cubiscan_interface_updates.ciu_prf_upc_code%TYPE,
  p_ciu_loc_code            IN  cubiscan_interface_updates.ciu_loc_code%TYPE
);

FUNCTION GET_DIRECTORY_PATH_FUNC(
  p_directory_name IN VARCHAR2
)
RETURN VARCHAR2;

-------------------------------------------------------------------

END PGSPHX_PACK;
/