CREATE OR REPLACE PACKAGE phenix.DLD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  display_list_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_dld_dlh_id                     IN         display_list_details.dld_dlh_id%TYPE,
  p_dld_prf_prd_code               IN         display_list_details.dld_prf_prd_code%TYPE,
  p_dld_prf_fmt_code               IN         display_list_details.dld_prf_fmt_code%TYPE,
  p_dld_rec                        OUT NOCOPY display_list_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_dld_dlh_id                     IN         display_list_details.dld_dlh_id%TYPE,
  p_dld_prf_prd_code               IN         display_list_details.dld_prf_prd_code%TYPE,
  p_dld_prf_fmt_code               IN         display_list_details.dld_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dld_dlh_id                     IN         display_list_details.dld_dlh_id%TYPE,
  p_dld_prf_prd_code               IN         display_list_details.dld_prf_prd_code%TYPE,
  p_dld_prf_fmt_code               IN         display_list_details.dld_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_dld_dlh_id                     IN         display_list_details.dld_dlh_id%TYPE,
  p_dld_prf_prd_code               IN         display_list_details.dld_prf_prd_code%TYPE,
  p_dld_prf_fmt_code               IN         display_list_details.dld_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_dld_dlh_id                     IN         display_list_details.dld_dlh_id%TYPE,
  p_dld_prf_prd_code               IN         display_list_details.dld_prf_prd_code%TYPE,
  p_dld_prf_fmt_code               IN         display_list_details.dld_prf_fmt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dld_dlh_id                     IN         display_list_details.dld_dlh_id%TYPE,
  p_dld_prf_prd_code               IN         display_list_details.dld_prf_prd_code%TYPE,
  p_dld_prf_fmt_code               IN         display_list_details.dld_prf_fmt_code%TYPE);

FUNCTION GET_FULL_FUNC(
  p_dld_id                         IN         display_list_details.dld_id%TYPE,
  p_dld_rec                        OUT NOCOPY display_list_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_dld_id                         IN         display_list_details.dld_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dld_id                         IN         display_list_details.dld_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_dld_id                         IN         display_list_details.dld_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_dld_id                         IN         display_list_details.dld_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dld_id                         IN         display_list_details.dld_id%TYPE);


FUNCTION INSERT_FUNC(
  p_dld_dlh_id            IN         display_list_details.dld_dlh_id%TYPE,
  p_dld_prf_prd_code      IN         display_list_details.dld_prf_prd_code%TYPE,
  p_dld_prf_fmt_code      IN         display_list_details.dld_prf_fmt_code%TYPE,
  p_dld_sequence          IN         display_list_details.dld_sequence%TYPE,
  p_dld_message           IN         display_list_details.dld_message%TYPE,
  p_dld_creation_date     IN         display_list_details.dld_creation_date%TYPE          DEFAULT SYSDATE ,
  p_dld_modification_date IN         display_list_details.dld_modification_date%TYPE      DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY display_list_details%ROWTYPE)
RETURN NUMBER;

END DLD_PACK;
/