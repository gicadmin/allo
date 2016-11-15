CREATE OR REPLACE PACKAGE phenix.TCT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  transport_credit_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tct_code                       IN         transport_credit_types.tct_code%TYPE,
  p_tct_rec                        OUT NOCOPY transport_credit_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tct_code                       IN         transport_credit_types.tct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tct_code                       IN         transport_credit_types.tct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_tct_code                       IN         transport_credit_types.tct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tct_code                       IN         transport_credit_types.tct_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tct_code                       IN         transport_credit_types.tct_code%TYPE);


PROCEDURE INSERT_PROC(
  p_tct_code              IN         transport_credit_types.tct_code%TYPE,
  p_tct_description       IN         transport_credit_types.tct_description%TYPE,
  p_tct_alt_description   IN         transport_credit_types.tct_alt_description%TYPE        DEFAULT NULL,
  p_tct_debit_only_switch IN         transport_credit_types.tct_debit_only_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY transport_credit_types%ROWTYPE);

END TCT_PACK;
/