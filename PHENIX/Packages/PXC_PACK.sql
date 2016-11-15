CREATE OR REPLACE PACKAGE phenix.PXC_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  product_xref_codes%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pxc_id                         IN         product_xref_codes.pxc_id%TYPE,
  p_pxc_rec                        OUT NOCOPY product_xref_codes%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pxc_id                         IN         product_xref_codes.pxc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pxc_id                         IN         product_xref_codes.pxc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pxc_id                         IN         product_xref_codes.pxc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pxc_id                         IN         product_xref_codes.pxc_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pxc_id                         IN         product_xref_codes.pxc_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_pxc_xrg_code                   IN         product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_prd_code                   IN         product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code                   IN         product_xref_codes.pxc_fmt_code%TYPE,
  p_pxc_rec                        OUT NOCOPY product_xref_codes%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pxc_xrg_code                   IN         product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_prd_code                   IN         product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code                   IN         product_xref_codes.pxc_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pxc_xrg_code                   IN         product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_prd_code                   IN         product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code                   IN         product_xref_codes.pxc_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pxc_xrg_code                   IN         product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_prd_code                   IN         product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code                   IN         product_xref_codes.pxc_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pxc_xrg_code                   IN         product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_prd_code                   IN         product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code                   IN         product_xref_codes.pxc_fmt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pxc_xrg_code                   IN         product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_prd_code                   IN         product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code                   IN         product_xref_codes.pxc_fmt_code%TYPE);

FUNCTION GET_FULL_FUNC(
  p_pxc_xrg_code                   IN         product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_code                       IN         product_xref_codes.pxc_code%TYPE,
  p_pxc_rec                        OUT NOCOPY product_xref_codes%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pxc_xrg_code                   IN         product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_code                       IN         product_xref_codes.pxc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pxc_xrg_code                   IN         product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_code                       IN         product_xref_codes.pxc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pxc_xrg_code                   IN         product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_code                       IN         product_xref_codes.pxc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pxc_xrg_code                   IN         product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_code                       IN         product_xref_codes.pxc_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pxc_xrg_code                   IN         product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_code                       IN         product_xref_codes.pxc_code%TYPE);


FUNCTION INSERT_FUNC(
  p_pxc_code             IN         product_xref_codes.pxc_code%TYPE,
  p_pxc_prd_code         IN         product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_xrg_code         IN         product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_description      IN         product_xref_codes.pxc_description%TYPE           DEFAULT NULL,
  p_pxc_alt_description  IN         product_xref_codes.pxc_alt_description%TYPE       DEFAULT NULL,
  p_pxc_fmt_code         IN         product_xref_codes.pxc_fmt_code%TYPE              DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY product_xref_codes%ROWTYPE)
RETURN NUMBER;

END PXC_PACK;
/