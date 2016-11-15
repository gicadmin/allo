CREATE OR REPLACE PACKAGE phenix.EDI_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  edi_transactions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_edi_code                       IN         edi_transactions.edi_code%TYPE,
  p_edi_rec                        OUT NOCOPY edi_transactions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_edi_code                       IN         edi_transactions.edi_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_edi_code                       IN         edi_transactions.edi_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_edi_code                       IN         edi_transactions.edi_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_edi_code                       IN         edi_transactions.edi_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_edi_code                       IN         edi_transactions.edi_code%TYPE);


PROCEDURE INSERT_PROC(
  p_edi_code             IN         edi_transactions.edi_code%TYPE,
  p_edi_description      IN         edi_transactions.edi_description%TYPE,
  p_edi_alt_description  IN         edi_transactions.edi_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY edi_transactions%ROWTYPE);

END EDI_PACK;
/