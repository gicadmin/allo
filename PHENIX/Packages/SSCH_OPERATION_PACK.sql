CREATE OR REPLACE PACKAGE phenix.SSCH_OPERATION_PACK AS

FUNCTION GET_ANOTHER_ACTIVE_FUNC(
  p_ssch_code     IN site_sales_contract_headers.ssch_code%TYPE,
  p_ssch_sit_code IN site_sales_contract_headers.ssch_sit_code%TYPE
)
RETURN VARCHAR2;

PROCEDURE GET_ACTIVE_CONTRACT_PROC(
  p_ssch_sit_code   IN  site_sales_contract_headers.ssch_sit_code%TYPE,
  p_ssch_code       OUT site_sales_contract_headers.ssch_code%TYPE,
  p_ssch_start_date OUT site_sales_contract_headers.ssch_start_date%TYPE,
  p_ssch_end_date   OUT site_sales_contract_headers.ssch_end_date%TYPE
);

END SSCH_OPERATION_PACK;
/