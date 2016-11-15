CREATE OR REPLACE PACKAGE phenix.CRE_OPERATION_PACK IS

FUNCTION OPEN_CASH_FUNC(
  p_srth_cre_code  IN  sales_register_trans_headers.srth_cre_code%TYPE,
  p_srth_use_code  IN  sales_register_trans_headers.srth_use_code%TYPE,
  p_srth_whs_code  IN  sales_register_trans_headers.srth_whs_code%TYPE,
  p_srth_amount    IN  sales_register_trans_headers.srth_amount%TYPE,
  p_language       IN  VARCHAR2
)
RETURN NUMBER;

FUNCTION CLOSE_CASH_FUNC(
  p_srth_cre_code           IN  sales_register_trans_headers.srth_cre_code%TYPE,
  p_srth_use_code           IN  sales_register_trans_headers.srth_use_code%TYPE,
  p_srth_whs_code           IN  sales_register_trans_headers.srth_whs_code%TYPE,
  p_cash_amount             IN  sales_register_trans_headers.srth_amount%TYPE,
  p_credit_amount           IN  sales_register_trans_headers.srth_amount%TYPE,
  p_debit_amount            IN  sales_register_trans_headers.srth_amount%TYPE,
  p_check_amount            IN  sales_register_trans_headers.srth_amount%TYPE,
  p_check_postdated_amount  IN  sales_register_trans_headers.srth_amount%TYPE,
  p_language                IN  VARCHAR2
)
RETURN NUMBER;

PROCEDURE IS_OPEN_BY_USER_PROC(
  p_use_code              IN  users.use_code%TYPE,
  p_cre_code              OUT cash_registers.cre_code%TYPE,
  p_cre_latest_open_date  OUT cash_registers.cre_latest_open_date%TYPE
);

FUNCTION UPDATE_CRE_LIMIT_FLAG_FUNC(
  p_cre_latest_use_code    IN cash_registers.cre_latest_use_code%TYPE,
  p_cre_actual_amount      IN cash_registers.cre_actual_amount%TYPE
) RETURN VARCHAR2;

FUNCTION CHECK_IF_CASH_IS_OPEN_FUNC(
  p_use_code  IN sales_register_trans_headers.srth_use_code%TYPE
) RETURN BOOLEAN;

PROCEDURE HAS_CASH_IS_OPEN_PROC(
  p_cre_code             IN  cash_registers.cre_code%TYPE,
  p_cre_latest_use_code  OUT cash_registers.cre_latest_use_code%TYPE
);

PROCEDURE VALIDATE_OPEN_CASH_PROC(
  p_use_code  IN  sales_register_trans_headers.srth_use_code%TYPE,
  p_cre_code  IN  cash_registers.cre_code%TYPE
);

FUNCTION VALIDATE_CLOSE_CASH_FUNC(
  p_use_code  IN  sales_register_trans_headers.srth_use_code%TYPE
)
RETURN NUMBER;

FUNCTION PRINT_RAP_BALANCEMENT_FUNC(
  p_use_code  IN users.use_code%TYPE,
  p_cre_code  IN cash_registers.cre_code%TYPE,
  p_whs_code  IN users.use_whs_code%TYPE
)
RETURN VARCHAR2;

PROCEDURE LOCK_PROC(
  p_cre_code IN cash_registers.cre_code%TYPE
);

PROCEDURE CHECK_LOCK_PROC(
  p_cre_code IN cash_registers.cre_code%TYPE
);

PROCEDURE UPDATE_FOR_UPDATE_PROC(
  p_srtd_srth_id           IN  sales_register_trans_details.srtd_srth_id%TYPE,
  p_srtd_amount            IN  sales_register_trans_details.srtd_amount%TYPE,
  p_srtd_change_amount     IN  sales_register_trans_details.srtd_change_amount%TYPE,
  p_srtd_tty_code          IN  sales_register_trans_details.srtd_tty_code%TYPE,
  p_old_srtd_amount        IN  sales_register_trans_details.srtd_amount%TYPE,
  p_old_srtd_change_amount IN sales_register_trans_details.srtd_change_amount%TYPE
);

PROCEDURE UPDATE_FOR_INSERT_PROC(
  p_srtd_srth_id         IN  sales_register_trans_details.srtd_srth_id%TYPE,
  p_srtd_amount          IN  sales_register_trans_details.srtd_amount%TYPE,
  p_srtd_rounding_amount IN  sales_register_trans_details.srtd_rounding_amount%TYPE,
  p_srtd_change_amount   IN  sales_register_trans_details.srtd_change_amount%TYPE,
  p_srtd_tty_code        IN  sales_register_trans_details.srtd_tty_code%TYPE
);
END CRE_OPERATION_PACK;
/