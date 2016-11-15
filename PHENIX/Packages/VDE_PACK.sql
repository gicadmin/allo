CREATE OR REPLACE PACKAGE phenix.VDE_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_discount_exceptions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vde_id                         IN         vendor_discount_exceptions.vde_id%TYPE,
  p_vde_rec                        OUT NOCOPY vendor_discount_exceptions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vde_id                         IN         vendor_discount_exceptions.vde_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_vde_id                         IN         vendor_discount_exceptions.vde_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vde_id                         IN         vendor_discount_exceptions.vde_id%TYPE);


FUNCTION INSERT_FUNC(
  p_vde_vdi_id                  IN         vendor_discount_exceptions.vde_vdi_id%TYPE,
  p_vde_affect_drop_cost_switch IN         vendor_discount_exceptions.vde_affect_drop_cost_switch%TYPE,
  p_vde_rcl_id                  IN         vendor_discount_exceptions.vde_rcl_id%TYPE                       DEFAULT NULL,
  p_vde_naz_nac_code            IN         vendor_discount_exceptions.vde_naz_nac_code%TYPE                 DEFAULT NULL,
  p_vde_naz_zone_code           IN         vendor_discount_exceptions.vde_naz_zone_code%TYPE                DEFAULT NULL,
  p_vde_drop_percent            IN         vendor_discount_exceptions.vde_drop_percent%TYPE                 DEFAULT NULL,
  p_vde_drop_amount             IN         vendor_discount_exceptions.vde_drop_amount%TYPE                  DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_discount_exceptions%ROWTYPE)
RETURN NUMBER;

END VDE_PACK;
/