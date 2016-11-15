CREATE OR REPLACE PACKAGE phenix.FFP_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  flatfile_purge_parameters%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ffp_directory                  IN         flatfile_purge_parameters.ffp_directory%TYPE,
  p_ffp_rec                        OUT NOCOPY flatfile_purge_parameters%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ffp_directory                  IN         flatfile_purge_parameters.ffp_directory%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ffp_directory                  IN         flatfile_purge_parameters.ffp_directory%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ffp_directory                  IN         flatfile_purge_parameters.ffp_directory%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ffp_directory                  IN         flatfile_purge_parameters.ffp_directory%TYPE);


PROCEDURE INSERT_PROC(
  p_ffp_directory        IN         flatfile_purge_parameters.ffp_directory%TYPE,
  p_ffp_purge_months     IN         flatfile_purge_parameters.ffp_purge_months%TYPE          DEFAULT 12 ,
  p_ffp_delete_months    IN         flatfile_purge_parameters.ffp_delete_months%TYPE         DEFAULT 1 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY flatfile_purge_parameters%ROWTYPE);

END FFP_PACK;
/