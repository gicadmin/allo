CREATE OR REPLACE PACKAGE phenix.PCDS_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pci_customer_display_sequences%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pcds_id                        IN         pci_customer_display_sequences.pcds_id%TYPE,
  p_pcds_rec                       OUT NOCOPY pci_customer_display_sequences%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pcds_id                        IN         pci_customer_display_sequences.pcds_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pcds_id                        IN         pci_customer_display_sequences.pcds_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pcds_id                        IN         pci_customer_display_sequences.pcds_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pcds_id                        IN         pci_customer_display_sequences.pcds_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_pcds_pcdl_id                   IN         pci_customer_display_sequences.pcds_pcdl_id%TYPE,
  p_pcds_prf_prd_code              IN         pci_customer_display_sequences.pcds_prf_prd_code%TYPE,
  p_pcds_prf_fmt_code              IN         pci_customer_display_sequences.pcds_prf_fmt_code%TYPE,
  p_pcds_rec                       OUT NOCOPY pci_customer_display_sequences%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pcds_pcdl_id                   IN         pci_customer_display_sequences.pcds_pcdl_id%TYPE,
  p_pcds_prf_prd_code              IN         pci_customer_display_sequences.pcds_prf_prd_code%TYPE,
  p_pcds_prf_fmt_code              IN         pci_customer_display_sequences.pcds_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pcds_pcdl_id                   IN         pci_customer_display_sequences.pcds_pcdl_id%TYPE,
  p_pcds_prf_prd_code              IN         pci_customer_display_sequences.pcds_prf_prd_code%TYPE,
  p_pcds_prf_fmt_code              IN         pci_customer_display_sequences.pcds_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pcds_pcdl_id                   IN         pci_customer_display_sequences.pcds_pcdl_id%TYPE,
  p_pcds_prf_prd_code              IN         pci_customer_display_sequences.pcds_prf_prd_code%TYPE,
  p_pcds_prf_fmt_code              IN         pci_customer_display_sequences.pcds_prf_fmt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pcds_pcdl_id                   IN         pci_customer_display_sequences.pcds_pcdl_id%TYPE,
  p_pcds_prf_prd_code              IN         pci_customer_display_sequences.pcds_prf_prd_code%TYPE,
  p_pcds_prf_fmt_code              IN         pci_customer_display_sequences.pcds_prf_fmt_code%TYPE);


FUNCTION INSERT_FUNC(
  p_pcds_pcdl_id         IN         pci_customer_display_sequences.pcds_pcdl_id%TYPE,
  p_pcds_prf_prd_code    IN         pci_customer_display_sequences.pcds_prf_prd_code%TYPE,
  p_pcds_prf_fmt_code    IN         pci_customer_display_sequences.pcds_prf_fmt_code%TYPE,
  p_pcds_sequence        IN         pci_customer_display_sequences.pcds_sequence%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pci_customer_display_sequences%ROWTYPE)
RETURN NUMBER;

END PCDS_PACK;
/