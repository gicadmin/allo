CREATE OR REPLACE PACKAGE phenix.PTB_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pallet_transaction_balances%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ptb_id                         IN         pallet_transaction_balances.ptb_id%TYPE,
  p_ptb_rec                        OUT NOCOPY pallet_transaction_balances%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ptb_id                         IN         pallet_transaction_balances.ptb_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ptb_id                         IN         pallet_transaction_balances.ptb_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ptb_id                         IN         pallet_transaction_balances.ptb_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ptb_id                         IN         pallet_transaction_balances.ptb_id%TYPE)
RETURN NUMBER;

FUNCTION GET_FULL_FUNC(
  p_ptb_fca_year                   IN         pallet_transaction_balances.ptb_fca_year%TYPE,
  p_ptb_fca_period                 IN         pallet_transaction_balances.ptb_fca_period%TYPE,
  p_ptb_whs_code                   IN         pallet_transaction_balances.ptb_whs_code%TYPE,
  p_ptb_pal_code                   IN         pallet_transaction_balances.ptb_pal_code%TYPE,
  p_ptb_car_code                   IN         pallet_transaction_balances.ptb_car_code%TYPE,
  p_ptb_cus_code                   IN         pallet_transaction_balances.ptb_cus_code%TYPE,
  p_ptb_ven_code                   IN         pallet_transaction_balances.ptb_ven_code%TYPE,
  p_ptb_rec                        OUT NOCOPY pallet_transaction_balances%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ptb_fca_year                   IN         pallet_transaction_balances.ptb_fca_year%TYPE,
  p_ptb_fca_period                 IN         pallet_transaction_balances.ptb_fca_period%TYPE,
  p_ptb_whs_code                   IN         pallet_transaction_balances.ptb_whs_code%TYPE,
  p_ptb_pal_code                   IN         pallet_transaction_balances.ptb_pal_code%TYPE,
  p_ptb_car_code                   IN         pallet_transaction_balances.ptb_car_code%TYPE,
  p_ptb_cus_code                   IN         pallet_transaction_balances.ptb_cus_code%TYPE,
  p_ptb_ven_code                   IN         pallet_transaction_balances.ptb_ven_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ptb_fca_year                   IN         pallet_transaction_balances.ptb_fca_year%TYPE,
  p_ptb_fca_period                 IN         pallet_transaction_balances.ptb_fca_period%TYPE,
  p_ptb_whs_code                   IN         pallet_transaction_balances.ptb_whs_code%TYPE,
  p_ptb_pal_code                   IN         pallet_transaction_balances.ptb_pal_code%TYPE,
  p_ptb_car_code                   IN         pallet_transaction_balances.ptb_car_code%TYPE,
  p_ptb_cus_code                   IN         pallet_transaction_balances.ptb_cus_code%TYPE,
  p_ptb_ven_code                   IN         pallet_transaction_balances.ptb_ven_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ptb_fca_year                   IN         pallet_transaction_balances.ptb_fca_year%TYPE,
  p_ptb_fca_period                 IN         pallet_transaction_balances.ptb_fca_period%TYPE,
  p_ptb_whs_code                   IN         pallet_transaction_balances.ptb_whs_code%TYPE,
  p_ptb_pal_code                   IN         pallet_transaction_balances.ptb_pal_code%TYPE,
  p_ptb_car_code                   IN         pallet_transaction_balances.ptb_car_code%TYPE,
  p_ptb_cus_code                   IN         pallet_transaction_balances.ptb_cus_code%TYPE,
  p_ptb_ven_code                   IN         pallet_transaction_balances.ptb_ven_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ptb_fca_year                   IN         pallet_transaction_balances.ptb_fca_year%TYPE,
  p_ptb_fca_period                 IN         pallet_transaction_balances.ptb_fca_period%TYPE,
  p_ptb_whs_code                   IN         pallet_transaction_balances.ptb_whs_code%TYPE,
  p_ptb_pal_code                   IN         pallet_transaction_balances.ptb_pal_code%TYPE,
  p_ptb_car_code                   IN         pallet_transaction_balances.ptb_car_code%TYPE,
  p_ptb_cus_code                   IN         pallet_transaction_balances.ptb_cus_code%TYPE,
  p_ptb_ven_code                   IN         pallet_transaction_balances.ptb_ven_code%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_ptb_fca_year               IN         pallet_transaction_balances.ptb_fca_year%TYPE,
  p_ptb_fca_period             IN         pallet_transaction_balances.ptb_fca_period%TYPE,
  p_ptb_whs_code               IN         pallet_transaction_balances.ptb_whs_code%TYPE,
  p_ptb_pal_code               IN         pallet_transaction_balances.ptb_pal_code%TYPE,
  p_ptb_car_code               IN         pallet_transaction_balances.ptb_car_code%TYPE,
  p_ptb_ven_code               IN         pallet_transaction_balances.ptb_ven_code%TYPE,
  p_ptb_cus_code               IN         pallet_transaction_balances.ptb_cus_code%TYPE,
  p_ptb_inh_id                 IN         pallet_transaction_balances.ptb_inh_id%TYPE,
  p_ptb_last_date_consolidated IN         pallet_transaction_balances.ptb_last_date_consolidated%TYPE,
  p_ptb_open_balance           IN         pallet_transaction_balances.ptb_open_balance%TYPE                DEFAULT NULL,
  p_ptb_close_balance          IN         pallet_transaction_balances.ptb_close_balance%TYPE               DEFAULT NULL,
  p_ptb_invoiced_quantity      IN         pallet_transaction_balances.ptb_invoiced_quantity%TYPE           DEFAULT NULL,
  p_ptb_federal_tax_amount     IN         pallet_transaction_balances.ptb_federal_tax_amount%TYPE          DEFAULT NULL,
  p_ptb_provincial_tax_amount  IN         pallet_transaction_balances.ptb_provincial_tax_amount%TYPE       DEFAULT NULL,
  p_ptb_unit_cost              IN         pallet_transaction_balances.ptb_unit_cost%TYPE                   DEFAULT NULL,
  p_ptb_extended_cost          IN         pallet_transaction_balances.ptb_extended_cost%TYPE               DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pallet_transaction_balances%ROWTYPE)
RETURN NUMBER;

END PTB_PACK;
/