CREATE OR REPLACE PACKAGE phenix.QTY_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  quotation_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_qty_code                       IN         quotation_types.qty_code%TYPE,
  p_qty_rec                        OUT NOCOPY quotation_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_qty_code                       IN         quotation_types.qty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_qty_code                       IN         quotation_types.qty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_qty_code                       IN         quotation_types.qty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_qty_code                       IN         quotation_types.qty_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_qty_code                       IN         quotation_types.qty_code%TYPE);

PROCEDURE INSERT_PROC(
  p_qty_code               IN         quotation_types.qty_code%TYPE,
  p_qty_description        IN         quotation_types.qty_description%TYPE,
  p_qty_admin_method       IN         quotation_types.qty_admin_method%TYPE,
  p_qty_srt_code           IN         quotation_types.qty_srt_code%TYPE,
  p_qty_applicable_to_flag IN         quotation_types.qty_applicable_to_flag%TYPE,
  p_qty_whs_code           IN         quotation_types.qty_whs_code%TYPE,
  p_qty_alt_description    IN         quotation_types.qty_alt_description%TYPE         DEFAULT NULL,
  p_qty_pug_code           IN         quotation_types.qty_pug_code%TYPE                DEFAULT NULL,
  p_qty_xrg_code           IN         quotation_types.qty_xrg_code%TYPE                DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY quotation_types%ROWTYPE);

FUNCTION FIND_QTY_DESCRIPTION_FUNC(
	p_qty_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F')
RETURN VARCHAR2;

FUNCTION FIND_QTY_WHS_FUNC(
	p_qty_code IN NUMBER)
RETURN VARCHAR2  ;

END QTY_PACK;
/