CREATE OR REPLACE PACKAGE phenix.PWPH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  public_whse_pick_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pwph_id                        IN         public_whse_pick_headers.pwph_id%TYPE,
  p_pwph_rec                       OUT NOCOPY public_whse_pick_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pwph_id                        IN         public_whse_pick_headers.pwph_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pwph_id                        IN         public_whse_pick_headers.pwph_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pwph_id                        IN         public_whse_pick_headers.pwph_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pwph_id                        IN         public_whse_pick_headers.pwph_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pwph_id                        IN         public_whse_pick_headers.pwph_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_pwph_pwo_code                  IN         public_whse_pick_headers.pwph_pwo_code%TYPE,
  p_pwph_picking_number            IN         public_whse_pick_headers.pwph_picking_number%TYPE,
  p_pwph_rec                       OUT NOCOPY public_whse_pick_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pwph_pwo_code                  IN         public_whse_pick_headers.pwph_pwo_code%TYPE,
  p_pwph_picking_number            IN         public_whse_pick_headers.pwph_picking_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pwph_pwo_code                  IN         public_whse_pick_headers.pwph_pwo_code%TYPE,
  p_pwph_picking_number            IN         public_whse_pick_headers.pwph_picking_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pwph_pwo_code                  IN         public_whse_pick_headers.pwph_pwo_code%TYPE,
  p_pwph_picking_number            IN         public_whse_pick_headers.pwph_picking_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pwph_pwo_code                  IN         public_whse_pick_headers.pwph_pwo_code%TYPE,
  p_pwph_picking_number            IN         public_whse_pick_headers.pwph_picking_number%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pwph_pwo_code                  IN         public_whse_pick_headers.pwph_pwo_code%TYPE,
  p_pwph_picking_number            IN         public_whse_pick_headers.pwph_picking_number%TYPE);


FUNCTION INSERT_FUNC(
  p_pwph_pwo_code            IN         public_whse_pick_headers.pwph_pwo_code%TYPE,
  p_pwph_whs_code            IN         public_whse_pick_headers.pwph_whs_code%TYPE,
  p_pwph_picking_number      IN         public_whse_pick_headers.pwph_picking_number%TYPE,
  p_pwph_requested_ship_date IN         public_whse_pick_headers.pwph_requested_ship_date%TYPE      DEFAULT NULL,
  p_pwph_order_number        IN         public_whse_pick_headers.pwph_order_number%TYPE             DEFAULT NULL,
  p_pwph_site_number         IN         public_whse_pick_headers.pwph_site_number%TYPE              DEFAULT NULL,
  p_pwph_enterprise_name     IN         public_whse_pick_headers.pwph_enterprise_name%TYPE          DEFAULT NULL,
  p_pwph_account_id          IN         public_whse_pick_headers.pwph_account_id%TYPE               DEFAULT NULL,
  p_pwph_address             IN         public_whse_pick_headers.pwph_address%TYPE                  DEFAULT NULL,
  p_pwph_city                IN         public_whse_pick_headers.pwph_city%TYPE                     DEFAULT NULL,
  p_pwph_prv_code            IN         public_whse_pick_headers.pwph_prv_code%TYPE                 DEFAULT NULL,
  p_pwph_postal_code         IN         public_whse_pick_headers.pwph_postal_code%TYPE              DEFAULT NULL,
  p_pwph_transport_method    IN         public_whse_pick_headers.pwph_transport_method%TYPE         DEFAULT NULL,
  p_pwph_creation_date       IN         public_whse_pick_headers.pwph_creation_date%TYPE            DEFAULT SYSDATE ,
  p_pwph_closed_switch       IN         public_whse_pick_headers.pwph_closed_switch%TYPE            DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY public_whse_pick_headers%ROWTYPE)
RETURN NUMBER;

END PWPH_PACK;
/