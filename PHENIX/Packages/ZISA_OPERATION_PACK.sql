CREATE OR REPLACE PACKAGE phenix.ZISA_OPERATION_PACK AS
PROCEDURE PURGE_PROC(
  p_max_items IN NUMBER
);
PROCEDURE CREATE_PROC(
  p_prf_prd_code              IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code              IN product_formats.prf_fmt_code%TYPE,
  p_loc_code                  IN locations.loc_code%type,
  p_on_hand_qty_or_weight     IN NUMBER,
  p_transaction_qty_or_weight IN NUMBER
);
END ZISA_OPERATION_PACK;
/