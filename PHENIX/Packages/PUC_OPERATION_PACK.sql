CREATE OR REPLACE PACKAGE phenix.PUC_OPERATION_PACK AS

FUNCTION DELETE_FUNC(
  p_puc_pus_id IN pci_user_customers.puc_pus_id%TYPE
)
RETURN NUMBER;

END PUC_OPERATION_PACK;
/