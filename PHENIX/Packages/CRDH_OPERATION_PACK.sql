CREATE OR REPLACE PACKAGE phenix.CRDH_OPERATION_PACK AS

FUNCTION GET_FORMATED_SEQUENCE_FUNC(
  p_crdh_id IN customer_route_docum_headers.crdh_id%TYPE
)
RETURN VARCHAR2;
FUNCTION GET_ONLY_SEQUENCE_FUNC(
  p_formated_sequence IN VARCHAR2
)
RETURN NUMBER;
PROCEDURE GET_DATE_AND_SEQUENCE_PROC(
  p_formated_sequence IN VARCHAR2,
  p_route_date        OUT customer_route_docum_headers.crdh_rou_date%TYPE,
  p_sequence          OUT customer_route_docum_headers.crdh_sequence%TYPE,
  p_whs_code          OUT customer_route_docum_headers.crdh_whs_code%TYPE
);
FUNCTION GET_MAX_SEQUENCE_FUNC(
  p_crdh_rou_date IN customer_route_docum_headers.crdh_rou_date%TYPE,
  p_whs_code      IN customer_route_docum_headers.crdh_whs_code%TYPE
)
RETURN NUMBER;
FUNCTION EXISTS_CRDH_FUNC(
  p_crdh_cus_code IN customer_route_docum_headers.crdh_cus_code%TYPE,
  p_crdh_rou_code IN customer_route_docum_headers.crdh_rou_code%TYPE,
  p_crdh_rou_date IN customer_route_docum_headers.crdh_rou_date%TYPE
)
RETURN BOOLEAN;
PROCEDURE PURGE_PROC(
  p_nb_days_to_keep IN NUMBER,
  p_max_items       IN NUMBER
);
END CRDH_OPERATION_PACK;
/