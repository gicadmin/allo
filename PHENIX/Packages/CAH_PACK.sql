CREATE OR REPLACE PACKAGE phenix.CAH_PACK IS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_adjustment_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cah_id                         IN         customer_adjustment_headers.cah_id%TYPE,
  p_cah_rec                        OUT NOCOPY customer_adjustment_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_cah_id                         IN         customer_adjustment_headers.cah_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cah_id                         IN         customer_adjustment_headers.cah_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cah_id                         IN         customer_adjustment_headers.cah_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cah_id                         IN         customer_adjustment_headers.cah_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cah_id                         IN         customer_adjustment_headers.cah_id%TYPE);


FUNCTION INSERT_FUNC(
  p_cah_cus_code          IN         customer_adjustment_headers.cah_cus_code%TYPE,
  p_cah_use_code          IN         customer_adjustment_headers.cah_use_code%TYPE,
  p_cah_delivery_charges  IN         customer_adjustment_headers.cah_delivery_charges%TYPE,
  p_cah_open_switch       IN         customer_adjustment_headers.cah_open_switch%TYPE,
  p_cah_print_switch      IN         customer_adjustment_headers.cah_print_switch%TYPE,
  p_cah_ticket_charges    IN         customer_adjustment_headers.cah_ticket_charges%TYPE,
  p_cah_transaction_date  IN         customer_adjustment_headers.cah_transaction_date%TYPE,
  p_cah_whs_delivery_code IN         customer_adjustment_headers.cah_whs_delivery_code%TYPE,
  p_cah_message           IN         customer_adjustment_headers.cah_message%TYPE                DEFAULT NULL,
  p_cah_reference_number  IN         customer_adjustment_headers.cah_reference_number%TYPE       DEFAULT NULL,
  p_cah_rth_id            IN         customer_adjustment_headers.cah_rth_id%TYPE                 DEFAULT NULL,
  p_cah_rma_whs_code      IN         customer_adjustment_headers.cah_rma_whs_code%TYPE           DEFAULT NULL,
  p_cah_print_date        IN         customer_adjustment_headers.cah_print_date%TYPE             DEFAULT NULL,
  p_cah_status            IN         customer_adjustment_headers.cah_status%TYPE                 DEFAULT 'O' )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_adjustment_headers%ROWTYPE)
RETURN NUMBER;

END CAH_PACK;
/