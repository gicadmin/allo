CREATE OR REPLACE PACKAGE phenix.TIP_OPERATION_PACK IS

PROCEDURE PAY_INVOICE_PROC(
  p_cash_amount             IN temporary_invoice_payments.tip_amount%TYPE,
  p_debit_amount            IN temporary_invoice_payments.tip_amount%TYPE,
  p_debit_authorization     IN temporary_invoice_payments.tip_authorization_number%TYPE,
  p_credit_amount           IN temporary_invoice_payments.tip_amount%TYPE,
  p_credit_authorization    IN temporary_invoice_payments.tip_authorization_number%TYPE,
  p_check_amount            IN temporary_invoice_payments.tip_amount%TYPE,
  p_post_dated_check_amount IN temporary_invoice_payments.tip_amount%TYPE,
  p_on_account_amount       IN temporary_invoice_payments.tip_amount%TYPE,
  p_change_amount           IN temporary_invoice_payments.tip_change_amount%TYPE,
  p_rounding_amount         IN temporary_invoice_payments.tip_rounding_amount%TYPE
);

PROCEDURE ADD_CREDIT_NOTE_PROC(
  p_tip_amount                IN temporary_invoice_payments.tip_amount%TYPE,
  p_tip_credit_note_reference IN temporary_invoice_payments.tip_credit_note_reference%TYPE
);

PROCEDURE DEBUG_PROC;

PROCEDURE INITIALIZE_PROC;

FUNCTION GET_TOTAL_PAYMENTS_FUNC
RETURN NUMBER;

PROCEDURE DELETE_PAYMENT_PROC(
  p_tip_tty_code          IN temporary_invoice_payments.tip_tty_code%TYPE,
  p_tip_post_dated_switch IN temporary_invoice_payments.tip_post_dated_switch%TYPE
);

PROCEDURE ADJUST_PAYMENT_PROC(
  p_tip_tty_code          IN temporary_invoice_payments.tip_tty_code%TYPE,
  p_tip_post_dated_switch IN temporary_invoice_payments.tip_post_dated_switch%TYPE,
  p_tip_amount            IN temporary_invoice_payments.tip_amount%TYPE
);

PROCEDURE GET_CHANGE_AMOUNT_PROC(
  p_change_amount  OUT NUMBER,
  p_rouding_amount OUT NUMBER
);

FUNCTION DISTRIBUTE_PAYMENTS_FUNC(
  p_srth_type             IN  sales_register_trans_headers.srth_type%TYPE,
  p_tty_code              IN  temporary_invoice_payments.tip_tty_code%TYPE,
  p_post_dated_switch     IN  temporary_invoice_payments.tip_post_dated_switch%TYPE,
  p_credit_note_reference IN  temporary_invoice_payments.tip_credit_note_reference%TYPE,
  p_payment_amount        IN  temporary_invoice_payments.tip_amount%TYPE,
  p_invoice_amount        IN  NUMBER,
  p_distributed_amount    OUT NUMBER
)
RETURN NUMBER;

PROCEDURE INITIALIZE_CREDIT_NOTE_PROC;

FUNCTION GET_TOTAL_CREDIT_NOTE_FUNC
RETURN NUMBER;

FUNCTION LAST_PAYMENT_FUNC
RETURN BOOLEAN;

END TIP_OPERATION_PACK;
/