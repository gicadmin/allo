CREATE OR REPLACE PACKAGE phenix.PUS_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pci_users%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pus_email                      IN         pci_users.pus_email%TYPE,
  p_pus_rec                        OUT NOCOPY pci_users%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pus_email                      IN         pci_users.pus_email%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pus_email                      IN         pci_users.pus_email%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pus_email                      IN         pci_users.pus_email%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pus_email                      IN         pci_users.pus_email%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pus_email                      IN         pci_users.pus_email%TYPE);

FUNCTION GET_FULL_FUNC(
  p_pus_id                         IN         pci_users.pus_id%TYPE,
  p_pus_rec                        OUT NOCOPY pci_users%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pus_id                         IN         pci_users.pus_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pus_id                         IN         pci_users.pus_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pus_id                         IN         pci_users.pus_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pus_id                         IN         pci_users.pus_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pus_id                         IN         pci_users.pus_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pus_email                   IN         pci_users.pus_email%TYPE,
  p_pus_active_switch           IN         pci_users.pus_active_switch%TYPE,
  p_pus_first_connection_switch IN         pci_users.pus_first_connection_switch%TYPE,
  p_pus_first_name              IN         pci_users.pus_first_name%TYPE                   DEFAULT NULL,
  p_pus_last_name               IN         pci_users.pus_last_name%TYPE                    DEFAULT NULL,
  p_pus_title                   IN         pci_users.pus_title%TYPE                        DEFAULT NULL,
  p_pus_password                IN         pci_users.pus_password%TYPE                     DEFAULT NULL,
  p_pus_last_connection_date    IN         pci_users.pus_last_connection_date%TYPE         DEFAULT NULL,
  p_pus_use_code                IN         pci_users.pus_use_code%TYPE                     DEFAULT NULL,
  p_pus_creation_date           IN         pci_users.pus_creation_date%TYPE                DEFAULT SYSDATE ,
  p_pus_modification_date       IN         pci_users.pus_modification_date%TYPE            DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pci_users%ROWTYPE)
RETURN NUMBER;

END PUS_PACK;
/