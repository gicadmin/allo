CREATE OR REPLACE PACKAGE phenix.PFE_OPERATION_PACK AS

PROCEDURE UPDATE_PROC(
  p_pfe_code                 IN pci_features.pfe_code%TYPE,
  p_pfe_name                 IN pci_features.pfe_name%TYPE,
  p_pfe_alt_name             IN pci_features.pfe_alt_name%TYPE,
  p_pfe_description          IN pci_features.pfe_description%TYPE,
  p_pfe_alt_description      IN pci_features.pfe_alt_description%TYPE,
  p_pfe_active_switch        IN pci_features.pfe_active_switch%TYPE,
  p_pfe_default_value_switch IN pci_features.pfe_default_value_switch%TYPE,
  p_pfe_modification_date    IN pci_features.pfe_modification_date%TYPE DEFAULT SYSDATE
);

END PFE_OPERATION_PACK;
/