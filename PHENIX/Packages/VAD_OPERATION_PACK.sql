CREATE OR REPLACE PACKAGE phenix.VAD_OPERATION_PACK IS

PROCEDURE FIND_VAD_INFO_PROC(
  p_ven_code        IN vendor_addresses.vad_ven_code%TYPE,
  p_vad_type        IN vendor_addresses.vad_address_type%TYPE,
  p_vad_prv_code    OUT vendor_addresses.vad_prv_code%TYPE,
  p_vad_address     OUT vendor_addresses.vad_address%TYPE,
  p_vad_city        OUT vendor_addresses.vad_city%TYPE,
  p_vad_postal_code OUT vendor_addresses.vad_postal_code%TYPE,
  p_vad_telephone   OUT vendor_addresses.vad_telephone%TYPE,
  p_vad_extension   OUT vendor_addresses.vad_extension%TYPE,
  p_vad_fax_number  OUT vendor_addresses.vad_fax_number%TYPE
);

--fonction servant à trouver la province d'un fournisseur (selon le type d'adresse demandé)
FUNCTION FIND_VAD_PRV_ONLY_FUNC(
  p_ven_code        IN vendor_addresses.vad_ven_code%TYPE,
  p_vad_type        IN vendor_addresses.vad_address_type%TYPE
)
RETURN VARCHAR2;    --retourne un code de province

--fonction servant à trouver la province d'un fournisseur (selon le type d'adresse demandé)
FUNCTION FIND_VAD_TYPE_FUNC(
  p_ven_code        IN vendor_addresses.vad_ven_code%TYPE
)
RETURN VARCHAR2;    --retourne le type d'adresse

PROCEDURE UPDATE_VAD_PROC(
  p_vad_ven_code       IN  vendor_addresses.vad_ven_code%TYPE,
  p_vad_address_type   IN  vendor_addresses.vad_address_type%TYPE,
  p_vad_prv_code       IN  vendor_addresses.vad_prv_code%TYPE,
  p_vad_address        IN  vendor_addresses.vad_address%TYPE,
  p_vad_city           IN  vendor_addresses.vad_city%TYPE,
  p_vad_postal_code    IN  vendor_addresses.vad_postal_code%TYPE,
  p_vad_telephone      IN  vendor_addresses.vad_telephone%TYPE,
  p_vad_extension      IN  vendor_addresses.vad_extension%TYPE    DEFAULT NULL,
  p_vad_fax_number     IN  vendor_addresses.vad_fax_number%TYPE   DEFAULT NULL
);

FUNCTION GET_FULL_INFO_ORDER_TYPE_FUNC(
  p_ven_code     IN vendor_addresses.vad_ven_code%TYPE,
  p_add_type_1   IN vendor_addresses.vad_address_type%TYPE,
  p_add_type_2   IN vendor_addresses.vad_address_type%TYPE,
  p_add_type_3   IN vendor_addresses.vad_address_type%TYPE,
  p_vad_record  OUT vendor_addresses%ROWTYPE
)
RETURN BOOLEAN;

PROCEDURE PURGE_PROC(
  p_vad_ven_code IN vendor_addresses.vad_ven_code%TYPE
);

END VAD_OPERATION_PACK;
/