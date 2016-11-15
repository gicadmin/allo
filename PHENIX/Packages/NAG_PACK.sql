CREATE OR REPLACE PACKAGE phenix.NAG_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  national_account_groups%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_nag_nac_code                   IN         national_account_groups.nag_nac_code%TYPE,
  p_nag_code                       IN         national_account_groups.nag_code%TYPE,
  p_nag_rec                        OUT NOCOPY national_account_groups%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_nag_nac_code                   IN         national_account_groups.nag_nac_code%TYPE,
  p_nag_code                       IN         national_account_groups.nag_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_nag_nac_code                   IN         national_account_groups.nag_nac_code%TYPE,
  p_nag_code                       IN         national_account_groups.nag_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_nag_nac_code                   IN         national_account_groups.nag_nac_code%TYPE,
  p_nag_code                       IN         national_account_groups.nag_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_nag_nac_code                   IN         national_account_groups.nag_nac_code%TYPE,
  p_nag_code                       IN         national_account_groups.nag_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_nag_nac_code                   IN         national_account_groups.nag_nac_code%TYPE,
  p_nag_code                       IN         national_account_groups.nag_code%TYPE);


PROCEDURE INSERT_PROC(
  p_nag_nac_code           IN         national_account_groups.nag_nac_code%TYPE,
  p_nag_code               IN         national_account_groups.nag_code%TYPE,
  p_nag_description        IN         national_account_groups.nag_description%TYPE,
  p_nag_alt_description    IN         national_account_groups.nag_alt_description%TYPE         DEFAULT NULL,
  p_nag_rcm_code           IN         national_account_groups.nag_rcm_code%TYPE                DEFAULT NULL,
  p_nag_synchronization_id IN         national_account_groups.nag_synchronization_id%TYPE      DEFAULT NULL,
  p_nag_unique_index       IN         national_account_groups.nag_unique_index%TYPE            DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY national_account_groups%ROWTYPE);

END NAG_PACK;
/