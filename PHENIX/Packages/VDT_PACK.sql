CREATE OR REPLACE PACKAGE phenix.VDT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_discount_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vdt_ven_code                   IN         vendor_discount_types.vdt_ven_code%TYPE,
  p_vdt_dit_code                   IN         vendor_discount_types.vdt_dit_code%TYPE,
  p_vdt_rec                        OUT NOCOPY vendor_discount_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vdt_ven_code                   IN         vendor_discount_types.vdt_ven_code%TYPE,
  p_vdt_dit_code                   IN         vendor_discount_types.vdt_dit_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vdt_ven_code                   IN         vendor_discount_types.vdt_ven_code%TYPE,
  p_vdt_dit_code                   IN         vendor_discount_types.vdt_dit_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vdt_ven_code                   IN         vendor_discount_types.vdt_ven_code%TYPE,
  p_vdt_dit_code                   IN         vendor_discount_types.vdt_dit_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vdt_ven_code                   IN         vendor_discount_types.vdt_ven_code%TYPE,
  p_vdt_dit_code                   IN         vendor_discount_types.vdt_dit_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vdt_ven_code                   IN         vendor_discount_types.vdt_ven_code%TYPE,
  p_vdt_dit_code                   IN         vendor_discount_types.vdt_dit_code%TYPE);


PROCEDURE INSERT_PROC(
  p_vdt_ven_code         IN         vendor_discount_types.vdt_ven_code%TYPE,
  p_vdt_dit_code         IN         vendor_discount_types.vdt_dit_code%TYPE,
  p_vdt_refund_type_flag IN         vendor_discount_types.vdt_refund_type_flag%TYPE,
  p_vdt_billing_cycle    IN         vendor_discount_types.vdt_billing_cycle%TYPE         DEFAULT NULL,
  p_vdt_date_last_billed IN         vendor_discount_types.vdt_date_last_billed%TYPE      DEFAULT NULL,
  p_vdt_billing_method   IN         vendor_discount_types.vdt_billing_method%TYPE        DEFAULT 'C' );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_discount_types%ROWTYPE);

END VDT_PACK;
/