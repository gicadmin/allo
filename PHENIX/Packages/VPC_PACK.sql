CREATE OR REPLACE PACKAGE phenix.VPC_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_purchase_cycles%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vpc_ven_code                   IN         vendor_purchase_cycles.vpc_ven_code%TYPE,
  p_vpc_pcy_day                    IN         vendor_purchase_cycles.vpc_pcy_day%TYPE,
  p_vpc_pcy_week                   IN         vendor_purchase_cycles.vpc_pcy_week%TYPE,
  p_vpc_rec                        OUT NOCOPY vendor_purchase_cycles%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vpc_ven_code                   IN         vendor_purchase_cycles.vpc_ven_code%TYPE,
  p_vpc_pcy_day                    IN         vendor_purchase_cycles.vpc_pcy_day%TYPE,
  p_vpc_pcy_week                   IN         vendor_purchase_cycles.vpc_pcy_week%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_vpc_ven_code                   IN         vendor_purchase_cycles.vpc_ven_code%TYPE,
  p_vpc_pcy_day                    IN         vendor_purchase_cycles.vpc_pcy_day%TYPE,
  p_vpc_pcy_week                   IN         vendor_purchase_cycles.vpc_pcy_week%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vpc_ven_code                   IN         vendor_purchase_cycles.vpc_ven_code%TYPE,
  p_vpc_pcy_day                    IN         vendor_purchase_cycles.vpc_pcy_day%TYPE,
  p_vpc_pcy_week                   IN         vendor_purchase_cycles.vpc_pcy_week%TYPE);


PROCEDURE INSERT_PROC(
  p_vpc_ven_code         IN         vendor_purchase_cycles.vpc_ven_code%TYPE,
  p_vpc_pcy_week         IN         vendor_purchase_cycles.vpc_pcy_week%TYPE,
  p_vpc_pcy_day          IN         vendor_purchase_cycles.vpc_pcy_day%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_purchase_cycles%ROWTYPE);

END VPC_PACK;
/