CREATE OR REPLACE PACKAGE phenix.CRT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  credit_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_crt_code                       IN         credit_types.crt_code%TYPE,
  p_crt_rec                        OUT NOCOPY credit_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_crt_code                       IN         credit_types.crt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_crt_code                       IN         credit_types.crt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_crt_code                       IN         credit_types.crt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_crt_code                       IN         credit_types.crt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_crt_code                       IN         credit_types.crt_code%TYPE);


PROCEDURE INSERT_PROC(
  p_crt_code                      IN         credit_types.crt_code%TYPE,
  p_crt_description               IN         credit_types.crt_description%TYPE,
  p_crt_debit_switch              IN         credit_types.crt_debit_switch%TYPE,
  p_crt_invoice_required_switch   IN         credit_types.crt_invoice_required_switch%TYPE,
  p_crt_override_switch           IN         credit_types.crt_override_switch%TYPE,
  p_crt_same_format_switch        IN         credit_types.crt_same_format_switch%TYPE,
  p_crt_same_product_switch       IN         credit_types.crt_same_product_switch%TYPE,
  p_crt_service_charge_switch     IN         credit_types.crt_service_charge_switch%TYPE,
  p_crt_wms_interface_flag        IN         credit_types.crt_wms_interface_flag%TYPE,
  p_crt_print_rma_flag            IN         credit_types.crt_print_rma_flag%TYPE,
  p_crt_alt_description           IN         credit_types.crt_alt_description%TYPE                DEFAULT NULL,
  p_crt_credit_days               IN         credit_types.crt_credit_days%TYPE                    DEFAULT NULL,
  p_crt_allow_telemarketer_switc  IN         credit_types.crt_allow_telemarketer_switch%TYPE      DEFAULT 0 ,
  p_crt_debit_only_switch         IN         credit_types.crt_debit_only_switch%TYPE              DEFAULT 0 ,
  p_crt_damaged_goods_switch      IN         credit_types.crt_damaged_goods_switch%TYPE           DEFAULT 0 ,
  p_crt_picker_error_switch       IN         credit_types.crt_picker_error_switch%TYPE            DEFAULT 0 ,
  p_crt_apply_consignments_switc  IN         credit_types.crt_apply_consignments_switch%TYPE      DEFAULT 1 ,
  p_crt_override_password_switch  IN         credit_types.crt_override_password_switch%TYPE       DEFAULT 0 ,
  p_crt_return_only_switch        IN         credit_types.crt_return_only_switch%TYPE             DEFAULT 0 ,
  p_crt_perishable_return_switch  IN         credit_types.crt_perishable_return_switch%TYPE       DEFAULT 0 ,
  p_crt_allow_cash_n_carry_switc  IN         credit_types.crt_allow_cash_n_carry_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY credit_types%ROWTYPE);

  FUNCTION FIND_CRT_DESCRIPTION_FUNC(
  p_crt_code IN NUMBER,
  p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;
END CRT_PACK;
/