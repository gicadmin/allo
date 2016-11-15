CREATE OR REPLACE PACKAGE phenix.VCA_OPERATION_PACK AS

FUNCTION DELETE_VCA_VSA_CODE_FUNC (
  p_vca_vsa_code  vendor_customer_agreements.vca_vsa_code%TYPE
) RETURN NUMBER;

FUNCTION INSERT_VCA_FOR_NAC_FUNC(
  p_nac_code    IN national_accounts.nac_code%TYPE
) RETURN NUMBER;

END VCA_OPERATION_PACK;
/