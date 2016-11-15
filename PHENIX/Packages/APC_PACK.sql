CREATE OR REPLACE PACKAGE phenix.APC_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  alternate_product_codes%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_apc_code                       IN         alternate_product_codes.apc_code%TYPE,
  p_apc_prd_code                   IN         alternate_product_codes.apc_prd_code%TYPE,
  p_apc_rec                        OUT NOCOPY alternate_product_codes%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_apc_code                       IN         alternate_product_codes.apc_code%TYPE,
  p_apc_prd_code                   IN         alternate_product_codes.apc_prd_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_apc_code                       IN         alternate_product_codes.apc_code%TYPE,
  p_apc_prd_code                   IN         alternate_product_codes.apc_prd_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_apc_code                       IN         alternate_product_codes.apc_code%TYPE,
  p_apc_prd_code                   IN         alternate_product_codes.apc_prd_code%TYPE);


PROCEDURE INSERT_PROC(
  p_apc_code             IN         alternate_product_codes.apc_code%TYPE,
  p_apc_prd_code         IN         alternate_product_codes.apc_prd_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY alternate_product_codes%ROWTYPE);

FUNCTION INSERT_APC_FUNC(
  p_apc_code     IN alternate_product_codes.apc_code%TYPE,
  p_apc_prd_code IN alternate_product_codes.apc_prd_code%TYPE
)
RETURN PLS_INTEGER;

--Supprime le code alternatif correspondant aux paramètres envoyés
FUNCTION DELETE_APC_FUNC(
  p_apc_code     IN VARCHAR2,
  p_apc_prd_code IN VARCHAR2
)
RETURN PLS_INTEGER;

END APC_PACK;
/