CREATE OR REPLACE PACKAGE phenix.MCH_OPERATION_PACK IS

FUNCTION TRANSFORM_TO_INH_FUNC(
  p_mch_id IN miscellaneous_charge_headers.mch_id%TYPE
)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_mch_id  IN  miscellaneous_charge_headers.mch_id%TYPE
);

END MCH_OPERATION_PACK;
/