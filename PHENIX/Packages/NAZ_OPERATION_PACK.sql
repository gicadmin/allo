CREATE OR REPLACE PACKAGE phenix.NAZ_OPERATION_PACK AS

FUNCTION GET_COUNT_NAC_FUNC(
  p_naz_nac_code IN national_account_zones.naz_nac_code%TYPE
) RETURN NUMBER;

FUNCTION GET_ANY_ZONE(
  p_naz_nac_code IN national_account_zones.naz_nac_code%TYPE
) RETURN NUMBER;

END  NAZ_OPERATION_PACK;
/