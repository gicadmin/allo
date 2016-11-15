CREATE OR REPLACE PACKAGE phenix.VDS_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_drop_statements%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vds_id                         IN         vendor_drop_statements.vds_id%TYPE,
  p_vds_rec                        OUT NOCOPY vendor_drop_statements%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vds_id                         IN         vendor_drop_statements.vds_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vds_id                         IN         vendor_drop_statements.vds_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vds_id                         IN         vendor_drop_statements.vds_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vds_id                         IN         vendor_drop_statements.vds_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vds_id                         IN         vendor_drop_statements.vds_id%TYPE);


FUNCTION INSERT_FUNC(
  p_vds_ven_code                IN         vendor_drop_statements.vds_ven_code%TYPE,
  p_vds_edi_switch              IN         vendor_drop_statements.vds_edi_switch%TYPE,
  p_vds_reference_number        IN         vendor_drop_statements.vds_reference_number%TYPE,
  p_vds_status                  IN         vendor_drop_statements.vds_status%TYPE,
  p_vds_ven_ap_code             IN         vendor_drop_statements.vds_ven_ap_code%TYPE,
  p_vds_customer_details_switch IN         vendor_drop_statements.vds_customer_details_switch%TYPE,
  p_vds_whs_code                IN         vendor_drop_statements.vds_whs_code%TYPE,
  p_vds_invoice_date            IN         vendor_drop_statements.vds_invoice_date%TYPE                 DEFAULT NULL,
  p_vds_message                 IN         vendor_drop_statements.vds_message%TYPE                      DEFAULT NULL,
  p_vds_810_switch              IN         vendor_drop_statements.vds_810_switch%TYPE                   DEFAULT 0 ,
  p_vds_include_in_stats_switch IN         vendor_drop_statements.vds_include_in_stats_switch%TYPE      DEFAULT 1 ,
  p_vds_in_process_switch       IN         vendor_drop_statements.vds_in_process_switch%TYPE            DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_drop_statements%ROWTYPE)
RETURN NUMBER;

END VDS_PACK;
/