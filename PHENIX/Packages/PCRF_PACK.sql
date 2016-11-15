CREATE OR REPLACE PACKAGE phenix.PCRF_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pci_role_features%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pcrf_pfe_code                  IN         pci_role_features.pcrf_pfe_code%TYPE,
  p_pcrf_pcro_id                   IN         pci_role_features.pcrf_pcro_id%TYPE,
  p_pcrf_rec                       OUT NOCOPY pci_role_features%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pcrf_pfe_code                  IN         pci_role_features.pcrf_pfe_code%TYPE,
  p_pcrf_pcro_id                   IN         pci_role_features.pcrf_pcro_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_pcrf_pfe_code                  IN         pci_role_features.pcrf_pfe_code%TYPE,
  p_pcrf_pcro_id                   IN         pci_role_features.pcrf_pcro_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pcrf_pfe_code                  IN         pci_role_features.pcrf_pfe_code%TYPE,
  p_pcrf_pcro_id                   IN         pci_role_features.pcrf_pcro_id%TYPE);


PROCEDURE INSERT_PROC(
  p_pcrf_pfe_code        IN         pci_role_features.pcrf_pfe_code%TYPE,
  p_pcrf_pcro_id         IN         pci_role_features.pcrf_pcro_id%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY pci_role_features%ROWTYPE);

END PCRF_PACK;
/