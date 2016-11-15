CREATE OR REPLACE PACKAGE phenix.VPRA_OPERATION_PACK IS

PROCEDURE RESET_R_VPRA_PROC;

PROCEDURE LOAD_VPRA_PROC(
  p_vpra_vpd_code                   IN vendor_product_allocations.vpra_vpd_code%TYPE,
  p_vpra_vpd_ven_distrib_by_code    IN vendor_product_allocations.vpra_vpd_ven_distrib_by_code%TYPE
);

PROCEDURE DELETE_VPRA_PROC(
  p_vpra_vpd_code                   IN vendor_product_allocations.vpra_vpd_code%TYPE,
  p_vpra_vpd_ven_distrib_by_code    IN vendor_product_allocations.vpra_vpd_ven_distrib_by_code%TYPE
);

PROCEDURE RECREATE_VPRA_PROC(
  p_new_vpd_code                   IN vendor_product_allocations.vpra_vpd_code%TYPE,
  p_new_vpd_ven_distrib_by_code    IN vendor_product_allocations.vpra_vpd_ven_distrib_by_code%TYPE
);

FUNCTION GET_PURCH_ALLOC_FUNC(
  p_prf_prd_code  IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code  IN product_formats.prf_fmt_code%TYPE,
  p_date          IN DATE DEFAULT SYSDATE
)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_vpra_vpd_code                IN vendor_product_allocations.vpra_vpd_code%TYPE,
  p_vpra_vpd_ven_distrib_by_code IN vendor_product_allocations.vpra_vpd_ven_distrib_by_code%TYPE
);

FUNCTION LOCK_ALLOCATION_FUNC(
  p_vpra_vpd_code                IN vendor_product_allocations.vpra_vpd_code%TYPE,
  p_vpra_vpd_ven_distrib_by_code IN vendor_product_allocations.vpra_vpd_ven_distrib_by_code%TYPE
)
RETURN BOOLEAN;

END VPRA_OPERATION_PACK;
/