CREATE OR REPLACE PACKAGE phenix.VET_OPERATION_PACK IS

FUNCTION EXIST_EDI_ASN_FUNC(
  p_vet_ven_code  IN vendor_edi_transactions.vet_ven_code%TYPE
) RETURN BOOLEAN;

END VET_OPERATION_PACK;
/