CREATE OR REPLACE PACKAGE phenix.TRU_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_tru_trh_id  IN transfer_users.tru_trh_id%TYPE
);

FUNCTION EXISTS_FUNC(
  p_tru_use_code IN transfer_users.tru_use_code%TYPE
)
RETURN BOOLEAN;

END TRU_OPERATION_PACK;
/