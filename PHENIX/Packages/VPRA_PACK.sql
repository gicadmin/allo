CREATE OR REPLACE PACKAGE phenix.VPRA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_product_allocations%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vpra_id                        IN         vendor_product_allocations.vpra_id%TYPE,
  p_vpra_rec                       OUT NOCOPY vendor_product_allocations%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vpra_id                        IN         vendor_product_allocations.vpra_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vpra_id                        IN         vendor_product_allocations.vpra_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vpra_id                        IN         vendor_product_allocations.vpra_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vpra_id                        IN         vendor_product_allocations.vpra_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vpra_id                        IN         vendor_product_allocations.vpra_id%TYPE);


FUNCTION INSERT_FUNC(
  p_vpra_vpd_code                IN         vendor_product_allocations.vpra_vpd_code%TYPE,
  p_vpra_vpd_ven_distrib_by_code IN         vendor_product_allocations.vpra_vpd_ven_distrib_by_code%TYPE,
  p_vpra_purch_allocation        IN         vendor_product_allocations.vpra_purch_allocation%TYPE,
  p_vpra_start_date              IN         vendor_product_allocations.vpra_start_date%TYPE,
  p_vpra_end_date                IN         vendor_product_allocations.vpra_end_date%TYPE                     DEFAULT NULL,
  p_vpra_creation_date           IN         vendor_product_allocations.vpra_creation_date%TYPE                DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_product_allocations%ROWTYPE)
RETURN NUMBER;

END VPRA_PACK;
/