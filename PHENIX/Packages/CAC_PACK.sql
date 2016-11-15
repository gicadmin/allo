CREATE OR REPLACE PACKAGE phenix.CAC_PACK IS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_adjustment_consigns%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cac_cad_id                     IN         customer_adjustment_consigns.cac_cad_id%TYPE,
  p_cac_sequence                   IN         customer_adjustment_consigns.cac_sequence%TYPE,
  p_cac_rec                        OUT NOCOPY customer_adjustment_consigns%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cac_cad_id                     IN         customer_adjustment_consigns.cac_cad_id%TYPE,
  p_cac_sequence                   IN         customer_adjustment_consigns.cac_sequence%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cac_cad_id                     IN         customer_adjustment_consigns.cac_cad_id%TYPE,
  p_cac_sequence                   IN         customer_adjustment_consigns.cac_sequence%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cac_cad_id                     IN         customer_adjustment_consigns.cac_cad_id%TYPE,
  p_cac_sequence                   IN         customer_adjustment_consigns.cac_sequence%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cac_cad_id                     IN         customer_adjustment_consigns.cac_cad_id%TYPE,
  p_cac_sequence                   IN         customer_adjustment_consigns.cac_sequence%TYPE);


PROCEDURE INSERT_PROC(
  p_cac_cad_id              IN         customer_adjustment_consigns.cac_cad_id%TYPE,
  p_cac_sequence            IN         customer_adjustment_consigns.cac_sequence%TYPE,
  p_cac_prf_prd_code        IN         customer_adjustment_consigns.cac_prf_prd_code%TYPE,
  p_cac_prf_fmt_code        IN         customer_adjustment_consigns.cac_prf_fmt_code%TYPE,
  p_cac_cost_price          IN         customer_adjustment_consigns.cac_cost_price%TYPE,
  p_cac_quantity            IN         customer_adjustment_consigns.cac_quantity%TYPE,
  p_cac_selling_price       IN         customer_adjustment_consigns.cac_selling_price%TYPE,
  p_cac_federal_tax_rate    IN         customer_adjustment_consigns.cac_federal_tax_rate%TYPE         DEFAULT 0 ,
  p_cac_provincial_tax_rate IN         customer_adjustment_consigns.cac_provincial_tax_rate%TYPE      DEFAULT 0 ,
  p_cac_invoiced_ext_price  IN         customer_adjustment_consigns.cac_invoiced_ext_price%TYPE       DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_adjustment_consigns%ROWTYPE);

END CAC_PACK;
/