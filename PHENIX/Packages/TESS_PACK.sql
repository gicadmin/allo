CREATE OR REPLACE PACKAGE phenix.TESS_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temp_edi_statement_summaries%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tess_id                        IN         temp_edi_statement_summaries.tess_id%TYPE,
  p_tess_rec                       OUT NOCOPY temp_edi_statement_summaries%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tess_id                        IN         temp_edi_statement_summaries.tess_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tess_id                        IN         temp_edi_statement_summaries.tess_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tess_id                        IN         temp_edi_statement_summaries.tess_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tess_id                        IN         temp_edi_statement_summaries.tess_id%TYPE);


FUNCTION INSERT_FUNC(
  p_tess_segment_type    IN         temp_edi_statement_summaries.tess_segment_type%TYPE,
  p_tess_tesh_id         IN         temp_edi_statement_summaries.tess_tesh_id%TYPE              DEFAULT NULL,
  p_tess_statement_total IN         temp_edi_statement_summaries.tess_statement_total%TYPE      DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY temp_edi_statement_summaries%ROWTYPE)
RETURN NUMBER;

END TESS_PACK;
/