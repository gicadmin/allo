CREATE OR REPLACE PACKAGE phenix.CVA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_vendor_associations%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cva_id                         IN         customer_vendor_associations.cva_id%TYPE,
  p_cva_rec                        OUT NOCOPY customer_vendor_associations%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cva_id                         IN         customer_vendor_associations.cva_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_cva_id                         IN         customer_vendor_associations.cva_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_cva_cus_code            IN         customer_vendor_associations.cva_cus_code%TYPE,
  p_cva_ven_code            IN         customer_vendor_associations.cva_ven_code%TYPE,
  p_cva_included_switch     IN         customer_vendor_associations.cva_included_switch%TYPE,
  p_cva_redistribute_switch IN         customer_vendor_associations.cva_redistribute_switch%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_vendor_associations%ROWTYPE)
RETURN NUMBER;

END CVA_PACK;
/