CREATE OR REPLACE PACKAGE phenix.SRTD_OPERATION_PACK IS

FUNCTION ADD_CASH_FUNC(
  p_srtd_srth_id IN sales_register_trans_details.srtd_srth_id%TYPE,
  p_srtd_amount  IN sales_register_trans_details.srtd_amount%TYPE
)
RETURN NUMBER;

PROCEDURE ADD_CASH_PROC(
  p_srtd_srth_id IN sales_register_trans_details.srtd_srth_id%TYPE,
  p_srtd_amount  IN sales_register_trans_details.srtd_amount%TYPE
);

PROCEDURE ADD_CREDIT_PROC(
  p_srtd_srth_id              IN sales_register_trans_details.srtd_srth_id%TYPE,
  p_srtd_amount               IN sales_register_trans_details.srtd_amount%TYPE,
  p_srtd_authorisation_number IN sales_register_trans_details.srtd_authorisation_number%TYPE DEFAULT NULL
);

PROCEDURE ADD_DEBIT_PROC(
  p_srtd_srth_id              IN sales_register_trans_details.srtd_srth_id%TYPE,
  p_srtd_amount               IN sales_register_trans_details.srtd_amount%TYPE,
  p_srtd_authorisation_number IN sales_register_trans_details.srtd_authorisation_number%TYPE DEFAULT NULL
);

PROCEDURE ADD_CHECK_PROC(
  p_srtd_srth_id IN sales_register_trans_details.srtd_srth_id%TYPE,
  p_srtd_amount  IN sales_register_trans_details.srtd_amount%TYPE
);

PROCEDURE ADD_POST_DATED_CHECK_PROC(
  p_srtd_srth_id IN sales_register_trans_details.srtd_srth_id%TYPE,
  p_srtd_amount  IN sales_register_trans_details.srtd_amount%TYPE
);

PROCEDURE SET_ACCPAC_SWITCH_PROC(
  p_srth_inh_id IN sales_register_trans_headers.srth_inh_id%TYPE
);

FUNCTION PAY_INVOICE_FUNC(
  p_srtd_srth_id               IN sales_register_trans_details.srtd_srth_id%TYPE,
  p_srtd_balance_amount        IN sales_register_trans_details.srtd_balance_amount%TYPE,
  p_srtd_tty_code              IN sales_register_trans_details.srtd_tty_code%TYPE,
  p_srtd_post_dated_switch     IN sales_register_trans_details.srtd_post_dated_switch%TYPE,
  p_srtd_amount                IN sales_register_trans_details.srtd_amount%TYPE,
  p_srtd_authorization_number  IN sales_register_trans_details.srtd_authorisation_number%TYPE,
  p_srtd_credit_note_reference IN sales_register_trans_details.srtd_credit_note_reference%TYPE
)
RETURN NUMBER;

FUNCTION REFUND_FUNC(
  p_srtd_srth_id               IN sales_register_trans_details.srtd_srth_id%TYPE,
  p_srtd_balance_amount        IN sales_register_trans_details.srtd_balance_amount%TYPE,
  p_srtd_tty_code              IN sales_register_trans_details.srtd_tty_code%TYPE,
  p_srtd_post_dated_switch     IN sales_register_trans_details.srtd_post_dated_switch%TYPE,
  p_srtd_change_amount         IN sales_register_trans_details.srtd_change_amount%TYPE,
  p_srtd_credit_note_reference IN sales_register_trans_details.srtd_credit_note_reference%TYPE
)
RETURN NUMBER;

PROCEDURE ADD_CHANGE_PROC(
  p_srth_id IN sales_register_trans_headers.srth_id%TYPE
);

FUNCTION GET_LAST_PAYMENT_FUNC(
  p_srtd_srth_id IN sales_register_trans_details.srtd_srth_id%TYPE
)
RETURN NUMBER;

PROCEDURE ADJUST_LAST_PAYMENT_PROC(
  p_srtd_srth_id IN sales_register_trans_details.srtd_srth_id%TYPE
);

END SRTD_OPERATION_PACK;
/