CREATE OR REPLACE PACKAGE phenix.PCRF_OPERATION_PACK AS

FUNCTION DELETE_FUNC(
  p_pcrf_pcro_id IN pci_role_features.pcrf_pcro_id%TYPE
)
RETURN NUMBER;

END PCRF_OPERATION_PACK;
/