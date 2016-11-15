CREATE OR REPLACE PACKAGE phenix.ACE_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  avr_customer_exceptions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ace_id                         IN         avr_customer_exceptions.ace_id%TYPE,
  p_ace_rec                        OUT NOCOPY avr_customer_exceptions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ace_id                         IN         avr_customer_exceptions.ace_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_ace_id                         IN         avr_customer_exceptions.ace_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ace_id                         IN         avr_customer_exceptions.ace_id%TYPE);


FUNCTION INSERT_FUNC(
  p_ace_vcg_id            IN         avr_customer_exceptions.ace_vcg_id%TYPE,
  p_ace_cus_code          IN         avr_customer_exceptions.ace_cus_code%TYPE,
  p_ace_warehouse_percent IN         avr_customer_exceptions.ace_warehouse_percent%TYPE      DEFAULT NULL,
  p_ace_drop_percent      IN         avr_customer_exceptions.ace_drop_percent%TYPE           DEFAULT NULL,
  p_ace_warehouse_amount  IN         avr_customer_exceptions.ace_warehouse_amount%TYPE       DEFAULT NULL,
  p_ace_drop_amount       IN         avr_customer_exceptions.ace_drop_amount%TYPE            DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY avr_customer_exceptions%ROWTYPE)
RETURN NUMBER;

END ACE_PACK;
/