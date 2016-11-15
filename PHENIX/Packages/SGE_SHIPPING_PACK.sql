CREATE OR REPLACE PACKAGE phenix.SGE_SHIPPING_PACK IS

PROCEDURE TRANSFER_PALLET_PROC(
  p_pco_from IN pallet_consolidations.pco_id%TYPE,
  p_pco_to   IN pallet_consolidations.pco_id%TYPE
);

FUNCTION FIND_ROU_DATE_FUNC(
  p_rou_code IN routes.rou_code%TYPE
) RETURN DATE;

PROCEDURE PRINT_LOADED_TRUCK_PROC(
  p_rsh_id   IN NUMBER,
  p_use_code IN NUMBER,
  p_prn_id   IN NUMBER,
  p_whs_code IN VARCHAR2,
  p_language IN VARCHAR2 DEFAULT 'FR'
);

PROCEDURE PRINT_LOADING_TRANSPORT_PROC(
  p_rsh_id    IN NUMBER,
  p_use_code  IN NUMBER,
  p_prn_id    IN NUMBER,
  p_whs_code  IN VARCHAR2,
  p_language  IN VARCHAR2 DEFAULT 'FR'
);

PROCEDURE PRINT_TRANSPORT_PALLET_PROC(
  p_pco_id   IN NUMBER,
  p_use_code IN NUMBER,
  p_prn_id   IN NUMBER,
  p_whs_code IN VARCHAR2,
  p_language IN VARCHAR2 DEFAULT 'FR'
);

PROCEDURE UPDATE_RSH_TKC_CODE_PROC(
  p_rsh_id       IN route_shipments.rsh_id%TYPE,
  p_rsh_tkc_code IN route_shipments.rsh_tkc_code%TYPE
);

FUNCTION INSERT_RSC_FUNC(
  p_rsc_rsh_id            IN route_shipment_conditions.rsc_rsh_id%TYPE,
  p_rsc_whc_code          IN route_shipment_conditions.rsc_whc_code%TYPE,
  p_rsc_truck_temperature IN route_shipment_conditions.rsc_truck_temperature%TYPE)
RETURN NUMBER;

END SGE_SHIPPING_PACK;
/