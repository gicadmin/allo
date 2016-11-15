CREATE OR REPLACE PACKAGE phenix.CDO_OPERATION_PACK AS

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cdo_doc_code  IN  customer_documents.cdo_doc_code%TYPE,
  p_column_name   IN  VARCHAR2,
  p_raise         IN  BOOLEAN  DEFAULT TRUE
)
RETURN NUMBER;

PROCEDURE SET_CUSTOMER_PROC(
  p_cdo_doc_code             IN customer_documents.cdo_doc_code%TYPE,
  p_cdo_cgr_code             IN customer_documents.cdo_cgr_code%TYPE,
  p_cdo_all_customers_switch IN customer_documents.cdo_all_customers_switch%TYPE
);

PROCEDURE SET_CUSTOMER_PROC(
  p_cdo_doc_code IN customer_documents.cdo_doc_code%TYPE,
  p_cdo_cus_code IN customer_documents.cdo_cus_code%TYPE
);

PROCEDURE DELETE_PROC(
  p_cdo_doc_code IN customer_documents.cdo_doc_code%TYPE,
  p_cdo_cus_code IN customer_documents.cdo_cus_code%TYPE
);

PROCEDURE DELETE_PROC(
  p_cdo_doc_code IN customer_documents.cdo_doc_code%TYPE
);

FUNCTION IS_USED_BY_GROUP_OR_ALL_FUNC(
  p_cdo_doc_code IN customer_documents.cdo_doc_code%TYPE
)
RETURN BOOLEAN;

END CDO_OPERATION_PACK;
/