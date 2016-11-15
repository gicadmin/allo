CREATE OR REPLACE PACKAGE phenix.PWPD_OPERATION_PACK IS

PROCEDURE PURGE_HEADER_PROC(
  p_pwph_id  IN  public_whse_pick_headers.pwph_id%TYPE
);

PROCEDURE PURGE_PROC(
  p_pwpd_id  IN  public_whse_pick_details.pwpd_id%TYPE
);

FUNCTION CREATE_PWPD_FUNC(
  p_pwph_id                 IN public_whse_pick_details.pwpd_pwph_id%TYPE,
  p_pwpd_owner_product_code IN public_whse_pick_details.pwpd_owner_product_code%TYPE,
  p_quantity                IN NUMBER
)
RETURN NUMBER;

END PWPD_OPERATION_PACK;
/