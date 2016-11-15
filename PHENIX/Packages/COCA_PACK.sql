CREATE OR REPLACE PACKAGE phenix.COCA_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  contract_categories%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_coca_code                      IN         contract_categories.coca_code%TYPE,
  p_coca_rec                       OUT NOCOPY contract_categories%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_coca_code                      IN         contract_categories.coca_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_coca_code                      IN         contract_categories.coca_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_coca_code                      IN         contract_categories.coca_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_coca_code                      IN         contract_categories.coca_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_coca_code                      IN         contract_categories.coca_code%TYPE);


PROCEDURE INSERT_PROC(
  p_coca_code            IN         contract_categories.coca_code%TYPE,
  p_coca_description     IN         contract_categories.coca_description%TYPE,
  p_coca_commitment_type IN         contract_categories.coca_commitment_type%TYPE,
  p_coca_alt_description IN         contract_categories.coca_alt_description%TYPE      DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY contract_categories%ROWTYPE);

END COCA_PACK;
/