CREATE OR REPLACE PACKAGE phenix.CIU_OPERATION_PACK IS

PROCEDURE AUTOMATIC_VALIDATION_PROC (p_nbre_deleted OUT NUMBER);
------------------------------------------------------------
PROCEDURE ADD_CIU_REJET_PROC(
  p_message		                  IN VARCHAR2,
  p_prf_prd_code			          IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code                IN product_formats.prf_fmt_code%TYPE,
  p_whs_code                    IN location_types.lty_whs_code%TYPE,
  p_valeurs_refused             IN VARCHAR2 --DIMENSIONS,UPC,TOUS
 );
PROCEDURE MAIL_REJET_PROC (p_send_mail OUT NUMBER);
-----------------------------------------------
PROCEDURE UPDATE_CIU_PROC(
  p_ciu_prf_prd_code        IN  cubiscan_interface_updates.ciu_prf_prd_code%TYPE,
  p_ciu_prf_fmt_code        IN  cubiscan_interface_updates.ciu_prf_fmt_code%TYPE,
  p_ciu_prf_height          IN  cubiscan_interface_updates.ciu_prf_height%TYPE,
  p_ciu_prf_width           IN  cubiscan_interface_updates.ciu_prf_width%TYPE,
  p_ciu_prf_length          IN  cubiscan_interface_updates.ciu_prf_length%TYPE,
  p_ciu_prf_purchase_weight IN  cubiscan_interface_updates.ciu_prf_purchase_weight%TYPE,
  p_ciu_prf_upc_code        IN  cubiscan_interface_updates.ciu_prf_upc_code%TYPE,
  p_ciu_loc_code            IN  cubiscan_interface_updates.ciu_loc_code%TYPE
);
PROCEDURE RESET_PROC ;

PROCEDURE PURGE_PROC(
  p_ciu_prf_prd_code IN cubiscan_interface_updates.ciu_prf_prd_code%TYPE,
  p_ciu_prf_fmt_code IN cubiscan_interface_updates.ciu_prf_fmt_code%TYPE
);

END CIU_OPERATION_PACK;
/