CREATE OR REPLACE PACKAGE phenix.TESH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temp_edi_statement_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tesh_id                        IN         temp_edi_statement_headers.tesh_id%TYPE,
  p_tesh_rec                       OUT NOCOPY temp_edi_statement_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_tesh_id                        IN         temp_edi_statement_headers.tesh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tesh_id                        IN         temp_edi_statement_headers.tesh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tesh_id                        IN         temp_edi_statement_headers.tesh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tesh_id                        IN         temp_edi_statement_headers.tesh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tesh_id                        IN         temp_edi_statement_headers.tesh_id%TYPE);


FUNCTION INSERT_FUNC(
  p_tesh_segment_type          IN         temp_edi_statement_headers.tesh_segment_type%TYPE,
  p_tesh_whs_code              IN         temp_edi_statement_headers.tesh_whs_code%TYPE                   DEFAULT NULL,
  p_tesh_partner_code          IN         temp_edi_statement_headers.tesh_partner_code%TYPE               DEFAULT NULL,
  p_tesh_sender_id_qualifier   IN         temp_edi_statement_headers.tesh_sender_id_qualifier%TYPE        DEFAULT NULL,
  p_tesh_sender_id             IN         temp_edi_statement_headers.tesh_sender_id%TYPE                  DEFAULT NULL,
  p_tesh_receiver_id_qualifier IN         temp_edi_statement_headers.tesh_receiver_id_qualifier%TYPE      DEFAULT NULL,
  p_tesh_receiver_id           IN         temp_edi_statement_headers.tesh_receiver_id%TYPE                DEFAULT NULL,
  p_tesh_statement_date        IN         temp_edi_statement_headers.tesh_statement_date%TYPE             DEFAULT NULL,
  p_tesh_statement_number      IN         temp_edi_statement_headers.tesh_statement_number%TYPE           DEFAULT NULL,
  p_tesh_federal_tax_number    IN         temp_edi_statement_headers.tesh_federal_tax_number%TYPE         DEFAULT NULL,
  p_tesh_provincial_tax_number IN         temp_edi_statement_headers.tesh_provincial_tax_number%TYPE      DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY temp_edi_statement_headers%ROWTYPE)
RETURN NUMBER;

END TESH_PACK;
/