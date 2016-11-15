CREATE OR REPLACE PACKAGE phenix.DVT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  division_discounts%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_dvt_div_id                     IN         division_discounts.dvt_div_id%TYPE,
  p_dvt_dit_code                   IN         division_discounts.dvt_dit_code%TYPE,
  p_dvt_rec                        OUT NOCOPY division_discounts%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dvt_div_id                     IN         division_discounts.dvt_div_id%TYPE,
  p_dvt_dit_code                   IN         division_discounts.dvt_dit_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_dvt_div_id                     IN         division_discounts.dvt_div_id%TYPE,
  p_dvt_dit_code                   IN         division_discounts.dvt_dit_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_dvt_div_id                     IN         division_discounts.dvt_div_id%TYPE,
  p_dvt_dit_code                   IN         division_discounts.dvt_dit_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dvt_div_id                     IN         division_discounts.dvt_div_id%TYPE,
  p_dvt_dit_code                   IN         division_discounts.dvt_dit_code%TYPE);


PROCEDURE INSERT_PROC(
  p_dvt_dit_code               IN         division_discounts.dvt_dit_code%TYPE,
  p_dvt_ar_drop_discounts      IN         division_discounts.dvt_ar_drop_discounts%TYPE,
  p_dvt_ar_warehouse_discounts IN         division_discounts.dvt_ar_warehouse_discounts%TYPE,
  p_dvt_div_id                 IN         division_discounts.dvt_div_id%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY division_discounts%ROWTYPE);

END DVT_PACK;
/