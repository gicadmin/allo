CREATE OR REPLACE PACKAGE phenix.VTS_OPERATION_PACK AS
FUNCTION GET_DESC_INFO_FUNC(
  p_vts_code                   IN VARCHAR2,
  p_vts_federal_tax_switch     OUT NUMBER,
  p_vts_provincial_tax_switch  OUT NUMBER,
  p_lang                       IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

END VTS_OPERATION_PACK;
/