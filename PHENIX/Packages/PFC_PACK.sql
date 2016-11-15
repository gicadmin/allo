CREATE OR REPLACE PACKAGE phenix.PFC_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  product_food_certifications%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pfc_fcr_fcg_code               IN         product_food_certifications.pfc_fcr_fcg_code%TYPE,
  p_pfc_prd_code                   IN         product_food_certifications.pfc_prd_code%TYPE,
  p_pfc_fcr_code                   IN         product_food_certifications.pfc_fcr_code%TYPE,
  p_pfc_rec                        OUT NOCOPY product_food_certifications%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pfc_fcr_fcg_code               IN         product_food_certifications.pfc_fcr_fcg_code%TYPE,
  p_pfc_prd_code                   IN         product_food_certifications.pfc_prd_code%TYPE,
  p_pfc_fcr_code                   IN         product_food_certifications.pfc_fcr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pfc_fcr_fcg_code               IN         product_food_certifications.pfc_fcr_fcg_code%TYPE,
  p_pfc_prd_code                   IN         product_food_certifications.pfc_prd_code%TYPE,
  p_pfc_fcr_code                   IN         product_food_certifications.pfc_fcr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pfc_fcr_fcg_code               IN         product_food_certifications.pfc_fcr_fcg_code%TYPE,
  p_pfc_prd_code                   IN         product_food_certifications.pfc_prd_code%TYPE,
  p_pfc_fcr_code                   IN         product_food_certifications.pfc_fcr_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pfc_fcr_fcg_code               IN         product_food_certifications.pfc_fcr_fcg_code%TYPE,
  p_pfc_prd_code                   IN         product_food_certifications.pfc_prd_code%TYPE,
  p_pfc_fcr_code                   IN         product_food_certifications.pfc_fcr_code%TYPE);


PROCEDURE INSERT_PROC(
  p_pfc_fcr_fcg_code     IN         product_food_certifications.pfc_fcr_fcg_code%TYPE,
  p_pfc_prd_code         IN         product_food_certifications.pfc_prd_code%TYPE,
  p_pfc_fcr_code         IN         product_food_certifications.pfc_fcr_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY product_food_certifications%ROWTYPE);

END PFC_PACK;
/