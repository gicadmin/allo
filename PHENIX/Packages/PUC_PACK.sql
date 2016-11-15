CREATE OR REPLACE PACKAGE phenix.PUC_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pci_user_customers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_puc_pus_id                     IN         pci_user_customers.puc_pus_id%TYPE,
  p_puc_cus_code                   IN         pci_user_customers.puc_cus_code%TYPE,
  p_puc_rec                        OUT NOCOPY pci_user_customers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_puc_pus_id                     IN         pci_user_customers.puc_pus_id%TYPE,
  p_puc_cus_code                   IN         pci_user_customers.puc_cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_puc_pus_id                     IN         pci_user_customers.puc_pus_id%TYPE,
  p_puc_cus_code                   IN         pci_user_customers.puc_cus_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_puc_pus_id                     IN         pci_user_customers.puc_pus_id%TYPE,
  p_puc_cus_code                   IN         pci_user_customers.puc_cus_code%TYPE);


PROCEDURE INSERT_PROC(
  p_puc_pus_id           IN         pci_user_customers.puc_pus_id%TYPE,
  p_puc_cus_code         IN         pci_user_customers.puc_cus_code%TYPE,
  p_puc_pcro_id          IN         pci_user_customers.puc_pcro_id%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY pci_user_customers%ROWTYPE);

END PUC_PACK;
/