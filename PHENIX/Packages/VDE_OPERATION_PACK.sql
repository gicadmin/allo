CREATE OR REPLACE PACKAGE phenix.VDE_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_vde_vdi_id IN vendor_discount_exceptions.vde_vdi_id%TYPE
);

FUNCTION EXISTS_VDE_FUNC(
  p_vde_vdi_id IN vendor_discount_exceptions.vde_vdi_id%TYPE
)
RETURN BOOLEAN;

END VDE_OPERATION_PACK;
/