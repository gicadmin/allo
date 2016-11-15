CREATE OR REPLACE PACKAGE phenix.CPY_OPERATION_PACK IS

FUNCTION GET_FULL_FUNC(
  p_cpy_pty_code IN customer_promotion_types.cpy_pty_code%TYPE,
  p_cpy_cus_code IN customer_promotion_types.cpy_cus_code%TYPE,
  p_cpy_rec      OUT NOCOPY customer_promotion_types%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION GET_FULL_FUNC(
  p_cpy_pty_code IN customer_promotion_types.cpy_pty_code%TYPE,
  p_cpy_nac_code IN customer_promotion_types.cpy_nac_code%TYPE,
  p_cpy_rec      OUT NOCOPY customer_promotion_types%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION GET_FULL_FUNC(
  p_cpy_pty_code IN customer_promotion_types.cpy_pty_code%TYPE,
  p_cpy_qty_code IN customer_promotion_types.cpy_qty_code%TYPE,
  p_cpy_rec      OUT NOCOPY customer_promotion_types%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION GET_FULL_FUNC(
  p_cpy_pty_code IN customer_promotion_types.cpy_pty_code%TYPE,
  p_cpy_cgr_code IN customer_promotion_types.cpy_cgr_code%TYPE,
  p_cpy_rec      OUT NOCOPY customer_promotion_types%ROWTYPE
)
RETURN BOOLEAN;

PROCEDURE DELETE_CUSTOMER_GROUP_PROC(
  p_cpy_pty_code IN customer_promotion_types.cpy_pty_code%TYPE
);

PROCEDURE DELETE_PROC(
  p_cpy_pty_code IN customer_promotion_types.cpy_pty_code%TYPE,
  p_cpy_cgr_code IN customer_promotion_types.cpy_cgr_code%TYPE
);

FUNCTION GET_APPROPRIATE_TYPE_FUNC(
  p_pty_code IN promotion_types.pty_code%TYPE,
  p_cus_code IN customers.cus_code%TYPE
)
RETURN NUMBER;

FUNCTION GET_APPROPRIATE_PREBOOK_FUNC(
  p_pty_code IN promotion_types.pty_code%TYPE,
  p_cus_code IN customers.cus_code%TYPE
)
RETURN NUMBER;

FUNCTION GET_PREBOOK_METHOD_FUNC(
  p_cpy_id IN customer_promotion_types.cpy_id%TYPE
)
RETURN VARCHAR2;

FUNCTION IS_PREBOOK_FUNC(
  p_pty_code IN promotion_types.pty_code%TYPE,
  p_cus_code IN customers.cus_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE GET_SELECTED_INFO_PROC(
  p_pty_code            IN  NUMBER,
  p_value               IN  NUMBER,
  p_source              IN  VARCHAR2,
  p_decline_method      OUT NUMBER,
  p_promotion_as_credit OUT NUMBER
);

PROCEDURE SET_NUMBER_COLUMN_PROC(
  p_set_column     IN VARCHAR2,
  p_set_value      IN NUMBER,
  p_where_alias    IN VARCHAR,
  p_where_value    IN NUMBER,
  p_not_null_alias IN VARCHAR2
);

FUNCTION IS_SELECTABLE_FUNC(
  p_where_alias     IN VARCHAR,
  p_where_value     IN NUMBER,
  p_not_null_alias  IN VARCHAR2,
  p_checkbox_column IN VARCHAR2
)
RETURN BOOLEAN;

FUNCTION IS_VALID_FOR_QUOTATION_FUNC(
  p_cpy_pty_code     IN customer_promotion_types.cpy_pty_code%TYPE,
  p_qth_cus_code     IN quotation_headers.qth_cus_code%TYPE,
  p_qth_qty_code     IN quotation_headers.qth_qty_code%TYPE,
  p_qth_naz_nac_code IN quotation_headers.qth_naz_nac_code%TYPE
)
RETURN BOOLEAN;

END CPY_OPERATION_PACK;
/