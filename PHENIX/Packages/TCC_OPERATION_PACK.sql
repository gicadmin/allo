CREATE OR REPLACE PACKAGE phenix.TCC_OPERATION_PACK IS
/*
*  GIMAT    DATE       AUTHOR      DESCRIPTION
* ------- ----------   --------    ---------------------------------------------
* GCL9056  03-03-2015  Mouloud B   Création initiale du package
*
*/

PROCEDURE DELETE_TCC_PROC(
  p_cod_coh_id               IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number          IN customer_order_details.cod_pod_line_number%TYPE,
  p_vwh_caps_tch_locking_id  IN temporary_caps_cods.tcc_tch_id%TYPE
);
END TCC_OPERATION_PACK;
/