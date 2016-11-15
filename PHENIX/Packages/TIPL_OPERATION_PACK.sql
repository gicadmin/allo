CREATE OR REPLACE PACKAGE phenix.TIPL_OPERATION_PACK AS

PROCEDURE BUILD_PROC(
  p_trh_use_lock_code IN transfer_headers.trh_use_lock_code%TYPE,
  p_trd_prf_prd_code  IN transfer_details.trd_prf_prd_code%TYPE,
  p_trd_prf_fmt_code  IN transfer_details.trd_prf_fmt_code%TYPE,
  p_language          IN VARCHAR2
);

PROCEDURE BUILD_PROC(
  p_trh_use_lock_code IN transfer_headers.trh_use_lock_code%TYPE,
  p_language          IN VARCHAR2
);

END TIPL_OPERATION_PACK;
/