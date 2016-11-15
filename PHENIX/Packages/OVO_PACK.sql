CREATE OR REPLACE PACKAGE phenix.OVO_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  off_invoice_vol_reb_objectives%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ovo_id                         IN         off_invoice_vol_reb_objectives.ovo_id%TYPE,
  p_ovo_rec                        OUT NOCOPY off_invoice_vol_reb_objectives%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ovo_id                         IN         off_invoice_vol_reb_objectives.ovo_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_ovo_id                         IN         off_invoice_vol_reb_objectives.ovo_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ovo_id                         IN         off_invoice_vol_reb_objectives.ovo_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_ovo_ovg_code                   IN         off_invoice_vol_reb_objectives.ovo_ovg_code%TYPE,
  p_ovo_objective                  IN         off_invoice_vol_reb_objectives.ovo_objective%TYPE,
  p_ovo_rec                        OUT NOCOPY off_invoice_vol_reb_objectives%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ovo_ovg_code                   IN         off_invoice_vol_reb_objectives.ovo_ovg_code%TYPE,
  p_ovo_objective                  IN         off_invoice_vol_reb_objectives.ovo_objective%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_ovo_ovg_code                   IN         off_invoice_vol_reb_objectives.ovo_ovg_code%TYPE,
  p_ovo_objective                  IN         off_invoice_vol_reb_objectives.ovo_objective%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ovo_ovg_code                   IN         off_invoice_vol_reb_objectives.ovo_ovg_code%TYPE,
  p_ovo_objective                  IN         off_invoice_vol_reb_objectives.ovo_objective%TYPE);


FUNCTION INSERT_FUNC(
  p_ovo_ovg_code         IN         off_invoice_vol_reb_objectives.ovo_ovg_code%TYPE,
  p_ovo_objective        IN         off_invoice_vol_reb_objectives.ovo_objective%TYPE,
  p_ovo_rebate_percent   IN         off_invoice_vol_reb_objectives.ovo_rebate_percent%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY off_invoice_vol_reb_objectives%ROWTYPE)
RETURN NUMBER;

END OVO_PACK;
/