CREATE OR REPLACE PACKAGE phenix.PUS_OPERATION_PACK AS

PROCEDURE UPDATE_PROC(
  p_pus_id                 IN pci_users.pus_id%TYPE,
  p_pus_use_code           IN pci_users.pus_use_code%TYPE,
  p_pus_first_name         IN pci_users.pus_first_name%TYPE,
  p_pus_last_name          IN pci_users.pus_last_name%TYPE,
  p_pus_active_switch      IN pci_users.pus_active_switch%TYPE,
  p_pus_title              IN pci_users.pus_title%TYPE,
  p_pus_email              IN pci_users.pus_email%TYPE,
  p_pus_password           IN pci_users.pus_password%TYPE,
  p_pus_modification_date  IN pci_users.pus_modification_date%TYPE DEFAULT SYSDATE
);

PROCEDURE ACTIVE_PROC(
  p_pus_id            IN pci_users.pus_id%TYPE,
  p_pus_active_switch IN pci_users.pus_active_switch%TYPE
);

PROCEDURE SET_LAST_CONNECTION_PROC(
  p_pus_id                   IN pci_users.pus_id%TYPE,
  p_pus_last_connection_date IN pci_users.pus_last_connection_date%TYPE
);

PROCEDURE SET_PASSWORD_PROC(
  p_pus_id                      IN pci_users.pus_id%TYPE,
  p_pus_password                IN pci_users.pus_password%TYPE,
  p_pus_first_connection_switch IN pci_users.pus_first_connection_switch%TYPE
);

END PUS_OPERATION_PACK;
/