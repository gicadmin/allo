CREATE OR REPLACE PACKAGE phenix.PTD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pallet_transaction_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ptd_id                         IN         pallet_transaction_details.ptd_id%TYPE,
  p_ptd_rec                        OUT NOCOPY pallet_transaction_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ptd_id                         IN         pallet_transaction_details.ptd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ptd_id                         IN         pallet_transaction_details.ptd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ptd_id                         IN         pallet_transaction_details.ptd_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_ptd_pth_id           IN         pallet_transaction_details.ptd_pth_id%TYPE,
  p_ptd_in_out_code      IN         pallet_transaction_details.ptd_in_out_code%TYPE,
  p_ptd_pal_code         IN         pallet_transaction_details.ptd_pal_code%TYPE,
  p_ptd_quantity         IN         pallet_transaction_details.ptd_quantity%TYPE,
  p_ptd_ptb_id           IN         pallet_transaction_details.ptd_ptb_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pallet_transaction_details%ROWTYPE)
RETURN NUMBER;

END PTD_PACK;
/