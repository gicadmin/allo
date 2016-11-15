CREATE OR REPLACE PACKAGE phenix.DSD_PACK IS

FUNCTION GET_DSD_ID_FUNC RETURN NUMBER;

PROCEDURE INSERT_DSD_PROC(
  p_dsd_id                       IN NUMBER,
  p_dsd_dit_code                 IN NUMBER,
  p_dsd_level                    IN VARCHAR2,
  p_dsd_ven_code                 IN NUMBER,
  p_dsd_invoiced_ext_price       IN NUMBER,
  p_dsd_cds_reference_number     IN VARCHAR2 DEFAULT NULL,
  p_dsd_cds_cus_code             IN NUMBER   DEFAULT NULL,
  p_dsd_cds_vds_id               IN NUMBER   DEFAULT NULL,
  p_dsd_cdd_cds_reference_number IN VARCHAR2 DEFAULT NULL,
  p_dsd_cdd_line_number          IN NUMBER   DEFAULT NULL,
  p_dsd_cdd_cds_cus_code         IN NUMBER   DEFAULT NULL,
  p_dsd_cdd_cds_vds_id           IN NUMBER   DEFAULT NULL,
  p_dsd_amount                   IN NUMBER   DEFAULT NULL,
  p_dsd_percent                  IN NUMBER   DEFAULT NULL,
  p_dsd_inh_id                   IN NUMBER   DEFAULT NULL,
  p_dsd_final_amount             IN NUMBER   DEFAULT NULL,
  p_dsd_federal_tax_rate         IN NUMBER   DEFAULT 0,
  p_dsd_provincial_tax_rate      IN NUMBER   DEFAULT 0,
  p_dsd_whs_code                 IN VARCHAR2 DEFAULT NULL,
  p_dsd_skip_invoicing_switch    IN NUMBER   DEFAULT 0
);


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  drop_statement_discounts%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_dsd_id                         IN         drop_statement_discounts.dsd_id%TYPE,
  p_dsd_rec                        OUT NOCOPY drop_statement_discounts%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dsd_id                         IN         drop_statement_discounts.dsd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_dsd_id                         IN         drop_statement_discounts.dsd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_dsd_id                         IN         drop_statement_discounts.dsd_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dsd_id                         IN         drop_statement_discounts.dsd_id%TYPE);


FUNCTION INSERT_FUNC(
  p_dsd_dit_code                 IN         drop_statement_discounts.dsd_dit_code%TYPE,
  p_dsd_level                    IN         drop_statement_discounts.dsd_level%TYPE,
  p_dsd_ven_code                 IN         drop_statement_discounts.dsd_ven_code%TYPE,
  p_dsd_whs_code                 IN         drop_statement_discounts.dsd_whs_code%TYPE,
  p_dsd_cds_reference_number     IN         drop_statement_discounts.dsd_cds_reference_number%TYPE          DEFAULT NULL,
  p_dsd_cds_cus_code             IN         drop_statement_discounts.dsd_cds_cus_code%TYPE                  DEFAULT NULL,
  p_dsd_cds_vds_id               IN         drop_statement_discounts.dsd_cds_vds_id%TYPE                    DEFAULT NULL,
  p_dsd_cdd_cds_reference_number IN         drop_statement_discounts.dsd_cdd_cds_reference_number%TYPE      DEFAULT NULL,
  p_dsd_cdd_line_number          IN         drop_statement_discounts.dsd_cdd_line_number%TYPE               DEFAULT NULL,
  p_dsd_cdd_cds_cus_code         IN         drop_statement_discounts.dsd_cdd_cds_cus_code%TYPE              DEFAULT NULL,
  p_dsd_cdd_cds_vds_id           IN         drop_statement_discounts.dsd_cdd_cds_vds_id%TYPE                DEFAULT NULL,
  p_dsd_amount                   IN         drop_statement_discounts.dsd_amount%TYPE                        DEFAULT NULL,
  p_dsd_percent                  IN         drop_statement_discounts.dsd_percent%TYPE                       DEFAULT NULL,
  p_dsd_inh_id                   IN         drop_statement_discounts.dsd_inh_id%TYPE                        DEFAULT NULL,
  p_dsd_final_amount             IN         drop_statement_discounts.dsd_final_amount%TYPE                  DEFAULT NULL,
  p_dsd_federal_tax_rate         IN         drop_statement_discounts.dsd_federal_tax_rate%TYPE              DEFAULT 0 ,
  p_dsd_provincial_tax_rate      IN         drop_statement_discounts.dsd_provincial_tax_rate%TYPE           DEFAULT 0 ,
  p_dsd_skip_invoicing_switch    IN         drop_statement_discounts.dsd_skip_invoicing_switch%TYPE         DEFAULT 0 ,
  p_dsd_invoiced_ext_price       IN         drop_statement_discounts.dsd_invoiced_ext_price%TYPE            DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY drop_statement_discounts%ROWTYPE)
RETURN NUMBER;


END DSD_PACK;
/