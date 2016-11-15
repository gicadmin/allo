CREATE OR REPLACE PACKAGE phenix.PWRH_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_pwrh_id  IN  public_whse_receipt_headers.pwrh_id%TYPE
);

PROCEDURE CLOSE_RECEPTION_PROC(
  p_pwrh_id     IN  public_whse_receipt_headers.pwrh_id%TYPE,
  p_use_code    IN users.use_code%TYPE
);

FUNCTION CREATE_PWRH_FUNC(
  p_pwrh_pwo_code                 IN public_whse_receipt_headers.pwrh_pwo_code%TYPE,
  p_pwrh_whs_code                 IN public_whse_receipt_headers.pwrh_whs_code%TYPE,
  p_pwrh_receipt_number           IN public_whse_receipt_headers.pwrh_receipt_number%TYPE,
  p_pwrh_seal_number              IN public_whse_receipt_headers.pwrh_seal_number%TYPE DEFAULT NULL,
  p_pwrh_project_reception_date   IN public_whse_receipt_headers.pwrh_project_reception_date%TYPE DEFAULT SYSDATE,
  p_pwrh_creation_date            IN public_whse_receipt_headers.pwrh_creation_date%TYPE DEFAULT SYSDATE
)
RETURN NUMBER;

END PWRH_OPERATION_PACK;
/