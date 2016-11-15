CREATE OR REPLACE PACKAGE phenix.TPA_OPERATION_PACK IS

FUNCTION CREATE_TPA_FUNC(
  p_whs_picking_code        IN VARCHAR2,
  p_whs_delivery_code       IN VARCHAR2,
  p_route_date              IN DATE,        --sera null pour les transits
  p_rou_code                IN NUMBER,      --sera null pour les transits
  p_sid_id                  IN NUMBER,
  p_language                IN VARCHAR2,
  p_error_message           OUT VARCHAR2
)
RETURN BOOLEAN;

FUNCTION APPLY_MODEL_ON_ROUTE_FUNC(
  p_sid_id                      IN NUMBER,
  p_rou_code                    IN NUMBER,      --sera null pour les transits
  p_language                    IN VARCHAR2,
  p_error_code                  OUT NUMBER,
  p_error_message               OUT VARCHAR2,
  p_called_by_all_route_switch  IN NUMBER DEFAULT 0
)
RETURN BOOLEAN;

--appliquer les règles de palettisation sur les missions sélectionnés
--fonction utilisé par "wms_pallet_creation.fmb"
FUNCTION APPLY_MODEL_ON_ALL_ROUTE_FUNC(
  p_sid_id                  IN NUMBER,
  p_language                IN VARCHAR2,
  p_error_message           OUT VARCHAR2
)
RETURN BOOLEAN;

FUNCTION GENERATE_PALLETS_FROM_TPA_FUNC(
  p_sid_id                  IN NUMBER,
  p_language                IN VARCHAR2,
  p_error_message           OUT VARCHAR2
)
RETURN BOOLEAN;

FUNCTION DELETE_ALL_TPA_FOR_WHS_FUNC(
	p_tpa_whs_picking_code  IN temporary_pallets.tpa_whs_picking_code%TYPE,
	p_tpa_whs_delivery_code IN temporary_pallets.tpa_whs_delivery_code%TYPE,
	p_tpa_route_date				IN temporary_pallets.tpa_route_date%TYPE,
	p_tpa_rou_code          IN temporary_pallets.tpa_rou_code%TYPE,
	p_language							IN VARCHAR2,
	p_error_message 				OUT VARCHAR2
)
RETURN BOOLEAN;

FUNCTION DELETE_ALL_TPA_FOR_SID_FUNC(
	p_tpa_sid_id          	IN temporary_pallets.tpa_sid_id%TYPE,			--sera vide pour les transits
	p_language							IN VARCHAR2,
	p_error_message 				OUT VARCHAR2
)
RETURN BOOLEAN;

FUNCTION SELECT_MANUAL_FUNC(
  p_tpa_temp_pallet_id  IN temporary_pallets.tpa_temp_pallet_id%TYPE,
  p_tpa_sid_id          IN temporary_pallets.tpa_sid_id%TYPE,
  p_tpa_route_date      IN temporary_pallets.tpa_route_date%TYPE
)
RETURN NUMBER;

PROCEDURE UNSELECT_MANUAL_PROC(
  p_tpa_sid_id IN temporary_pallets.tpa_sid_id%TYPE
);

PROCEDURE SET_MANUAL_PROC(
  p_tpa_temp_pallet_id  IN temporary_pallets.tpa_temp_pallet_id%TYPE,
  p_tpa_sid_id          IN temporary_pallets.tpa_sid_id%TYPE,
  p_tpa_pmh_id          IN temporary_pallets.tpa_pmh_id%TYPE,
  p_tpa_route_date      IN temporary_pallets.tpa_route_date%TYPE,
  p_manual_pallet_id    IN temporary_pallets.tpa_temp_pallet_id%TYPE
);

FUNCTION GET_MANUAL_PALLET_ID(
  p_tpa_sid_id     IN temporary_pallets.tpa_sid_id%TYPE,
  p_tpa_route_date IN temporary_pallets.tpa_route_date%TYPE
)
RETURN NUMBER;

END TPA_OPERATION_PACK;
/