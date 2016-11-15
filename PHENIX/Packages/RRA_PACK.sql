CREATE OR REPLACE PACKAGE phenix.RRA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  release_and_retain_audits%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rra_id                         IN         release_and_retain_audits.rra_id%TYPE,
  p_rra_rec                        OUT NOCOPY release_and_retain_audits%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_rra_id                         IN         release_and_retain_audits.rra_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rra_id                         IN         release_and_retain_audits.rra_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rra_id                         IN         release_and_retain_audits.rra_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rra_id                         IN         release_and_retain_audits.rra_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rra_id                         IN         release_and_retain_audits.rra_id%TYPE);


FUNCTION INSERT_FUNC(
  p_rra_prf_prd_code     IN         release_and_retain_audits.rra_prf_prd_code%TYPE,
  p_rra_prf_fmt_code     IN         release_and_retain_audits.rra_prf_fmt_code%TYPE,
  p_rra_loc_code         IN         release_and_retain_audits.rra_loc_code%TYPE,
  p_rra_use_code         IN         release_and_retain_audits.rra_use_code%TYPE,
  p_rra_retain_switch    IN         release_and_retain_audits.rra_retain_switch%TYPE,
  p_rra_whs_code         IN         release_and_retain_audits.rra_whs_code%TYPE,
  p_rra_quantity         IN         release_and_retain_audits.rra_quantity%TYPE              DEFAULT NULL,
  p_rra_weight           IN         release_and_retain_audits.rra_weight%TYPE                DEFAULT NULL,
  p_rra_expiry_date      IN         release_and_retain_audits.rra_expiry_date%TYPE           DEFAULT NULL,
  p_rra_fifo_date        IN         release_and_retain_audits.rra_fifo_date%TYPE             DEFAULT NULL,
  p_rra_transaction_date IN         release_and_retain_audits.rra_transaction_date%TYPE      DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY release_and_retain_audits%ROWTYPE)
RETURN NUMBER;

END RRA_PACK;
/