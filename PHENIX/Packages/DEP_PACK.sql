CREATE OR REPLACE PACKAGE phenix.DEP_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  deposits%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_dep_id                         IN         deposits.dep_id%TYPE,
  p_dep_rec                        OUT NOCOPY deposits%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dep_id                         IN         deposits.dep_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_dep_id                         IN         deposits.dep_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dep_id                         IN         deposits.dep_id%TYPE);


FUNCTION INSERT_FUNC(
  p_dep_srth_id          IN         deposits.dep_srth_id%TYPE,
  p_dep_nb_of_100        IN         deposits.dep_nb_of_100%TYPE             DEFAULT NULL,
  p_dep_nb_of_50         IN         deposits.dep_nb_of_50%TYPE              DEFAULT NULL,
  p_dep_nb_of_20         IN         deposits.dep_nb_of_20%TYPE              DEFAULT NULL,
  p_dep_nb_of_10         IN         deposits.dep_nb_of_10%TYPE              DEFAULT NULL,
  p_dep_nb_of_5          IN         deposits.dep_nb_of_5%TYPE               DEFAULT NULL,
  p_dep_nb_of_2          IN         deposits.dep_nb_of_2%TYPE               DEFAULT NULL,
  p_dep_nb_of_1          IN         deposits.dep_nb_of_1%TYPE               DEFAULT NULL,
  p_dep_nb_of_025        IN         deposits.dep_nb_of_025%TYPE             DEFAULT NULL,
  p_dep_nb_of_010        IN         deposits.dep_nb_of_010%TYPE             DEFAULT NULL,
  p_dep_nb_of_005        IN         deposits.dep_nb_of_005%TYPE             DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY deposits%ROWTYPE)
RETURN NUMBER;

END DEP_PACK;
/