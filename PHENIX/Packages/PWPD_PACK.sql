CREATE OR REPLACE PACKAGE phenix.PWPD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  public_whse_pick_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pwpd_id                        IN         public_whse_pick_details.pwpd_id%TYPE,
  p_pwpd_rec                       OUT NOCOPY public_whse_pick_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pwpd_id                        IN         public_whse_pick_details.pwpd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pwpd_id                        IN         public_whse_pick_details.pwpd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pwpd_id                        IN         public_whse_pick_details.pwpd_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pwpd_id                        IN         public_whse_pick_details.pwpd_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pwpd_pwph_id             IN         public_whse_pick_details.pwpd_pwph_id%TYPE,
  p_pwpd_owner_product_code  IN         public_whse_pick_details.pwpd_owner_product_code%TYPE,
  p_pwpd_line_number         IN         public_whse_pick_details.pwpd_line_number%TYPE              DEFAULT NULL,
  p_pwpd_format_code         IN         public_whse_pick_details.pwpd_format_code%TYPE              DEFAULT NULL,
  p_pwpd_product_description IN         public_whse_pick_details.pwpd_product_description%TYPE      DEFAULT NULL,
  p_pwpd_item_pack           IN         public_whse_pick_details.pwpd_item_pack%TYPE                DEFAULT NULL,
  p_pwpd_vendor_product_code IN         public_whse_pick_details.pwpd_vendor_product_code%TYPE      DEFAULT NULL,
  p_pwpd_upc_code            IN         public_whse_pick_details.pwpd_upc_code%TYPE                 DEFAULT NULL,
  p_pwpd_quantity_to_pick    IN         public_whse_pick_details.pwpd_quantity_to_pick%TYPE         DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY public_whse_pick_details%ROWTYPE)
RETURN NUMBER;

END PWPD_PACK;
/