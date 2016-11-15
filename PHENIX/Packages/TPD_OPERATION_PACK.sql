CREATE OR REPLACE PACKAGE phenix.TPD_OPERATION_PACK AS

PROCEDURE ADD_DETAIL_PROC (
  p_coh_id             customer_order_headers.coh_id%TYPE,
  p_cod_line_number    customer_order_details.cod_line_number%TYPE
);

END TPD_OPERATION_PACK;
/