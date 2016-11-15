CREATE OR REPLACE PACKAGE phenix.PIP_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  proposed_interco_products%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pip_id                         IN         proposed_interco_products.pip_id%TYPE,
  p_pip_rec                        OUT NOCOPY proposed_interco_products%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pip_id                         IN         proposed_interco_products.pip_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pip_id                         IN         proposed_interco_products.pip_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pip_id                         IN         proposed_interco_products.pip_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pip_id                         IN         proposed_interco_products.pip_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pip_id                         IN         proposed_interco_products.pip_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pip_whs_code           IN         proposed_interco_products.pip_whs_code%TYPE,
  p_pip_prf_prd_code       IN         proposed_interco_products.pip_prf_prd_code%TYPE,
  p_pip_prf_fmt_code       IN         proposed_interco_products.pip_prf_fmt_code%TYPE,
  p_pip_priority_code      IN         proposed_interco_products.pip_priority_code%TYPE,
  p_pip_creation_date      IN         proposed_interco_products.pip_creation_date%TYPE,
  p_pip_requested_quantity IN         proposed_interco_products.pip_requested_quantity%TYPE      DEFAULT NULL,
  p_pip_requested_weight   IN         proposed_interco_products.pip_requested_weight%TYPE        DEFAULT NULL,
  p_pip_shipped_quantity   IN         proposed_interco_products.pip_shipped_quantity%TYPE        DEFAULT NULL,
  p_pip_shipped_weight     IN         proposed_interco_products.pip_shipped_weight%TYPE          DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY proposed_interco_products%ROWTYPE)
RETURN NUMBER;

END PIP_PACK;
/