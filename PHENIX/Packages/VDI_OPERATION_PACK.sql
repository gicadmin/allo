CREATE OR REPLACE PACKAGE phenix.VDI_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_vdi_vpd_code     IN vendor_discounts.vdi_vpd_code%TYPE,
  p_vdi_vpd_ven_code IN vendor_discounts.vdi_vpd_ven_code%TYPE
);

FUNCTION LOCK_DISCOUNT_FUNC(
  p_vdi_vpd_code     IN vendor_discounts.vdi_vpd_code%TYPE,
  p_vdi_vpd_ven_code IN vendor_discounts.vdi_vpd_ven_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE RESET_R_VDI_PROC;

PROCEDURE LOAD_VDI_PROC(
  p_vdi_vpd_code      IN vendor_discounts.vdi_vpd_code%TYPE,
  p_vdi_vpd_ven_code  IN vendor_discounts.vdi_vpd_ven_code%TYPE
);

PROCEDURE DELETE_VDI_PROC(
  p_vdi_vpd_code      IN vendor_discounts.vdi_vpd_code%TYPE,
  p_vdi_vpd_ven_code  IN vendor_discounts.vdi_vpd_ven_code%TYPE
);

PROCEDURE RECREATE_VDI_PROC(
  p_new_vpd_code      IN vendor_discounts.vdi_vpd_code%TYPE,
  p_new_vpd_ven_code  IN vendor_discounts.vdi_vpd_ven_code%TYPE
);

END VDI_OPERATION_PACK;
/