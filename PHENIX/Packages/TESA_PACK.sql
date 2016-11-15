CREATE OR REPLACE PACKAGE phenix.TESA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temp_edi_statement_addresses%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tesa_id                        IN         temp_edi_statement_addresses.tesa_id%TYPE,
  p_tesa_rec                       OUT NOCOPY temp_edi_statement_addresses%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tesa_id                        IN         temp_edi_statement_addresses.tesa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tesa_id                        IN         temp_edi_statement_addresses.tesa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tesa_id                        IN         temp_edi_statement_addresses.tesa_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tesa_id                        IN         temp_edi_statement_addresses.tesa_id%TYPE);


FUNCTION INSERT_FUNC(
  p_tesa_segment_type         IN         temp_edi_statement_addresses.tesa_segment_type%TYPE,
  p_tesa_address_type         IN         temp_edi_statement_addresses.tesa_address_type%TYPE,
  p_tesa_tesh_id              IN         temp_edi_statement_addresses.tesa_tesh_id%TYPE                   DEFAULT NULL,
  p_tesa_whs_code             IN         temp_edi_statement_addresses.tesa_whs_code%TYPE                  DEFAULT NULL,
  p_tesa_enterprise_name      IN         temp_edi_statement_addresses.tesa_enterprise_name%TYPE           DEFAULT NULL,
  p_tesa_enterprise_reference IN         temp_edi_statement_addresses.tesa_enterprise_reference%TYPE      DEFAULT NULL,
  p_tesa_duns_number          IN         temp_edi_statement_addresses.tesa_duns_number%TYPE               DEFAULT NULL,
  p_tesa_site_number          IN         temp_edi_statement_addresses.tesa_site_number%TYPE               DEFAULT NULL,
  p_tesa_telephone            IN         temp_edi_statement_addresses.tesa_telephone%TYPE                 DEFAULT NULL,
  p_tesa_contact_name         IN         temp_edi_statement_addresses.tesa_contact_name%TYPE              DEFAULT NULL,
  p_tesa_contact_telephone    IN         temp_edi_statement_addresses.tesa_contact_telephone%TYPE         DEFAULT NULL,
  p_tesa_address              IN         temp_edi_statement_addresses.tesa_address%TYPE                   DEFAULT NULL,
  p_tesa_address_suite        IN         temp_edi_statement_addresses.tesa_address_suite%TYPE             DEFAULT NULL,
  p_tesa_city                 IN         temp_edi_statement_addresses.tesa_city%TYPE                      DEFAULT NULL,
  p_tesa_province_code        IN         temp_edi_statement_addresses.tesa_province_code%TYPE             DEFAULT NULL,
  p_tesa_postal_code          IN         temp_edi_statement_addresses.tesa_postal_code%TYPE               DEFAULT NULL,
  p_tesa_country_code         IN         temp_edi_statement_addresses.tesa_country_code%TYPE              DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY temp_edi_statement_addresses%ROWTYPE)
RETURN NUMBER;

END TESA_PACK;
/