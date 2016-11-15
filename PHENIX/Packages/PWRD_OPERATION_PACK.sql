CREATE OR REPLACE PACKAGE phenix.PWRD_OPERATION_PACK IS

PROCEDURE PURGE_HEADER_PROC(
  p_pwrh_id  IN  public_whse_receipt_headers.pwrh_id%TYPE
);

PROCEDURE PURGE_PROC(
  p_pwrd_id  IN  public_whse_receipt_details.pwrd_id%TYPE
);

FUNCTION CREATE_PWRD_FUNC(
  p_pwrd_pwrh_id              IN public_whse_receipt_details.pwrd_pwrh_id%TYPE,
  p_pwrd_owner_product_code   IN public_whse_receipt_details.pwrd_owner_product_code%TYPE,
  p_pwrd_format_code          IN public_whse_receipt_details.pwrd_format_code%TYPE DEFAULT NULL,
  p_pwrd_product_description  IN public_whse_receipt_details.pwrd_product_description%TYPE DEFAULT NULL,
  p_pwrd_quantity_ordered     IN public_whse_receipt_details.pwrd_quantity_ordered%TYPE DEFAULT 0,
  p_pwrd_rows_per_pallet      IN public_whse_receipt_details.pwrd_rows_per_pallet%TYPE DEFAULT NULL,
  p_pwrd_items_per_row        IN public_whse_receipt_details.pwrd_items_per_row%TYPE DEFAULT NULL
)
RETURN NUMBER;

END PWRD_OPERATION_PACK;
/