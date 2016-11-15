CREATE OR REPLACE PACKAGE phenix.DOC_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  documents%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_doc_code                       IN         documents.doc_code%TYPE,
  p_doc_rec                        OUT NOCOPY documents%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_doc_code                       IN         documents.doc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_doc_code                       IN         documents.doc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_doc_code                       IN         documents.doc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_doc_code                       IN         documents.doc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_doc_code                       IN         documents.doc_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_doc_code                       IN         documents.doc_code%TYPE);


FUNCTION INSERT_FUNC(
  p_doc_description       IN         documents.doc_description%TYPE,
  p_doc_file_name         IN         documents.doc_file_name%TYPE,
  p_doc_alt_description   IN         documents.doc_alt_description%TYPE        DEFAULT NULL,
  p_doc_start_date        IN         documents.doc_start_date%TYPE             DEFAULT NULL,
  p_doc_end_date          IN         documents.doc_end_date%TYPE               DEFAULT NULL,
  p_doc_file              IN         documents.doc_file%TYPE                   DEFAULT NULL,
  p_doc_creation_date     IN         documents.doc_creation_date%TYPE          DEFAULT SYSDATE ,
  p_doc_modification_date IN         documents.doc_modification_date%TYPE      DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY documents%ROWTYPE)
RETURN NUMBER;

END DOC_PACK;
/