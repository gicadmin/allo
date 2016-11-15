CREATE OR REPLACE PACKAGE phenix.OVG_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  off_invoice_vol_rebate_grids%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ovg_code                       IN         off_invoice_vol_rebate_grids.ovg_code%TYPE,
  p_ovg_rec                        OUT NOCOPY off_invoice_vol_rebate_grids%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ovg_code                       IN         off_invoice_vol_rebate_grids.ovg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ovg_code                       IN         off_invoice_vol_rebate_grids.ovg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_ovg_code                       IN         off_invoice_vol_rebate_grids.ovg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ovg_code                       IN         off_invoice_vol_rebate_grids.ovg_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ovg_code                       IN         off_invoice_vol_rebate_grids.ovg_code%TYPE);


PROCEDURE INSERT_PROC(
  p_ovg_code             IN         off_invoice_vol_rebate_grids.ovg_code%TYPE,
  p_ovg_description      IN         off_invoice_vol_rebate_grids.ovg_description%TYPE,
  p_ovg_alt_description  IN         off_invoice_vol_rebate_grids.ovg_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY off_invoice_vol_rebate_grids%ROWTYPE);

END OVG_PACK;
/