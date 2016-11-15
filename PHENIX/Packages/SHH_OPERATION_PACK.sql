CREATE OR REPLACE PACKAGE phenix.SHH_OPERATION_PACK IS

--fonction qui crée les SHIPMENT_HEADERS
FUNCTION OPEN_TRUCK_FUNC(
  p_shh_date              IN      DATE,
  p_shh_load_window       IN      NUMBER,
  p_shh_car_code          IN      NUMBER,
  p_shh_trailer_number    IN      VARCHAR2,
  p_shh_loc_code          IN      VARCHAR2,
  p_shh_cus_code          IN      NUMBER,
  p_shh_ven_code          IN      NUMBER,
  p_shh_temperature       IN      NUMBER,
  p_shh_reference_number  IN      VARCHAR2,
  p_shh_id                OUT     NUMBER
)
RETURN PLS_INTEGER;

--fonction qui termine le chargement de le remorque
FUNCTION CLOSE_TRUCK_FUNC (
  p_shh_load_window     IN NUMBER,
  p_shh_loc_code        IN VARCHAR2,
  p_shh_cus_code        IN NUMBER,
  p_shh_ven_code        IN NUMBER,
  p_language_flag       IN VARCHAR2,	--CSC3429
  p_vocal_switch        IN NUMBER,  	--CSC3429
  p_ccr_code 		       	OUT NUMBER,
  p_ccr_message         OUT VARCHAR2, 	--CSC3429
  p_prn_id							IN	VARCHAR2 DEFAULT NULL --CSC4619 si l'imprimante est sélectionnée le rapport va sortir sur cette derniére sinon l'imprimante par défaut
)
RETURN PLS_INTEGER;

PROCEDURE PURGE_PROC(
    p_nb_days_to_keep               IN NUMBER,
    p_max_items                     IN NUMBER
);

END SHH_OPERATION_PACK;
/