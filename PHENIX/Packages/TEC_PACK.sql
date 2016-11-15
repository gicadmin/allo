CREATE OR REPLACE PACKAGE phenix.TEC_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  transporter_ref_customers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tec_id                         IN         transporter_ref_customers.tec_id%TYPE,
  p_tec_rec                        OUT NOCOPY transporter_ref_customers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tec_id                         IN         transporter_ref_customers.tec_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tec_id                         IN         transporter_ref_customers.tec_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tec_id                         IN         transporter_ref_customers.tec_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tec_id                         IN         transporter_ref_customers.tec_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_tec_ven_code                   IN         transporter_ref_customers.tec_ven_code%TYPE,
  p_tec_cus_transporter_code       IN         transporter_ref_customers.tec_cus_transporter_code%TYPE,
  p_tec_transporter_reference      IN         transporter_ref_customers.tec_transporter_reference%TYPE,
  p_tec_cus_code                   IN         transporter_ref_customers.tec_cus_code%TYPE,
  p_tec_rec                        OUT NOCOPY transporter_ref_customers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tec_ven_code                   IN         transporter_ref_customers.tec_ven_code%TYPE,
  p_tec_cus_transporter_code       IN         transporter_ref_customers.tec_cus_transporter_code%TYPE,
  p_tec_transporter_reference      IN         transporter_ref_customers.tec_transporter_reference%TYPE,
  p_tec_cus_code                   IN         transporter_ref_customers.tec_cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tec_ven_code                   IN         transporter_ref_customers.tec_ven_code%TYPE,
  p_tec_cus_transporter_code       IN         transporter_ref_customers.tec_cus_transporter_code%TYPE,
  p_tec_transporter_reference      IN         transporter_ref_customers.tec_transporter_reference%TYPE,
  p_tec_cus_code                   IN         transporter_ref_customers.tec_cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tec_ven_code                   IN         transporter_ref_customers.tec_ven_code%TYPE,
  p_tec_cus_transporter_code       IN         transporter_ref_customers.tec_cus_transporter_code%TYPE,
  p_tec_transporter_reference      IN         transporter_ref_customers.tec_transporter_reference%TYPE,
  p_tec_cus_code                   IN         transporter_ref_customers.tec_cus_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tec_ven_code                   IN         transporter_ref_customers.tec_ven_code%TYPE,
  p_tec_cus_transporter_code       IN         transporter_ref_customers.tec_cus_transporter_code%TYPE,
  p_tec_transporter_reference      IN         transporter_ref_customers.tec_transporter_reference%TYPE,
  p_tec_cus_code                   IN         transporter_ref_customers.tec_cus_code%TYPE);


FUNCTION INSERT_FUNC(
  p_tec_ven_code              IN         transporter_ref_customers.tec_ven_code%TYPE,
  p_tec_cus_transporter_code  IN         transporter_ref_customers.tec_cus_transporter_code%TYPE,
  p_tec_transporter_reference IN         transporter_ref_customers.tec_transporter_reference%TYPE,
  p_tec_cus_code              IN         transporter_ref_customers.tec_cus_code%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY transporter_ref_customers%ROWTYPE)
RETURN NUMBER;

END TEC_PACK;
/