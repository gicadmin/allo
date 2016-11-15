CREATE OR REPLACE PACKAGE phenix.PCRO_OPERATION_PACK AS

PROCEDURE UPDATE_PROC(
  p_pcro_id                 IN pci_roles.pcro_id%TYPE,
  p_pcro_name               IN pci_roles.pcro_name%TYPE,
  p_pcro_alt_name           IN pci_roles.pcro_alt_name%TYPE,
  p_pcro_active_switch      IN pci_roles.pcro_active_switch%TYPE,
  p_pcro_owned_by_cus_code  IN pci_roles.pcro_owned_by_cus_code%TYPE,
  p_pcro_pcro_id            IN pci_roles.pcro_pcro_id%TYPE,
  p_pcro_modification_date  IN pci_roles.pcro_modification_date%TYPE DEFAULT SYSDATE
);

END PCRO_OPERATION_PACK;
/