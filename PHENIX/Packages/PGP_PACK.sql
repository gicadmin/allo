CREATE OR REPLACE PACKAGE phenix.PGP_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  purchasing_group_products%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pgp_id                         IN         purchasing_group_products.pgp_id%TYPE,
  p_pgp_rec                        OUT NOCOPY purchasing_group_products%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pgp_id                         IN         purchasing_group_products.pgp_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pgp_id                         IN         purchasing_group_products.pgp_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pgp_id                         IN         purchasing_group_products.pgp_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pgp_id                         IN         purchasing_group_products.pgp_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pgp_id                         IN         purchasing_group_products.pgp_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_pgp_pug_code                   IN         purchasing_group_products.pgp_pug_code%TYPE,
  p_pgp_prd_code                   IN         purchasing_group_products.pgp_prd_code%TYPE,
  p_pgp_effective_date             IN         purchasing_group_products.pgp_effective_date%TYPE,
  p_pgp_rec                        OUT NOCOPY purchasing_group_products%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pgp_pug_code                   IN         purchasing_group_products.pgp_pug_code%TYPE,
  p_pgp_prd_code                   IN         purchasing_group_products.pgp_prd_code%TYPE,
  p_pgp_effective_date             IN         purchasing_group_products.pgp_effective_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pgp_pug_code                   IN         purchasing_group_products.pgp_pug_code%TYPE,
  p_pgp_prd_code                   IN         purchasing_group_products.pgp_prd_code%TYPE,
  p_pgp_effective_date             IN         purchasing_group_products.pgp_effective_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pgp_pug_code                   IN         purchasing_group_products.pgp_pug_code%TYPE,
  p_pgp_prd_code                   IN         purchasing_group_products.pgp_prd_code%TYPE,
  p_pgp_effective_date             IN         purchasing_group_products.pgp_effective_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pgp_pug_code                   IN         purchasing_group_products.pgp_pug_code%TYPE,
  p_pgp_prd_code                   IN         purchasing_group_products.pgp_prd_code%TYPE,
  p_pgp_effective_date             IN         purchasing_group_products.pgp_effective_date%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pgp_pug_code                   IN         purchasing_group_products.pgp_pug_code%TYPE,
  p_pgp_prd_code                   IN         purchasing_group_products.pgp_prd_code%TYPE,
  p_pgp_effective_date             IN         purchasing_group_products.pgp_effective_date%TYPE);


FUNCTION INSERT_FUNC(
  p_pgp_pug_code         IN         purchasing_group_products.pgp_pug_code%TYPE,
  p_pgp_prd_code         IN         purchasing_group_products.pgp_prd_code%TYPE,
  p_pgp_effective_date   IN         purchasing_group_products.pgp_effective_date%TYPE,
  p_pgp_base_cost        IN         purchasing_group_products.pgp_base_cost%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY purchasing_group_products%ROWTYPE)
RETURN NUMBER;

END PGP_PACK;
/