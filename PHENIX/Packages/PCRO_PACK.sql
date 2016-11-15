CREATE OR REPLACE PACKAGE phenix.PCRO_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pci_roles%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pcro_id                        IN         pci_roles.pcro_id%TYPE,
  p_pcro_rec                       OUT NOCOPY pci_roles%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pcro_id                        IN         pci_roles.pcro_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pcro_id                        IN         pci_roles.pcro_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pcro_id                        IN         pci_roles.pcro_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pcro_id                        IN         pci_roles.pcro_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pcro_id                        IN         pci_roles.pcro_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pcro_id                        IN         pci_roles.pcro_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pcro_name               IN         pci_roles.pcro_name%TYPE,
  p_pcro_active_switch      IN         pci_roles.pcro_active_switch%TYPE,
  p_pcro_master_role_switch IN         pci_roles.pcro_master_role_switch%TYPE,
  p_pcro_pcro_id            IN         pci_roles.pcro_pcro_id%TYPE                 DEFAULT NULL,
  p_pcro_alt_name           IN         pci_roles.pcro_alt_name%TYPE                DEFAULT NULL,
  p_pcro_owned_by_cus_code  IN         pci_roles.pcro_owned_by_cus_code%TYPE       DEFAULT NULL,
  p_pcro_creation_date      IN         pci_roles.pcro_creation_date%TYPE           DEFAULT SYSDATE ,
  p_pcro_modification_date  IN         pci_roles.pcro_modification_date%TYPE       DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pci_roles%ROWTYPE)
RETURN NUMBER;

END PCRO_PACK;
/