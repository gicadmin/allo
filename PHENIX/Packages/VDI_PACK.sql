CREATE OR REPLACE PACKAGE phenix.VDI_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_discounts%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vdi_id                         IN         vendor_discounts.vdi_id%TYPE,
  p_vdi_rec                        OUT NOCOPY vendor_discounts%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vdi_id                         IN         vendor_discounts.vdi_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vdi_id                         IN         vendor_discounts.vdi_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vdi_id                         IN         vendor_discounts.vdi_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vdi_id                         IN         vendor_discounts.vdi_id%TYPE);


FUNCTION INSERT_FUNC(
  p_vdi_vdt_dit_code               IN         vendor_discounts.vdi_vdt_dit_code%TYPE,
  p_vdi_vdt_ven_code               IN         vendor_discounts.vdi_vdt_ven_code%TYPE,
  p_vdi_cost_affected_flag         IN         vendor_discounts.vdi_cost_affected_flag%TYPE,
  p_vdi_affect_match_cost_switch   IN         vendor_discounts.vdi_affect_match_cost_switch%TYPE,
  p_vdi_vpd_ven_code               IN         vendor_discounts.vdi_vpd_ven_code%TYPE                    DEFAULT NULL,
  p_vdi_vpd_code                   IN         vendor_discounts.vdi_vpd_code%TYPE                        DEFAULT NULL,
  p_vdi_amount                     IN         vendor_discounts.vdi_amount%TYPE                          DEFAULT NULL,
  p_vdi_drop_amount                IN         vendor_discounts.vdi_drop_amount%TYPE                     DEFAULT NULL,
  p_vdi_drop_percent               IN         vendor_discounts.vdi_drop_percent%TYPE                    DEFAULT NULL,
  p_vdi_percent                    IN         vendor_discounts.vdi_percent%TYPE                         DEFAULT NULL,
  p_vdi_vcg_id                     IN         vendor_discounts.vdi_vcg_id%TYPE                          DEFAULT NULL,
  p_vdi_apply_on_all_vendor_swit   IN         vendor_discounts.vdi_apply_on_all_vendor_switch%TYPE      DEFAULT 0 ,
  p_vdi_all_products_switch        IN         vendor_discounts.vdi_all_products_switch%TYPE             DEFAULT 0 ,
  p_vdi_qualifier                  IN         vendor_discounts.vdi_qualifier%TYPE                       DEFAULT 'IT' ,
  p_vdi_affect_drop_cost_switch    IN         vendor_discounts.vdi_affect_drop_cost_switch%TYPE         DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_discounts%ROWTYPE)
RETURN NUMBER;

END VDI_PACK;
/