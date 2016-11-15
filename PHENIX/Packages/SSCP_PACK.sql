CREATE OR REPLACE PACKAGE phenix.SSCP_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  site_schedule_contract_payment%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sscp_id                        IN         site_schedule_contract_payment.sscp_id%TYPE,
  p_sscp_rec                       OUT NOCOPY site_schedule_contract_payment%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_sscp_id                        IN         site_schedule_contract_payment.sscp_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sscp_id                        IN         site_schedule_contract_payment.sscp_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sscp_id                        IN         site_schedule_contract_payment.sscp_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sscp_id                        IN         site_schedule_contract_payment.sscp_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sscp_id                        IN         site_schedule_contract_payment.sscp_id%TYPE);


FUNCTION INSERT_FUNC(
  p_sscp_ssch_code            IN         site_schedule_contract_payment.sscp_ssch_code%TYPE,
  p_sscp_amount               IN         site_schedule_contract_payment.sscp_amount%TYPE,
  p_sscp_payable_date         IN         site_schedule_contract_payment.sscp_payable_date%TYPE,
  p_sscp_revised_payable_date IN         site_schedule_contract_payment.sscp_revised_payable_date%TYPE,
  p_sscp_actual_paid_date     IN         site_schedule_contract_payment.sscp_actual_paid_date%TYPE          DEFAULT NULL,
  p_sscp_check_number         IN         site_schedule_contract_payment.sscp_check_number%TYPE              DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY site_schedule_contract_payment%ROWTYPE)
RETURN NUMBER;

END SSCP_PACK;
/