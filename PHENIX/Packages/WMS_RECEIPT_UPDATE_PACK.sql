CREATE OR REPLACE PACKAGE phenix.WMS_RECEIPT_UPDATE_PACK IS

--------------------------------------------------------------------------------

FUNCTION CREATE_RTH_FUNC(
  p_rth_type               IN          VARCHAR2,
  p_rth_id                 OUT NOCOPY  NUMBER,
  p_rth_truck_temperature  IN          NUMBER DEFAULT NULL,  --CSC3001
  p_rth_tkc_code           IN          receipt_transaction_headers.rth_tkc_code%TYPE,
  p_use_code               IN          NUMBER                --BER1427
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION DELETE_RTH_FUNC(
  p_rth_id IN NUMBER
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION UNASSIGN_RCH_FUNC (
  p_rch_ven_code  IN  NUMBER,
  p_rch_number    IN  VARCHAR2,
  p_rch_source    IN  VARCHAR2
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION UPDATE_RCH_WITH_RTH_FUNC(
  p_rch_ven_code  IN  NUMBER,
  p_rch_number    IN  VARCHAR2,
  p_rch_source    IN  VARCHAR2,
  p_rth_id        IN  NUMBER
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION CREATE_RCU_FUNC (
  p_rcu_use_code  IN  NUMBER,
  p_rcu_rth_id    IN  NUMBER
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION DELETE_RCU_FUNC (
  p_rcu_use_code   IN   NUMBER,
  p_rcu_rth_id     IN   NUMBER
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION UPDATE_RCH_STATUS_FUNC (
  p_rch_ven_code   IN   NUMBER,
  p_rch_number     IN   VARCHAR2,
  p_rch_source     IN   VARCHAR2,
  p_rch_status     IN   VARCHAR2
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION UPDATE_RCH_STATUS_FUNC (
  p_rth_id       IN   NUMBER,
  p_rch_status   IN   VARCHAR2
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION CLOSE_RCH_FUNC (
  p_rch_ven_code   IN   NUMBER,
  p_rch_number     IN   VARCHAR2,
  p_rch_source     IN   VARCHAR2,
  p_use_code       IN   NUMBER                                   --GIC1848
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION CLOSE_RCH_FUNC (
  p_rth_id   IN  NUMBER
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION GET_RTD_ORIGINAL_QTY_WGHT_FUNC (
  p_rtd_rth_id              IN              NUMBER,
  p_rtd_prf_prd_code        IN              VARCHAR2,
  p_rtd_prf_fmt_code        IN              VARCHAR2,
  p_rtd_original_quantity   OUT NOCOPY      NUMBER,
  p_rtd_original_weight     OUT NOCOPY      NUMBER
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION GET_RTD_RCVED_QTY_WGHT_FUNC (
  p_rtd_rth_id                   IN              NUMBER,
  p_rtd_prf_prd_code             IN              VARCHAR2,
  p_rtd_prf_fmt_code             IN              VARCHAR2,
  p_rtd_rcved_to_date_quantity   OUT NOCOPY      NUMBER,
  p_rtd_rcved_to_date_weight     OUT NOCOPY      NUMBER
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION CREATE_RTD_FUNC (
  p_rtd_rth_id              IN  NUMBER,
  p_rtd_prf_prd_code        IN  VARCHAR2,
  p_rtd_prf_fmt_code        IN  VARCHAR2,
  p_rtd_received_quantity   IN  NUMBER,
  p_rtd_received_weight     IN  NUMBER,
  p_rtd_use_code            IN  NUMBER,
  p_rtd_loc_code            IN  VARCHAR2,
  p_rtd_start_date          IN  DATE,
  p_rtd_end_date            IN  DATE,
  p_rtd_expiry_date         IN  DATE,
  p_rtd_number_of_stickers  IN  NUMBER,
  p_rtd_ide_id              IN  NUMBER DEFAULT NULL, --CSC2799
  p_rtd_dmr_code            IN  NUMBER DEFAULT NULL--CSC3441
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION UPDATE_RCD_FUNC (
  p_rtd_rth_id              IN   NUMBER,
  p_rtd_prf_prd_code        IN   VARCHAR2,
  p_rtd_prf_fmt_code        IN   VARCHAR2,
  p_rcd_received_quantity   IN   NUMBER,
  p_rcd_received_weight     IN   NUMBER
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------
END WMS_RECEIPT_UPDATE_PACK;
/