CREATE OR REPLACE PACKAGE phenix.CRDH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_route_docum_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_crdh_cus_code                  IN         customer_route_docum_headers.crdh_cus_code%TYPE,
  p_crdh_rou_code                  IN         customer_route_docum_headers.crdh_rou_code%TYPE,
  p_crdh_rou_date                  IN         customer_route_docum_headers.crdh_rou_date%TYPE,
  p_crdh_rec                       OUT NOCOPY customer_route_docum_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_crdh_cus_code                  IN         customer_route_docum_headers.crdh_cus_code%TYPE,
  p_crdh_rou_code                  IN         customer_route_docum_headers.crdh_rou_code%TYPE,
  p_crdh_rou_date                  IN         customer_route_docum_headers.crdh_rou_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_crdh_cus_code                  IN         customer_route_docum_headers.crdh_cus_code%TYPE,
  p_crdh_rou_code                  IN         customer_route_docum_headers.crdh_rou_code%TYPE,
  p_crdh_rou_date                  IN         customer_route_docum_headers.crdh_rou_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_crdh_cus_code                  IN         customer_route_docum_headers.crdh_cus_code%TYPE,
  p_crdh_rou_code                  IN         customer_route_docum_headers.crdh_rou_code%TYPE,
  p_crdh_rou_date                  IN         customer_route_docum_headers.crdh_rou_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_crdh_cus_code                  IN         customer_route_docum_headers.crdh_cus_code%TYPE,
  p_crdh_rou_code                  IN         customer_route_docum_headers.crdh_rou_code%TYPE,
  p_crdh_rou_date                  IN         customer_route_docum_headers.crdh_rou_date%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_crdh_cus_code                  IN         customer_route_docum_headers.crdh_cus_code%TYPE,
  p_crdh_rou_code                  IN         customer_route_docum_headers.crdh_rou_code%TYPE,
  p_crdh_rou_date                  IN         customer_route_docum_headers.crdh_rou_date%TYPE);

FUNCTION GET_FULL_FUNC(
  p_crdh_rou_date                  IN         customer_route_docum_headers.crdh_rou_date%TYPE,
  p_crdh_sequence                  IN         customer_route_docum_headers.crdh_sequence%TYPE,
  p_crdh_whs_code                  IN         customer_route_docum_headers.crdh_whs_code%TYPE,
  p_crdh_rec                       OUT NOCOPY customer_route_docum_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_crdh_rou_date                  IN         customer_route_docum_headers.crdh_rou_date%TYPE,
  p_crdh_sequence                  IN         customer_route_docum_headers.crdh_sequence%TYPE,
  p_crdh_whs_code                  IN         customer_route_docum_headers.crdh_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_crdh_rou_date                  IN         customer_route_docum_headers.crdh_rou_date%TYPE,
  p_crdh_sequence                  IN         customer_route_docum_headers.crdh_sequence%TYPE,
  p_crdh_whs_code                  IN         customer_route_docum_headers.crdh_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_crdh_rou_date                  IN         customer_route_docum_headers.crdh_rou_date%TYPE,
  p_crdh_sequence                  IN         customer_route_docum_headers.crdh_sequence%TYPE,
  p_crdh_whs_code                  IN         customer_route_docum_headers.crdh_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_crdh_rou_date                  IN         customer_route_docum_headers.crdh_rou_date%TYPE,
  p_crdh_sequence                  IN         customer_route_docum_headers.crdh_sequence%TYPE,
  p_crdh_whs_code                  IN         customer_route_docum_headers.crdh_whs_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_crdh_rou_date                  IN         customer_route_docum_headers.crdh_rou_date%TYPE,
  p_crdh_sequence                  IN         customer_route_docum_headers.crdh_sequence%TYPE,
  p_crdh_whs_code                  IN         customer_route_docum_headers.crdh_whs_code%TYPE);

FUNCTION GET_FULL_FUNC(
  p_crdh_id                        IN         customer_route_docum_headers.crdh_id%TYPE,
  p_crdh_rec                       OUT NOCOPY customer_route_docum_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_crdh_id                        IN         customer_route_docum_headers.crdh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_crdh_id                        IN         customer_route_docum_headers.crdh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_crdh_id                        IN         customer_route_docum_headers.crdh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_crdh_id                        IN         customer_route_docum_headers.crdh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_crdh_id                        IN         customer_route_docum_headers.crdh_id%TYPE);


FUNCTION INSERT_FUNC(
  p_crdh_cus_code        IN         customer_route_docum_headers.crdh_cus_code%TYPE,
  p_crdh_rou_code        IN         customer_route_docum_headers.crdh_rou_code%TYPE,
  p_crdh_rou_date        IN         customer_route_docum_headers.crdh_rou_date%TYPE,
  p_crdh_sequence        IN         customer_route_docum_headers.crdh_sequence%TYPE,
  p_crdh_whs_code        IN         customer_route_docum_headers.crdh_whs_code%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_route_docum_headers%ROWTYPE)
RETURN NUMBER;

END CRDH_PACK;
/