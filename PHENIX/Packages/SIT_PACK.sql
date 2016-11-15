CREATE OR REPLACE PACKAGE phenix.SIT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  sites%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sit_code                       IN         sites.sit_code%TYPE,
  p_sit_rec                        OUT NOCOPY sites%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sit_code                       IN         sites.sit_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sit_code                       IN         sites.sit_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_sit_code                       IN         sites.sit_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sit_code                       IN         sites.sit_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sit_code                       IN         sites.sit_code%TYPE);


PROCEDURE INSERT_PROC(
  p_sit_code             IN         sites.sit_code%TYPE,
  p_sit_description      IN         sites.sit_description%TYPE,
  p_sit_address          IN         sites.sit_address%TYPE,
  p_sit_city             IN         sites.sit_city%TYPE,
  p_sit_prv_code         IN         sites.sit_prv_code%TYPE,
  p_sit_postal_code      IN         sites.sit_postal_code%TYPE,
  p_sit_alt_description  IN         sites.sit_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY sites%ROWTYPE);

END SIT_PACK;
/