CREATE OR REPLACE PACKAGE phenix.ASH_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_jsc_id IN NUMBER
);

PROCEDURE UPDATE_ASH_DATE_PROC(
  p_ash_accpac_id IN NUMBER,
  p_cus_code      IN NUMBER,
  p_date          IN DATE
);

FUNCTION FIND_IF_ASH_EXISTS_FUNC(
  p_ash_accpac_id IN NUMBER,
  p_cus_code      IN NUMBER
)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_ash_cus_code IN account_statement_headers.ash_cus_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_ash_accpac_id IN account_statement_headers.ash_accpac_id%TYPE,
  p_ash_cus_code  IN account_statement_headers.ash_cus_code%TYPE
);

FUNCTION EXISTS_STATEMENT_TO_PRINT_FUNC(
  p_ash_cus_code IN account_statement_headers.ash_cus_code%TYPE
)
RETURN BOOLEAN;

END ASH_OPERATION_PACK;
/