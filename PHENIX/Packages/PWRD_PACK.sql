CREATE OR REPLACE PACKAGE phenix.PWRD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  public_whse_receipt_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pwrd_id                        IN         public_whse_receipt_details.pwrd_id%TYPE,
  p_pwrd_rec                       OUT NOCOPY public_whse_receipt_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pwrd_id                        IN         public_whse_receipt_details.pwrd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pwrd_id                        IN         public_whse_receipt_details.pwrd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pwrd_id                        IN         public_whse_receipt_details.pwrd_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pwrd_id                        IN         public_whse_receipt_details.pwrd_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pwrd_pwrh_id             IN         public_whse_receipt_details.pwrd_pwrh_id%TYPE,
  p_pwrd_owner_product_code  IN         public_whse_receipt_details.pwrd_owner_product_code%TYPE,
  p_pwrd_line_number         IN         public_whse_receipt_details.pwrd_line_number%TYPE              DEFAULT NULL,
  p_pwrd_format_code         IN         public_whse_receipt_details.pwrd_format_code%TYPE              DEFAULT NULL,
  p_pwrd_product_description IN         public_whse_receipt_details.pwrd_product_description%TYPE      DEFAULT NULL,
  p_pwrd_rows_per_pallet     IN         public_whse_receipt_details.pwrd_rows_per_pallet%TYPE          DEFAULT NULL,
  p_pwrd_items_per_row       IN         public_whse_receipt_details.pwrd_items_per_row%TYPE            DEFAULT NULL,
  p_pwrd_item_pack           IN         public_whse_receipt_details.pwrd_item_pack%TYPE                DEFAULT NULL,
  p_pwrd_vendor_product_code IN         public_whse_receipt_details.pwrd_vendor_product_code%TYPE      DEFAULT NULL,
  p_pwrd_upc_code            IN         public_whse_receipt_details.pwrd_upc_code%TYPE                 DEFAULT NULL,
  p_pwrd_quantity_ordered    IN         public_whse_receipt_details.pwrd_quantity_ordered%TYPE         DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY public_whse_receipt_details%ROWTYPE)
RETURN NUMBER;

END PWRD_PACK;
/