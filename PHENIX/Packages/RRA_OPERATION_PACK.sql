CREATE OR REPLACE PACKAGE phenix.RRA_OPERATION_PACK AS

FUNCTION UPDT_RELEASE_RETAIN_AUDIT_FUNC (
  p_rra_prf_prd_code      IN          VARCHAR2,
  p_rra_prf_fmt_code      IN          VARCHAR2,
  p_rra_loc_code          IN          VARCHAR2,
  p_rra_use_code          IN          NUMBER,
  p_rra_quantity          IN          NUMBER,
  p_rra_weight            IN          NUMBER,
  p_rra_expiry_date       IN          DATE,
  p_rra_fifo_date         IN          DATE,   -- GIC3396
  p_rra_retain_switch     IN          NUMBER,
  p_rra_id                OUT NOCOPY  NUMBER,
  p_rra_transaction_date  IN          DATE DEFAULT SYSDATE
)
RETURN PLS_INTEGER;

PROCEDURE PURGE_PROC(
  p_rra_prf_prd_code IN release_and_retain_audits.rra_prf_prd_code%TYPE,
  p_rra_prf_fmt_code IN release_and_retain_audits.rra_prf_fmt_code%TYPE
);

END RRA_OPERATION_PACK;
/