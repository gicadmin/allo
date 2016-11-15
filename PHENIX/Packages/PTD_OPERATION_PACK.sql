CREATE OR REPLACE PACKAGE phenix.PTD_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
    p_ptb_ib    IN  pallet_transaction_balances.ptb_id%TYPE
) ;
FUNCTION SUM_ALL_PTD_FOR_PTB_FUNC(
		p_ptb_id 		IN pallet_transaction_balances.ptb_id%TYPE
)
RETURN NUMBER;
END PTD_OPERATION_PACK;
/