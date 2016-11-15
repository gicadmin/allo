CREATE OR REPLACE PACKAGE phenix.DLH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  display_list_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_dlh_id                         IN         display_list_headers.dlh_id%TYPE,
  p_dlh_rec                        OUT NOCOPY display_list_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_dlh_id                         IN         display_list_headers.dlh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dlh_id                         IN         display_list_headers.dlh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_dlh_id                         IN         display_list_headers.dlh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_dlh_id                         IN         display_list_headers.dlh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_dlh_id                         IN         display_list_headers.dlh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dlh_id                         IN         display_list_headers.dlh_id%TYPE);


FUNCTION INSERT_FUNC(
  p_dlh_description       IN         display_list_headers.dlh_description%TYPE,
  p_dlh_alt_description   IN         display_list_headers.dlh_alt_description%TYPE        DEFAULT NULL,
  p_dlh_cus_code          IN         display_list_headers.dlh_cus_code%TYPE               DEFAULT NULL,
  p_dlh_ven_code          IN         display_list_headers.dlh_ven_code%TYPE               DEFAULT NULL,
  p_dlh_upro_id           IN         display_list_headers.dlh_upro_id%TYPE                DEFAULT NULL,
  p_dlh_creation_date     IN         display_list_headers.dlh_creation_date%TYPE          DEFAULT SYSDATE ,
  p_dlh_modification_date IN         display_list_headers.dlh_modification_date%TYPE      DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY display_list_headers%ROWTYPE)
RETURN NUMBER;

END DLH_PACK;
/