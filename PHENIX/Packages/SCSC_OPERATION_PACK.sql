CREATE OR REPLACE PACKAGE phenix.SCSC_OPERATION_PACK AS

FUNCTION EXISTS_FUNC(
  p_scsc_coca_code IN site_contract_sale_commitments.scsc_coca_code%TYPE
)
RETURN BOOLEAN;

END SCSC_OPERATION_PACK;
/