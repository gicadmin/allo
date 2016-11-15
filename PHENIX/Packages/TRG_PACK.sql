CREATE OR REPLACE PACKAGE phenix.TRG_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  territory_groups%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_trg_id                         IN         territory_groups.trg_id%TYPE,
  p_trg_rec                        OUT NOCOPY territory_groups%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_trg_id                         IN         territory_groups.trg_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_trg_id                         IN         territory_groups.trg_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_trg_id                         IN         territory_groups.trg_id%TYPE)
RETURN NUMBER;

FUNCTION GET_FULL_FUNC(
  p_trg_trt_code                   IN         territory_groups.trg_trt_code%TYPE,
  p_trg_pgr_code                   IN         territory_groups.trg_pgr_code%TYPE,
  p_trg_rec                        OUT NOCOPY territory_groups%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_trg_trt_code                   IN         territory_groups.trg_trt_code%TYPE,
  p_trg_pgr_code                   IN         territory_groups.trg_pgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_trg_trt_code                   IN         territory_groups.trg_trt_code%TYPE,
  p_trg_pgr_code                   IN         territory_groups.trg_pgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_trg_trt_code                   IN         territory_groups.trg_trt_code%TYPE,
  p_trg_pgr_code                   IN         territory_groups.trg_pgr_code%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_trg_trt_code         IN         territory_groups.trg_trt_code%TYPE,
  p_trg_pgr_code         IN         territory_groups.trg_pgr_code%TYPE,
  p_trg_ar_sales         IN         territory_groups.trg_ar_sales%TYPE,
  p_trg_sales_cogs       IN         territory_groups.trg_sales_cogs%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY territory_groups%ROWTYPE)
RETURN NUMBER;

END TRG_PACK;
/