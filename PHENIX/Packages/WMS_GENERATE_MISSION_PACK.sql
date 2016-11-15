CREATE OR REPLACE PACKAGE phenix.WMS_GENERATE_MISSION_PACK IS

-- Procédure qui génère les missions de cueillette
PROCEDURE GENERATE_PICK_MISSION_PROC(
  p_jsc_id  IN  NUMBER
);

FUNCTION GEN_DAMAGE_MISSION_FUNC(   --cvi288 changer en fonction
  p_vph_id  IN  NUMBER
)
RETURN PLS_INTEGER;

FUNCTION GEN_LIQUIDATION_MISSION_FUNC(
  p_nbr_pmh_id               OUT NUMBER,
  p_nbr_pmd_id               OUT NUMBER,
  p_nbr_short_pmh_id         OUT NUMBER,
  p_nbr_short_pmd_id         OUT NUMBER,
  p_nbr_pmh_id_ready_to_wave OUT NUMBER
)
RETURN PLS_INTEGER;

END WMS_GENERATE_MISSION_PACK;
/