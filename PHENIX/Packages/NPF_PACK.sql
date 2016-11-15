CREATE OR REPLACE PACKAGE phenix.NPF_PACK IS

FUNCTION GET_FULL_NPF_FUNC(
	p_npf_nac_code 		 IN nac_product_formats.npf_nac_code%TYPE,
  p_npf_prf_prd_code IN nac_product_formats.npf_prf_prd_code%TYPE,
  p_npf_prf_fmt_code IN nac_product_formats.npf_prf_fmt_code%TYPE,
	p_npf_record	     OUT nac_product_formats%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_NPF_FUNC(
	p_npf_nac_code 		 IN nac_product_formats.npf_nac_code%TYPE,
  p_npf_prf_prd_code IN nac_product_formats.npf_prf_prd_code%TYPE,
  p_npf_prf_fmt_code IN nac_product_formats.npf_prf_fmt_code%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_COLUMN_VALUE_VARCHAR_FUNC(
	p_column_name 		 IN VARCHAR2,
	p_npf_nac_code 		 IN nac_product_formats.npf_nac_code%TYPE,
  p_npf_prf_prd_code IN nac_product_formats.npf_prf_prd_code%TYPE,
  p_npf_prf_fmt_code IN nac_product_formats.npf_prf_fmt_code%TYPE
)
RETURN VARCHAR2;

FUNCTION FIND_COLUMN_VALUE_NUMBER_FUNC(
	p_column_name 		 IN VARCHAR2,
	p_npf_nac_code 		 IN nac_product_formats.npf_nac_code%TYPE,
  p_npf_prf_prd_code IN nac_product_formats.npf_prf_prd_code%TYPE,
  p_npf_prf_fmt_code IN nac_product_formats.npf_prf_fmt_code%TYPE
)
RETURN NUMBER;

FUNCTION DO_NPF_EXISTS_FOR_NCH_FUNC(
  p_npf_nch_id IN nac_product_formats.npf_nch_id%TYPE
)
RETURN BOOLEAN;

END NPF_PACK;
/