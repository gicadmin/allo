CREATE OR REPLACE PACKAGE phenix.TEC_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_tec_ven_code IN transporter_ref_customers.tec_ven_code%TYPE
);

END TEC_OPERATION_PACK;
/