CREATE OR REPLACE PACKAGE phenix.APVEN_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  apven%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vendorid                       IN         apven.vendorid%TYPE,
  p_audtorg                        IN         apven.audtorg%TYPE,
  p_apven_rec                      OUT NOCOPY apven%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vendorid                       IN         apven.vendorid%TYPE,
  p_audtorg                        IN         apven.audtorg%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vendorid                       IN         apven.vendorid%TYPE,
  p_audtorg                        IN         apven.audtorg%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vendorid                       IN         apven.vendorid%TYPE,
  p_audtorg                        IN         apven.audtorg%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vendorid                       IN         apven.vendorid%TYPE,
  p_audtorg                        IN         apven.audtorg%TYPE);


PROCEDURE INSERT_PROC(
  p_vendorid             IN         apven.vendorid%TYPE,
  p_audtorg              IN         apven.audtorg%TYPE,
  p_swactv               IN         apven.swactv%TYPE,
  p_dateinac             IN         apven.dateinac%TYPE,
  p_vendname             IN         apven.vendname%TYPE,
  p_textstre1            IN         apven.textstre1%TYPE,
  p_textstre2            IN         apven.textstre2%TYPE,
  p_textstre3            IN         apven.textstre3%TYPE,
  p_textstre4            IN         apven.textstre4%TYPE,
  p_namecity             IN         apven.namecity%TYPE,
  p_codestte             IN         apven.codestte%TYPE,
  p_codepstl             IN         apven.codepstl%TYPE,
  p_textphon1            IN         apven.textphon1%TYPE,
  p_amtcrlimt            IN         apven.amtcrlimt%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY apven%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vendorid                       IN         apven.vendorid%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

END APVEN_PACK;
/