CREATE OR REPLACE PACKAGE phenix.WMS_REPLENISH_UPDATE_PACK IS


--------------------------------------------------------------------------------

--BER3820 procédure pour essayer de créer des réappros avec la quantité suggéré
PROCEDURE CREATE_PLANNED_REP_PROC(
  p_infos_rec               IN OUT  REP_INFO_PACK.T_INFOS_FOR_REPLENISH,
  p_nbr_replenishment       IN OUT NUMBER,
  p_rep_status              IN VARCHAR2 DEFAULT 'C',
  p_affect_real_rep_switch  IN NUMBER,   --BER5811
  p_real_rep_count          IN OUT  NUMBER   --ber5811
);

--------------------------------------------------------------------------------

-- Fonction qui génère les réapprovisionnements préventifs   (appelé par la forme wms generate replenishment)                                                                                       --
FUNCTION GENERATE_REPLENISHMENTS_FUNC (
  p_lty_whz_code            IN  location_types.lty_whz_code%TYPE,
  p_from_location           IN  locations.loc_code%TYPE,
  p_to_location             IN  locations.loc_code%TYPE,
  p_use_code                IN  NUMBER,
  p_max_replenishments      IN  NUMBER,
  p_whs_code                IN  VARCHAR2,     --BER1436
  p_available_capacity      IN  NUMBER,       --BER2564
  p_based_on_sales_switch   IN  NUMBER,        --BER3190
  p_check_inventory_switch  IN  NUMBER,        --BER3820
  p_affect_real_rep_switch  IN  NUMBER,        --BER5811
  p_qty_inv_max             IN  NUMBER,        --CSC8164
  p_real_rep_count          OUT  NUMBER        --BER5811
)
RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

-- Fonction utilisée pour créer les réapprovisionnements préventifs lorsqu'on utilise les identifiants (appelé par la forme wms generate replenishment)
FUNCTION IDE_GEN_REPLENISHMENTS_FUNC (
  p_lty_whz_code            IN  VARCHAR2,
  p_from_location           IN  VARCHAR2,
  p_to_location             IN  VARCHAR2,
  p_use_code						    IN  NUMBER,
  p_max_replenishments      IN  NUMBER,
  p_whs_code						    IN	VARCHAR2,			--BER1436
  p_available_capacity      IN  NUMBER,       --BER2564
  p_based_on_sales_switch   IN  NUMBER,        --BER3190
  p_check_inventory_switch  IN  NUMBER,        --BER3820
  p_qty_inv_max             IN  NUMBER        --CSC8164
)
 RETURN PLS_INTEGER;

--------------------------------------------------------------------------------

--	Fonction utilisée pour activer les réapprovisionnements d'un entrepôt	 (appelé par la forme wms generate replenishment)
FUNCTION ACTIVATE_REPLENISHMENTS_FUNC(
	p_whs_code	    IN	VARCHAR2,							--BER1436
  p_not_activated OUT NUMBER
)
RETURN PLS_INTEGER;

PROCEDURE GENERATE_AND_ACTIVATE_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

END WMS_REPLENISH_UPDATE_PACK;
/