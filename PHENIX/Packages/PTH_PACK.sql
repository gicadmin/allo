CREATE OR REPLACE PACKAGE phenix.PTH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pallet_transaction_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pth_id                         IN         pallet_transaction_headers.pth_id%TYPE,
  p_pth_rec                        OUT NOCOPY pallet_transaction_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pth_id                         IN         pallet_transaction_headers.pth_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pth_id                         IN         pallet_transaction_headers.pth_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pth_id                         IN         pallet_transaction_headers.pth_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pth_id                         IN         pallet_transaction_headers.pth_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_pth_cus_code                   IN         pallet_transaction_headers.pth_cus_code%TYPE,
  p_pth_ven_code                   IN         pallet_transaction_headers.pth_ven_code%TYPE,
  p_pth_car_code                   IN         pallet_transaction_headers.pth_car_code%TYPE,
  p_pth_trans_date                 IN         pallet_transaction_headers.pth_trans_date%TYPE,
  p_pth_reference_number           IN         pallet_transaction_headers.pth_reference_number%TYPE,
  p_pth_carrier_responsible_swit   IN         pallet_transaction_headers.pth_carrier_responsible_switch%TYPE,
  p_pth_whs_code                   IN         pallet_transaction_headers.pth_whs_code%TYPE,
  p_pth_shh_id                     IN         pallet_transaction_headers.pth_shh_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pallet_transaction_headers%ROWTYPE)
RETURN NUMBER;

END PTH_PACK;
/