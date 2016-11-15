CREATE OR REPLACE PACKAGE phenix.PCDL_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pci_customer_display_lists%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pcdl_id                        IN         pci_customer_display_lists.pcdl_id%TYPE,
  p_pcdl_rec                       OUT NOCOPY pci_customer_display_lists%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pcdl_id                        IN         pci_customer_display_lists.pcdl_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pcdl_id                        IN         pci_customer_display_lists.pcdl_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pcdl_id                        IN         pci_customer_display_lists.pcdl_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pcdl_id                        IN         pci_customer_display_lists.pcdl_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pcdl_id                        IN         pci_customer_display_lists.pcdl_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pcdl_description     IN         pci_customer_display_lists.pcdl_description%TYPE,
  p_pcdl_cus_code        IN         pci_customer_display_lists.pcdl_cus_code%TYPE,
  p_pcdl_alt_description IN         pci_customer_display_lists.pcdl_alt_description%TYPE      DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pci_customer_display_lists%ROWTYPE)
RETURN NUMBER;

END PCDL_PACK;
/