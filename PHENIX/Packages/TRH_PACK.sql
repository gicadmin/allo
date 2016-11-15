CREATE OR REPLACE PACKAGE phenix.TRH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  transfer_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_trh_id                         IN         transfer_headers.trh_id%TYPE,
  p_trh_rec                        OUT NOCOPY transfer_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_trh_id                         IN         transfer_headers.trh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_trh_id                         IN         transfer_headers.trh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_trh_id                         IN         transfer_headers.trh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_trh_id                         IN         transfer_headers.trh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_trh_id                         IN         transfer_headers.trh_id%TYPE);


FUNCTION INSERT_FUNC(
  p_trh_whs_from_code    IN         transfer_headers.trh_whs_from_code%TYPE,
  p_trh_whs_to_code      IN         transfer_headers.trh_whs_to_code%TYPE,
  p_trh_status           IN         transfer_headers.trh_status%TYPE,
  p_trh_picking_date     IN         transfer_headers.trh_picking_date%TYPE          DEFAULT NULL,
  p_trh_receiving_date   IN         transfer_headers.trh_receiving_date%TYPE        DEFAULT NULL,
  p_trh_use_lock_code    IN         transfer_headers.trh_use_lock_code%TYPE         DEFAULT NULL,
  p_trh_shipping_date    IN         transfer_headers.trh_shipping_date%TYPE         DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY transfer_headers%ROWTYPE)
RETURN NUMBER;

END TRH_PACK;
/