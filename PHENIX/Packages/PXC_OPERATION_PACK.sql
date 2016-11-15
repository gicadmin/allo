CREATE OR REPLACE PACKAGE phenix.PXC_OPERATION_PACK IS

FUNCTION GET_PRD_CODE_FUNC(
  p_cus_code IN customers.cus_code%TYPE,
  p_pxc_code IN product_xref_codes.pxc_code%TYPE
)
RETURN VARCHAR2;

PROCEDURE GET_PRD_AND_FMT_CODE_PROC(
  p_cus_code     IN customers.cus_code%TYPE,
  p_pxc_code     IN product_xref_codes.pxc_code%TYPE,
  p_pxc_prd_code OUT product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code OUT product_xref_codes.pxc_fmt_code%TYPE
);

PROCEDURE INSERT_PXC_PROC(
  p_pxc_xrg_code IN product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_prd_code IN product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code IN product_xref_codes.pxc_fmt_code%TYPE,
  p_pxc_code     IN product_xref_codes.pxc_code%TYPE
);

PROCEDURE UPDATE_PXC_PROC(
  p_pxc_xrg_code IN product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_prd_code IN product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code IN product_xref_codes.pxc_fmt_code%TYPE,
  p_pxc_code     IN product_xref_codes.pxc_code%TYPE
);

FUNCTION GET_FULL_FUNC(
  p_cus_code     IN customers.cus_code%TYPE,
  p_pxc_prd_code IN product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code IN product_xref_codes.pxc_fmt_code%TYPE,
  p_pxc_rec      OUT NOCOPY v_product_xref%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION GET_PXC_CODE_FUNC(
  p_cus_code     IN customers.cus_code%TYPE,
  p_pxc_prd_code IN product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code IN product_xref_codes.pxc_fmt_code%TYPE
)
RETURN VARCHAR2;

FUNCTION GET_XRG_PXC_FUNC(
  p_cus_code     IN customers.cus_code%TYPE,
  p_pxc_prd_code IN product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code IN product_xref_codes.pxc_fmt_code%TYPE,
  p_language     IN VARCHAR2 DEFAULT 'FR'
)
RETURN VARCHAR2;

FUNCTION GET_PXC_CODE_FUNC(
  p_pxc_xrg_code IN product_xref_codes.pxc_xrg_code%TYPE,
  p_pxc_prd_code IN product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code IN product_xref_codes.pxc_fmt_code%TYPE
)
RETURN VARCHAR2;

END PXC_OPERATION_PACK;
/