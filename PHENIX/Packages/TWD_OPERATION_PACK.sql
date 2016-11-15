CREATE OR REPLACE PACKAGE phenix.TWD_OPERATION_PACK AS

PROCEDURE INSERT_PROC(
  p_twd_pmh_id      IN  transit_warehouse_details.twd_pmh_id%TYPE,
  p_twd_twh_plh_id  IN  transit_warehouse_details.twd_twh_plh_id%TYPE
);

END TWD_OPERATION_PACK;
/