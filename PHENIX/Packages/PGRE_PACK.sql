CREATE OR REPLACE PACKAGE phenix.PGRE_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  product_group_exceptions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pgre_id                        IN         product_group_exceptions.pgre_id%TYPE,
  p_pgre_rec                       OUT NOCOPY product_group_exceptions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pgre_id                        IN         product_group_exceptions.pgre_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_pgre_id                        IN         product_group_exceptions.pgre_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pgre_id                        IN         product_group_exceptions.pgre_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_pgre_pgr_code                  IN         product_group_exceptions.pgre_pgr_code%TYPE,
  p_pgre_cus_code                  IN         product_group_exceptions.pgre_cus_code%TYPE,
  p_pgre_cgr_code                  IN         product_group_exceptions.pgre_cgr_code%TYPE,
  p_pgre_qty_code                  IN         product_group_exceptions.pgre_qty_code%TYPE,
  p_pgre_pug_code                  IN         product_group_exceptions.pgre_pug_code%TYPE,
  p_pgre_rec                       OUT NOCOPY product_group_exceptions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pgre_pgr_code                  IN         product_group_exceptions.pgre_pgr_code%TYPE,
  p_pgre_cus_code                  IN         product_group_exceptions.pgre_cus_code%TYPE,
  p_pgre_cgr_code                  IN         product_group_exceptions.pgre_cgr_code%TYPE,
  p_pgre_qty_code                  IN         product_group_exceptions.pgre_qty_code%TYPE,
  p_pgre_pug_code                  IN         product_group_exceptions.pgre_pug_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_pgre_pgr_code                  IN         product_group_exceptions.pgre_pgr_code%TYPE,
  p_pgre_cus_code                  IN         product_group_exceptions.pgre_cus_code%TYPE,
  p_pgre_cgr_code                  IN         product_group_exceptions.pgre_cgr_code%TYPE,
  p_pgre_qty_code                  IN         product_group_exceptions.pgre_qty_code%TYPE,
  p_pgre_pug_code                  IN         product_group_exceptions.pgre_pug_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pgre_pgr_code                  IN         product_group_exceptions.pgre_pgr_code%TYPE,
  p_pgre_cus_code                  IN         product_group_exceptions.pgre_cus_code%TYPE,
  p_pgre_cgr_code                  IN         product_group_exceptions.pgre_cgr_code%TYPE,
  p_pgre_qty_code                  IN         product_group_exceptions.pgre_qty_code%TYPE,
  p_pgre_pug_code                  IN         product_group_exceptions.pgre_pug_code%TYPE);


FUNCTION INSERT_FUNC(
  p_pgre_pgr_code                  IN         product_group_exceptions.pgre_pgr_code%TYPE,
  p_pgre_cus_code                  IN         product_group_exceptions.pgre_cus_code%TYPE                       DEFAULT NULL,
  p_pgre_qty_code                  IN         product_group_exceptions.pgre_qty_code%TYPE                       DEFAULT NULL,
  p_pgre_cgr_code                  IN         product_group_exceptions.pgre_cgr_code%TYPE                       DEFAULT NULL,
  p_pgre_pug_code                  IN         product_group_exceptions.pgre_pug_code%TYPE                       DEFAULT NULL,
  p_pgre_maximum_profit_percent    IN         product_group_exceptions.pgre_maximum_profit_percent%TYPE         DEFAULT NULL,
  p_pgre_minimum_profit_percent    IN         product_group_exceptions.pgre_minimum_profit_percent%TYPE         DEFAULT NULL,
  p_pgre_min_telemark_prof_perce   IN         product_group_exceptions.pgre_min_telemark_prof_percent%TYPE      DEFAULT NULL,
  p_pgre_max_telemark_prof_perce   IN         product_group_exceptions.pgre_max_telemark_prof_percent%TYPE      DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY product_group_exceptions%ROWTYPE)
RETURN NUMBER;

END PGRE_PACK;
/