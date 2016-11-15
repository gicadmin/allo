CREATE OR REPLACE PACKAGE phenix.PUV_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pci_user_vendors%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_puv_pus_id                     IN         pci_user_vendors.puv_pus_id%TYPE,
  p_puv_ven_code                   IN         pci_user_vendors.puv_ven_code%TYPE,
  p_puv_rec                        OUT NOCOPY pci_user_vendors%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_puv_pus_id                     IN         pci_user_vendors.puv_pus_id%TYPE,
  p_puv_ven_code                   IN         pci_user_vendors.puv_ven_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_puv_pus_id                     IN         pci_user_vendors.puv_pus_id%TYPE,
  p_puv_ven_code                   IN         pci_user_vendors.puv_ven_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_puv_pus_id                     IN         pci_user_vendors.puv_pus_id%TYPE,
  p_puv_ven_code                   IN         pci_user_vendors.puv_ven_code%TYPE);


PROCEDURE INSERT_PROC(
  p_puv_pus_id           IN         pci_user_vendors.puv_pus_id%TYPE,
  p_puv_ven_code         IN         pci_user_vendors.puv_ven_code%TYPE,
  p_puv_pcro_id          IN         pci_user_vendors.puv_pcro_id%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY pci_user_vendors%ROWTYPE);

END PUV_PACK;
/