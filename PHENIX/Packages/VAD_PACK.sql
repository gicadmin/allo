CREATE OR REPLACE PACKAGE phenix.VAD_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_addresses%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vad_ven_code                   IN         vendor_addresses.vad_ven_code%TYPE,
  p_vad_address_type               IN         vendor_addresses.vad_address_type%TYPE,
  p_vad_rec                        OUT NOCOPY vendor_addresses%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vad_ven_code                   IN         vendor_addresses.vad_ven_code%TYPE,
  p_vad_address_type               IN         vendor_addresses.vad_address_type%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vad_ven_code                   IN         vendor_addresses.vad_ven_code%TYPE,
  p_vad_address_type               IN         vendor_addresses.vad_address_type%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vad_ven_code                   IN         vendor_addresses.vad_ven_code%TYPE,
  p_vad_address_type               IN         vendor_addresses.vad_address_type%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vad_ven_code                   IN         vendor_addresses.vad_ven_code%TYPE,
  p_vad_address_type               IN         vendor_addresses.vad_address_type%TYPE);


PROCEDURE INSERT_PROC(
  p_vad_ven_code         IN         vendor_addresses.vad_ven_code%TYPE,
  p_vad_address_type     IN         vendor_addresses.vad_address_type%TYPE,
  p_vad_prv_code         IN         vendor_addresses.vad_prv_code%TYPE,
  p_vad_address          IN         vendor_addresses.vad_address%TYPE,
  p_vad_city             IN         vendor_addresses.vad_city%TYPE,
  p_vad_postal_code      IN         vendor_addresses.vad_postal_code%TYPE,
  p_vad_telephone        IN         vendor_addresses.vad_telephone%TYPE,
  p_vad_extension        IN         vendor_addresses.vad_extension%TYPE             DEFAULT NULL,
  p_vad_fax_number       IN         vendor_addresses.vad_fax_number%TYPE            DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_addresses%ROWTYPE);

END VAD_PACK;
/