CREATE OR REPLACE PACKAGE phenix.CNS_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  consignments%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cns_code                       IN         consignments.cns_code%TYPE,
  p_cns_rec                        OUT NOCOPY consignments%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cns_code                       IN         consignments.cns_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cns_code                       IN         consignments.cns_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_cns_code                       IN         consignments.cns_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cns_code                       IN         consignments.cns_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cns_code                       IN         consignments.cns_code%TYPE);


PROCEDURE INSERT_PROC(
  p_cns_code             IN         consignments.cns_code%TYPE,
  p_cns_description      IN         consignments.cns_description%TYPE,
  p_cns_print_switch     IN         consignments.cns_print_switch%TYPE,
  p_cns_alt_description  IN         consignments.cns_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY consignments%ROWTYPE);

END CNS_PACK;
/