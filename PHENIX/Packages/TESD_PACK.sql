CREATE OR REPLACE PACKAGE phenix.TESD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temp_edi_statement_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tesd_id                        IN         temp_edi_statement_details.tesd_id%TYPE,
  p_tesd_rec                       OUT NOCOPY temp_edi_statement_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_tesd_id                        IN         temp_edi_statement_details.tesd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tesd_id                        IN         temp_edi_statement_details.tesd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tesd_id                        IN         temp_edi_statement_details.tesd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tesd_id                        IN         temp_edi_statement_details.tesd_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tesd_id                        IN         temp_edi_statement_details.tesd_id%TYPE);


FUNCTION INSERT_FUNC(
  p_tesd_segment_type    IN         temp_edi_statement_details.tesd_segment_type%TYPE,
  p_tesd_tesh_id         IN         temp_edi_statement_details.tesd_tesh_id%TYPE              DEFAULT NULL,
  p_tesd_whs_code        IN         temp_edi_statement_details.tesd_whs_code%TYPE             DEFAULT NULL,
  p_tesd_invoice_number  IN         temp_edi_statement_details.tesd_invoice_number%TYPE       DEFAULT NULL,
  p_tesd_invoice_date    IN         temp_edi_statement_details.tesd_invoice_date%TYPE         DEFAULT NULL,
  p_tesd_client_code     IN         temp_edi_statement_details.tesd_client_code%TYPE          DEFAULT NULL,
  p_tesd_customer_code   IN         temp_edi_statement_details.tesd_customer_code%TYPE        DEFAULT NULL,
  p_tesd_federal_tax     IN         temp_edi_statement_details.tesd_federal_tax%TYPE          DEFAULT NULL,
  p_tesd_provincial_tax  IN         temp_edi_statement_details.tesd_provincial_tax%TYPE       DEFAULT NULL,
  p_tesd_invoice_total   IN         temp_edi_statement_details.tesd_invoice_total%TYPE        DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY temp_edi_statement_details%ROWTYPE)
RETURN NUMBER;

END TESD_PACK;
/