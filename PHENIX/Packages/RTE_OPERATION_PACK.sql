CREATE OR REPLACE PACKAGE phenix.RTE_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_rte_cus_code IN route_transport_exceptions.rte_cus_code%TYPE
);

END RTE_OPERATION_PACK;
/