CREATE OR REPLACE PACKAGE phenix.CSP_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_specific_reports%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_csp_report_name                IN         customer_specific_reports.csp_report_name%TYPE,
  p_csp_rec                        OUT NOCOPY customer_specific_reports%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_csp_report_name                IN         customer_specific_reports.csp_report_name%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_csp_report_name                IN         customer_specific_reports.csp_report_name%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_csp_report_name                IN         customer_specific_reports.csp_report_name%TYPE);


PROCEDURE INSERT_PROC(
  p_csp_report_name      IN         customer_specific_reports.csp_report_name%TYPE,
  p_csp_customer_code    IN         customer_specific_reports.csp_customer_code%TYPE,
  p_csp_whs_code         IN         customer_specific_reports.csp_whs_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_specific_reports%ROWTYPE);

END CSP_PACK;
/