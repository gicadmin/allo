CREATE OR REPLACE PACKAGE phenix.CDO_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_documents%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cdo_id                         IN         customer_documents.cdo_id%TYPE,
  p_cdo_rec                        OUT NOCOPY customer_documents%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cdo_id                         IN         customer_documents.cdo_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_cdo_id                         IN         customer_documents.cdo_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cdo_id                         IN         customer_documents.cdo_id%TYPE);


FUNCTION INSERT_FUNC(
  p_cdo_doc_code             IN         customer_documents.cdo_doc_code%TYPE,
  p_cdo_cus_code             IN         customer_documents.cdo_cus_code%TYPE                  DEFAULT NULL,
  p_cdo_cgr_code             IN         customer_documents.cdo_cgr_code%TYPE                  DEFAULT NULL,
  p_cdo_all_customers_switch IN         customer_documents.cdo_all_customers_switch%TYPE      DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_documents%ROWTYPE)
RETURN NUMBER;

END CDO_PACK;
/