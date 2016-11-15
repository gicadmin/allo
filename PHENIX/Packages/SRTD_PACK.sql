CREATE OR REPLACE PACKAGE phenix.SRTD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  sales_register_trans_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_srtd_id                        IN         sales_register_trans_details.srtd_id%TYPE,
  p_srtd_rec                       OUT NOCOPY sales_register_trans_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_srtd_id                        IN         sales_register_trans_details.srtd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_srtd_id                        IN         sales_register_trans_details.srtd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_srtd_id                        IN         sales_register_trans_details.srtd_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_srtd_id                        IN         sales_register_trans_details.srtd_id%TYPE);


FUNCTION INSERT_FUNC(
  p_srtd_srth_id               IN         sales_register_trans_details.srtd_srth_id%TYPE,
  p_srtd_amount                IN         sales_register_trans_details.srtd_amount%TYPE,
  p_srtd_tty_code              IN         sales_register_trans_details.srtd_tty_code%TYPE,
  p_srtd_authorisation_number  IN         sales_register_trans_details.srtd_authorisation_number%TYPE       DEFAULT NULL,
  p_srtd_credit_note_reference IN         sales_register_trans_details.srtd_credit_note_reference%TYPE      DEFAULT NULL,
  p_srtd_post_dated_switch     IN         sales_register_trans_details.srtd_post_dated_switch%TYPE          DEFAULT 0,
  p_srtd_in_accpac_switch      IN         sales_register_trans_details.srtd_in_accpac_switch%TYPE           DEFAULT 0 ,
  p_srtd_change_amount         IN         sales_register_trans_details.srtd_change_amount%TYPE              DEFAULT 0 ,
  p_srtd_rounding_amount       IN         sales_register_trans_details.srtd_rounding_amount%TYPE            DEFAULT 0 ,
  p_srtd_balance_amount        IN         sales_register_trans_details.srtd_balance_amount%TYPE             DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY sales_register_trans_details%ROWTYPE)
RETURN NUMBER;

END SRTD_PACK;
/