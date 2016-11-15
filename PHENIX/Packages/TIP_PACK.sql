CREATE OR REPLACE PACKAGE phenix.TIP_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_invoice_payments%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_tip_tty_code              IN         temporary_invoice_payments.tip_tty_code%TYPE,
  p_tip_amount                IN         temporary_invoice_payments.tip_amount%TYPE,
  p_tip_authorization_number  IN         temporary_invoice_payments.tip_authorization_number%TYPE       DEFAULT NULL,
  p_tip_credit_note_reference IN         temporary_invoice_payments.tip_credit_note_reference%TYPE      DEFAULT NULL,
  p_tip_post_dated_switch     IN         temporary_invoice_payments.tip_post_dated_switch%TYPE          DEFAULT 0 ,
  p_tip_change_amount         IN         temporary_invoice_payments.tip_change_amount%TYPE              DEFAULT 0 ,
  p_tip_rounding_amount       IN         temporary_invoice_payments.tip_rounding_amount%TYPE            DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_invoice_payments%ROWTYPE);

END TIP_PACK;
/