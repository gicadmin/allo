CREATE OR REPLACE PACKAGE phenix.PFE_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pci_features%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pfe_code                       IN         pci_features.pfe_code%TYPE,
  p_pfe_rec                        OUT NOCOPY pci_features%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pfe_code                       IN         pci_features.pfe_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pfe_code                       IN         pci_features.pfe_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pfe_code                       IN         pci_features.pfe_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pfe_code                       IN         pci_features.pfe_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pfe_code                       IN         pci_features.pfe_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pfe_code                       IN         pci_features.pfe_code%TYPE);


PROCEDURE INSERT_PROC(
  p_pfe_code                 IN         pci_features.pfe_code%TYPE,
  p_pfe_name                 IN         pci_features.pfe_name%TYPE,
  p_pfe_description          IN         pci_features.pfe_description%TYPE,
  p_pfe_active_switch        IN         pci_features.pfe_active_switch%TYPE,
  p_pfe_default_value_switch IN         pci_features.pfe_default_value_switch%TYPE,
  p_pfe_alt_name             IN         pci_features.pfe_alt_name%TYPE                  DEFAULT NULL,
  p_pfe_alt_description      IN         pci_features.pfe_alt_description%TYPE           DEFAULT NULL,
  p_pfe_creation_date        IN         pci_features.pfe_creation_date%TYPE             DEFAULT SYSDATE ,
  p_pfe_modification_date    IN         pci_features.pfe_modification_date%TYPE         DEFAULT SYSDATE );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY pci_features%ROWTYPE);

END PFE_PACK;
/