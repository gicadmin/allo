CREATE OR REPLACE PACKAGE phenix.SSCH_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  site_sales_contract_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ssch_code                      IN         site_sales_contract_headers.ssch_code%TYPE,
  p_ssch_rec                       OUT NOCOPY site_sales_contract_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ssch_code                      IN         site_sales_contract_headers.ssch_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ssch_code                      IN         site_sales_contract_headers.ssch_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ssch_code                      IN         site_sales_contract_headers.ssch_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ssch_code                      IN         site_sales_contract_headers.ssch_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ssch_code                      IN         site_sales_contract_headers.ssch_code%TYPE);


PROCEDURE INSERT_PROC(
  p_ssch_code             IN         site_sales_contract_headers.ssch_code%TYPE,
  p_ssch_sit_code         IN         site_sales_contract_headers.ssch_sit_code%TYPE,
  p_ssch_start_date       IN         site_sales_contract_headers.ssch_start_date%TYPE,
  p_ssch_end_date         IN         site_sales_contract_headers.ssch_end_date%TYPE,
  p_ssch_revised_end_date IN         site_sales_contract_headers.ssch_revised_end_date%TYPE      DEFAULT NULL,
  p_ssch_message          IN         site_sales_contract_headers.ssch_message%TYPE               DEFAULT NULL,
  p_ssch_active_switch    IN         site_sales_contract_headers.ssch_active_switch%TYPE         DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY site_sales_contract_headers%ROWTYPE);

END SSCH_PACK;
/