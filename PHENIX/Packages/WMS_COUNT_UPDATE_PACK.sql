CREATE OR REPLACE PACKAGE phenix.WMS_COUNT_UPDATE_PACK IS

--------------------------------------------------------------------------------

FUNCTION DELETE_OIC_FUNC (
  p_oic_id   IN  NUMBER
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION GET_IAT_FUNC (
  p_iat_code   IN              NUMBER,
  p_iat_rec    OUT NOCOPY      inventory_adjustment_types%ROWTYPE
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION CREATE_ICT_FUNC(
  p_ict_prf_prd_code       IN   VARCHAR2,
  p_ict_prf_fmt_code       IN   VARCHAR2,
  p_ict_original_quantity  IN   NUMBER,
  p_ict_count_quantity     IN   NUMBER,
  p_ict_original_weight    IN   NUMBER,
  p_ict_count_weight       IN   NUMBER,
  p_ict_use_code           IN   NUMBER,
  p_ict_loc_code           IN   VARCHAR2,
  p_ict_start_date         IN   DATE,
  p_ict_end_date           IN   DATE,
  p_ict_fifo_date          IN   DATE, -- GIC3396
  p_ict_expiry_date        IN   DATE,
  p_ict_cah_id             IN   NUMBER,
  p_adjustment_flag        IN   VARCHAR2 DEFAULT 'A',   -- "I" = Inventaire, "E" = Aucun écart, "A" = Autres
  p_ict_iat_code           IN   NUMBER,
  p_ict_ide_id             IN   NUMBER,                 --CSC3162
  p_ict_id                 OUT  NOCOPY NUMBER,
  p_ict_type               IN   VARCHAR2,               --CSC3257
  p_ict_adj_comment        IN   VARCHAR2,               --GIC2369
  p_ict_dmr_code           IN   NUMBER DEFAULT NULL,    --CSC3441
  p_ict_trh_id             IN   NUMBER DEFAULT NULL     --BER1486
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

FUNCTION GET_NEXT_COUNT_LOC_FUNC (
  p_loc_code          IN VARCHAR2,
  p_next_oic_id       OUT NOCOPY NUMBER,
  p_next_loc_code     OUT NOCOPY VARCHAR2,
  p_next_oic_prd_code OUT NOCOPY VARCHAR2
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

END WMS_COUNT_UPDATE_PACK;
/