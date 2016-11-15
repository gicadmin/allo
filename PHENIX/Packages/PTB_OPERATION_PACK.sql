CREATE OR REPLACE PACKAGE phenix.PTB_OPERATION_PACK IS

FUNCTION FIND_CURRENT_PTB_FUNC(
  p_ptd_pth_id         IN      pallet_transaction_details.ptd_pth_id%TYPE,
  p_ptd_pal_code       IN      pallet_transaction_details.ptd_pal_code %TYPE
) RETURN NUMBER;

FUNCTION LAST_PTB_BALANCE_FUNC(
  p_ptb_fca_year     IN      pallet_transaction_balances.ptb_fca_year%TYPE,
  p_ptb_fca_period   IN      pallet_transaction_balances.ptb_fca_period%TYPE,
  p_ptb_whs_code     IN      pallet_transaction_balances.ptb_whs_code%TYPE,
	p_ptb_pal_code   	 IN      pallet_transaction_balances.ptb_pal_code%TYPE,
  p_ptb_car_code     IN      pallet_transaction_balances.ptb_car_code%TYPE,
  p_ptb_cus_code     IN      pallet_transaction_balances.ptb_cus_code%TYPE,
  p_ptb_ven_code     IN      pallet_transaction_balances.ptb_ven_code%TYPE
) RETURN NUMBER;


FUNCTION LAST_PTB_BAL_AND_TRANS_FUNC(
  p_ptb_fca_year     IN      pallet_transaction_balances.ptb_fca_year%TYPE,
  p_ptb_fca_period   IN      pallet_transaction_balances.ptb_fca_period%TYPE,
  p_ptb_whs_code     IN      pallet_transaction_balances.ptb_whs_code%TYPE,
	p_ptb_pal_code   	 IN      pallet_transaction_balances.ptb_pal_code%TYPE,
  p_ptb_car_code     IN      pallet_transaction_balances.ptb_car_code%TYPE,
  p_ptb_cus_code     IN      pallet_transaction_balances.ptb_cus_code%TYPE,
  p_ptb_ven_code     IN      pallet_transaction_balances.ptb_ven_code%TYPE
) RETURN NUMBER;

PROCEDURE PURGE_PROC(
 p_inh_id               IN invoice_headers.inh_id%TYPE
);

PROCEDURE PURGE_PROC(
    p_nb_days_to_keep    IN  NUMBER,
    p_max_items          IN  NUMBER
) ;

PROCEDURE CLOSE_PALLET_BALANCES_PROC;

PROCEDURE INSERT_PTB_NEXT_PERIOD_PROC(
  p_ptb_fca_year     IN   pallet_transaction_balances.ptb_fca_year%TYPE,
  p_ptb_fca_period   IN   pallet_transaction_balances.ptb_fca_period%TYPE,
  p_ptb_whs_code     IN   pallet_transaction_balances.ptb_whs_code%TYPE,
  p_ptb_pal_code   	 IN   pallet_transaction_balances.ptb_pal_code%TYPE,
  p_ptb_cus_code     IN   pallet_transaction_balances.ptb_cus_code%TYPE,
  p_ptb_ven_code     IN   pallet_transaction_balances.ptb_ven_code%TYPE,
  p_ptb_car_code     IN   pallet_transaction_balances.ptb_car_code%TYPE
);

END PTB_OPERATION_PACK;
/