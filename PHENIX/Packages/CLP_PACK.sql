CREATE OR REPLACE PACKAGE phenix.CLP_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  contacts_last_passwords%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_clp_id                         IN         contacts_last_passwords.clp_id%TYPE,
  p_clp_rec                        OUT NOCOPY contacts_last_passwords%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_clp_id                         IN         contacts_last_passwords.clp_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_clp_id                         IN         contacts_last_passwords.clp_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_clp_id                         IN         contacts_last_passwords.clp_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_clp_id                         IN         contacts_last_passwords.clp_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_clp_con_id           IN         contacts_last_passwords.clp_con_id%TYPE,
  p_clp_con_password     IN         contacts_last_passwords.clp_con_password%TYPE,
  p_clp_changed_date     IN         contacts_last_passwords.clp_changed_date%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY contacts_last_passwords%ROWTYPE)
RETURN NUMBER;

END CLP_PACK;
/