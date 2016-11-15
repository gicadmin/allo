CREATE OR REPLACE PACKAGE phenix.SHA_OPERATION_PACK IS

--fonction qui crée les SHIPMENT_AUDITS
FUNCTION CREATE_SHIP_AUDIT_FUNC(
  p_sha_date              IN      DATE,
  p_sha_load_window       IN      NUMBER,
  p_sha_car_code          IN      NUMBER,
  p_sha_trailer_number    IN      VARCHAR2,
  p_sha_loc_code          IN      VARCHAR2,
  p_sha_cus_code          IN      NUMBER,
  p_sha_ven_code          IN      NUMBER,
  p_sha_container_id      IN      NUMBER,
  p_sha_container_suffix  IN      VARCHAR2,
  p_sha_use_code          IN      NUMBER,
  p_sha_load_unload_flag  IN      VARCHAR2,
  p_sha_reference_number  IN      VARCHAR2,   --CSC3221
  p_sha_pmh_id            IN      NUMBER,   --CSC3221
  p_sha_id                OUT     NUMBER,
  p_sha_actual_loc_code   IN      VARCHAR2   --CSC8347
)
RETURN PLS_INTEGER;

PROCEDURE PURGE_PROC(
  p_sha_ven_code IN shipment_audits.sha_ven_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_sha_cus_code IN shipment_audits.sha_cus_code%TYPE
);

END SHA_OPERATION_PACK;
/