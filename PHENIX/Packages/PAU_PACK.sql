CREATE OR REPLACE PACKAGE phenix.PAU_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pci_audits%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pau_id                         IN         pci_audits.pau_id%TYPE,
  p_pau_rec                        OUT NOCOPY pci_audits%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pau_id                         IN         pci_audits.pau_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pau_id                         IN         pci_audits.pau_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pau_id                         IN         pci_audits.pau_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pau_id                         IN         pci_audits.pau_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pau_id                         IN         pci_audits.pau_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pau_pus_id           IN         pci_audits.pau_pus_id%TYPE,
  p_pau_ip               IN         pci_audits.pau_ip%TYPE,
  p_pau_operation        IN         pci_audits.pau_operation%TYPE,
  p_pau_messages         IN         pci_audits.pau_messages%TYPE,
  p_pau_creation_date    IN         pci_audits.pau_creation_date%TYPE         DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pci_audits%ROWTYPE)
RETURN NUMBER;

END PAU_PACK;
/