CREATE OR REPLACE PACKAGE phenix.TBS_OPERATION_PACK AS

PROCEDURE ADD_PROC(
    p_cus_code       IN CUSTOMERS.CUS_CODE%type,
    p_tot_code       IN TOTE_BOX_TYPES.TOT_CODE%type,
    p_quantity       IN NUMBER,
    p_status         IN VARCHAR2

);
PROCEDURE SUBTRACT_PROC(
    p_cus_code       IN CUSTOMERS.CUS_CODE%type,
    p_tot_code       IN TOTE_BOX_TYPES.TOT_CODE%type,
    p_quantity       IN NUMBER,
    p_status         IN VARCHAR2

);

PROCEDURE PURGE_PROC(
  p_tbs_cus_code IN tote_box_summaries.tbs_cus_code%TYPE
);

END TBS_OPERATION_PACK;
/