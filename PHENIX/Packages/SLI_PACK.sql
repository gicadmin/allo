CREATE OR REPLACE PACKAGE phenix.SLI_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  system_licenses%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sli_code                       IN         system_licenses.sli_code%TYPE,
  p_sli_rec                        OUT NOCOPY system_licenses%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_sli_code                       IN         system_licenses.sli_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sli_code                       IN         system_licenses.sli_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sli_code                       IN         system_licenses.sli_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sli_code                       IN         system_licenses.sli_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sli_code                       IN         system_licenses.sli_code%TYPE);


PROCEDURE INSERT_PROC(
  p_sli_code                 IN         system_licenses.sli_code%TYPE,
  p_sli_computer_information IN         system_licenses.sli_computer_information%TYPE,
  p_sli_expiration_date      IN         system_licenses.sli_expiration_date%TYPE,
  p_sli_number_of_users      IN         system_licenses.sli_number_of_users%TYPE,
  p_sli_registration_key     IN         system_licenses.sli_registration_key%TYPE,
  p_sli_validation_code      IN         system_licenses.sli_validation_code%TYPE,
  p_sli_number_of_users_sge  IN         system_licenses.sli_number_of_users_sge%TYPE       DEFAULT 20 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY system_licenses%ROWTYPE);

END SLI_PACK;
/