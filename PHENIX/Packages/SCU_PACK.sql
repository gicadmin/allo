CREATE OR REPLACE PACKAGE phenix.SCU_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  statistics_tracking_customers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_scu_stt_code                   IN         statistics_tracking_customers.scu_stt_code%TYPE,
  p_scu_cus_code                   IN         statistics_tracking_customers.scu_cus_code%TYPE,
  p_scu_rec                        OUT NOCOPY statistics_tracking_customers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_scu_stt_code                   IN         statistics_tracking_customers.scu_stt_code%TYPE,
  p_scu_cus_code                   IN         statistics_tracking_customers.scu_cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_scu_stt_code                   IN         statistics_tracking_customers.scu_stt_code%TYPE,
  p_scu_cus_code                   IN         statistics_tracking_customers.scu_cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_scu_stt_code                   IN         statistics_tracking_customers.scu_stt_code%TYPE,
  p_scu_cus_code                   IN         statistics_tracking_customers.scu_cus_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_scu_stt_code                   IN         statistics_tracking_customers.scu_stt_code%TYPE,
  p_scu_cus_code                   IN         statistics_tracking_customers.scu_cus_code%TYPE);


PROCEDURE INSERT_PROC(
  p_scu_stt_code         IN         statistics_tracking_customers.scu_stt_code%TYPE,
  p_scu_cus_code         IN         statistics_tracking_customers.scu_cus_code%TYPE,
  p_scu_customer_code    IN         statistics_tracking_customers.scu_customer_code%TYPE         DEFAULT NULL,
  p_scu_stg_stt_code     IN         statistics_tracking_customers.scu_stg_stt_code%TYPE          DEFAULT NULL,
  p_scu_stg_code         IN         statistics_tracking_customers.scu_stg_code%TYPE              DEFAULT NULL,
  p_scu_ship_to_id       IN         statistics_tracking_customers.scu_ship_to_id%TYPE            DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY statistics_tracking_customers%ROWTYPE);

END SCU_PACK;
/