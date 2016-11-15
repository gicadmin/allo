CREATE OR REPLACE PACKAGE phenix.TKC_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  truck_cleanliness%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tkc_code                       IN         truck_cleanliness.tkc_code%TYPE,
  p_tkc_rec                        OUT NOCOPY truck_cleanliness%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tkc_code                       IN         truck_cleanliness.tkc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tkc_code                       IN         truck_cleanliness.tkc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_tkc_code                       IN         truck_cleanliness.tkc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tkc_code                       IN         truck_cleanliness.tkc_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tkc_code                       IN         truck_cleanliness.tkc_code%TYPE);


PROCEDURE INSERT_PROC(
  p_tkc_code             IN         truck_cleanliness.tkc_code%TYPE,
  p_tkc_description      IN         truck_cleanliness.tkc_description%TYPE,
  p_tkc_alt_description  IN         truck_cleanliness.tkc_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY truck_cleanliness%ROWTYPE);

END TKC_PACK;
/