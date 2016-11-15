CREATE OR REPLACE PACKAGE phenix.FCG_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  food_certification_groups%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_fcg_code                       IN         food_certification_groups.fcg_code%TYPE,
  p_fcg_rec                        OUT NOCOPY food_certification_groups%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_fcg_code                       IN         food_certification_groups.fcg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_fcg_code                       IN         food_certification_groups.fcg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_fcg_code                       IN         food_certification_groups.fcg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_fcg_code                       IN         food_certification_groups.fcg_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_fcg_code                       IN         food_certification_groups.fcg_code%TYPE);


PROCEDURE INSERT_PROC(
  p_fcg_code             IN         food_certification_groups.fcg_code%TYPE,
  p_fcg_description      IN         food_certification_groups.fcg_description%TYPE,
  p_fcg_alt_description  IN         food_certification_groups.fcg_alt_description%TYPE,
  p_fcg_broker_switch    IN         food_certification_groups.fcg_broker_switch%TYPE         DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY food_certification_groups%ROWTYPE);

END FCG_PACK;
/