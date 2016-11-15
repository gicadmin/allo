CREATE OR REPLACE PACKAGE phenix.RME_OPERATION_PACK IS

FUNCTION GET_NEW_ID_FUNC
RETURN VARCHAR2;

FUNCTION GET_ID_FUNC(
  p_rme_route_code   IN report_merge.rme_route_code%TYPE,
  p_rme_route_date   IN report_merge.rme_route_date%TYPE,
  p_rme_whs_code     IN report_merge.rme_whs_code%TYPE
)
RETURN VARCHAR2;

PROCEDURE INSERT_ROUTE_PROC(
  p_rme_id          IN report_merge.rme_id%TYPE,
  p_rme_route_code  IN report_merge.rme_route_code%TYPE,
  p_rme_route_date  IN report_merge.rme_route_date%TYPE,
  p_rme_whs_code    IN report_merge.rme_whs_code%TYPE,
  p_rme_report_name IN report_merge.rme_report_name%TYPE,
  p_rme_report_path IN report_merge.rme_report_path%TYPE,
  p_rme_nb_copies   IN report_merge.rme_nb_copies%TYPE
);

PROCEDURE INSERT_CUSTOMER_PROC(
  p_rme_id          IN report_merge.rme_id%TYPE,
  p_rme_cus_code    IN report_merge.rme_cus_code%TYPE,
  p_rme_whs_code    IN report_merge.rme_whs_code%TYPE,
  p_rme_report_name IN report_merge.rme_report_name%TYPE,
  p_rme_report_path IN report_merge.rme_report_path%TYPE,
  p_rme_nb_copies   IN report_merge.rme_nb_copies%TYPE
);

PROCEDURE UPDATE_RME_PROC(
  p_rme_id   IN report_merge.rme_id%TYPE
);

PROCEDURE UPDATE_PRINT_SWITCH(
  p_rme_id   IN report_merge.rme_id%TYPE,
  p_status   IN NUMBER
);

PROCEDURE DELETE_RME_PROC;

PROCEDURE PRINT_RME_PROC(
  p_rme_id    IN report_merge.rme_id%TYPE,
  p_prn_id    IN printers.prn_id%TYPE,
  p_user_code IN users.use_code%TYPE
);

END RME_OPERATION_PACK;
/