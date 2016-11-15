CREATE OR REPLACE PACKAGE phenix.PWPH_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_pwph_id  IN  public_whse_pick_headers.pwph_id%TYPE
);

PROCEDURE CLOSE_PICKING_PROC(
  p_pwph_id     IN  public_whse_pick_headers.pwph_id%TYPE,
  p_use_code    IN users.use_code%TYPE
);

FUNCTION CREATE_PWPH_FUNC(
  p_pwph_pwo_code             IN public_whse_pick_headers.pwph_pwo_code%TYPE,
  p_pwph_whs_code             IN public_whse_pick_headers.pwph_whs_code%TYPE,
  p_pwph_picking_number       IN public_whse_pick_headers.pwph_picking_number%TYPE,
  p_pwph_requested_ship_date  IN public_whse_pick_headers.pwph_requested_ship_date%TYPE DEFAULT SYSDATE,
  p_pwph_creation_date        IN public_whse_pick_headers.pwph_creation_date%TYPE DEFAULT SYSDATE
)
RETURN NUMBER;

END PWPH_OPERATION_PACK;
/