CREATE OR REPLACE PACKAGE phenix.TTY_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  tender_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tty_code                       IN         tender_types.tty_code%TYPE,
  p_tty_rec                        OUT NOCOPY tender_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tty_code                       IN         tender_types.tty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tty_code                       IN         tender_types.tty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_tty_code                       IN         tender_types.tty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tty_code                       IN         tender_types.tty_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tty_code                       IN         tender_types.tty_code%TYPE);


PROCEDURE INSERT_PROC(
  p_tty_code                    IN         tender_types.tty_code%TYPE,
  p_tty_description             IN         tender_types.tty_description%TYPE,
  p_tty_differed_payment_switch IN         tender_types.tty_differed_payment_switch%TYPE,
  p_tty_alt_description         IN         tender_types.tty_alt_description%TYPE              DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY tender_types%ROWTYPE);

END TTY_PACK;
/