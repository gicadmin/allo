CREATE OR REPLACE PACKAGE phenix.CVA_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_cva_ven_code IN customer_vendor_associations.cva_ven_code%TYPE
);

FUNCTION COUNT_FUNC(
  p_cva_ven_code IN customer_vendor_associations.cva_ven_code%TYPE
)
RETURN NUMBER;

END CVA_OPERATION_PACK;
/