CREATE OR REPLACE PACKAGE phenix.APC_OPERATION_PACK IS

PROCEDURE UPDATE_ALTERNATE_CODE(
 p_apc_code      IN  alternate_product_codes.apc_code%TYPE,
 p_apc_prd_code  IN  alternate_product_codes.apc_prd_code%TYPE
);

FUNCTION DELETE_APC_FUNC(
 p_apc_code      IN  alternate_product_codes.apc_code%TYPE,
 p_apc_prd_code  IN  alternate_product_codes.apc_prd_code%TYPE,
 p_prf_fmt_code  IN  product_formats.prf_fmt_code%TYPE
) RETURN NUMBER;

END APC_OPERATION_PACK;
/