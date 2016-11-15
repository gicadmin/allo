CREATE OR REPLACE PACKAGE phenix.PCDL_OPERATION_PACK AS

PROCEDURE UPDATE_PROC(
  p_pcdl_id              IN pci_customer_display_lists.pcdl_id%TYPE,
  p_pcdl_description     IN pci_customer_display_lists.pcdl_description%TYPE,
  p_pcdl_alt_description IN pci_customer_display_lists.pcdl_alt_description%TYPE DEFAULT NULL
);

PROCEDURE PURGE_PROC(
  p_pcdl_id IN pci_customer_display_lists.pcdl_id%TYPE,
  p_raise   IN BOOLEAN DEFAULT TRUE
);

END PCDL_OPERATION_PACK;
/