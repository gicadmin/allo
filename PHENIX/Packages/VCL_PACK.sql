CREATE OR REPLACE PACKAGE phenix.VCL_PACK IS

FUNCTION GET_VCL_ID_FUNC
RETURN NUMBER;

FUNCTION FIND_CUS_CODE_FOR_VENDOR_FUNC(
  p_ven_code IN NUMBER,
  p_cus_code IN NUMBER
)
RETURN VARCHAR2;

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_customer_lists%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vcl_id                         IN         vendor_customer_lists.vcl_id%TYPE,
  p_vcl_rec                        OUT NOCOPY vendor_customer_lists%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vcl_id                         IN         vendor_customer_lists.vcl_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vcl_id                         IN         vendor_customer_lists.vcl_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vcl_id                         IN         vendor_customer_lists.vcl_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vcl_id                         IN         vendor_customer_lists.vcl_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_vcl_ven_code                   IN         vendor_customer_lists.vcl_ven_code%TYPE,
  p_vcl_cus_code                   IN         vendor_customer_lists.vcl_cus_code%TYPE,
  p_vcl_rec                        OUT NOCOPY vendor_customer_lists%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vcl_ven_code                   IN         vendor_customer_lists.vcl_ven_code%TYPE,
  p_vcl_cus_code                   IN         vendor_customer_lists.vcl_cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vcl_ven_code                   IN         vendor_customer_lists.vcl_ven_code%TYPE,
  p_vcl_cus_code                   IN         vendor_customer_lists.vcl_cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vcl_ven_code                   IN         vendor_customer_lists.vcl_ven_code%TYPE,
  p_vcl_cus_code                   IN         vendor_customer_lists.vcl_cus_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vcl_ven_code                   IN         vendor_customer_lists.vcl_ven_code%TYPE,
  p_vcl_cus_code                   IN         vendor_customer_lists.vcl_cus_code%TYPE);


FUNCTION INSERT_FUNC(
  p_vcl_ven_code                 IN         vendor_customer_lists.vcl_ven_code%TYPE,
  p_vcl_cus_code                 IN         vendor_customer_lists.vcl_cus_code%TYPE,
  p_vcl_customer_code_for_vendor IN         vendor_customer_lists.vcl_customer_code_for_vendor%TYPE,
  p_vcl_collection_type          IN         vendor_customer_lists.vcl_collection_type%TYPE               DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_customer_lists%ROWTYPE)
RETURN NUMBER;


END VCL_PACK;
/