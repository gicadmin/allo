CREATE OR REPLACE PACKAGE phenix.VSIP_OPERATION_PACK AS

PROCEDURE PURGE_PROC(
  p_vsip_prf_prd_code  IN vendor_sales_incent_products.vsip_prf_prd_code%TYPE
) ;

--------------------------------------------------------------------------
FUNCTION EXIST_VSIP_FOR_VSI_FUNC(
 p_vsip_vsi_code                        IN         vendor_sales_incent_products.vsip_vsi_code%TYPE
 ) RETURN BOOLEAN ;

END VSIP_OPERATION_PACK;
/