CREATE OR REPLACE PACKAGE phenix.NAZ_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  national_account_zones%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_naz_nac_code                   IN         national_account_zones.naz_nac_code%TYPE,
  p_naz_zone_code                  IN         national_account_zones.naz_zone_code%TYPE,
  p_naz_rec                        OUT NOCOPY national_account_zones%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_naz_nac_code                   IN         national_account_zones.naz_nac_code%TYPE,
  p_naz_zone_code                  IN         national_account_zones.naz_zone_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_naz_nac_code                   IN         national_account_zones.naz_nac_code%TYPE,
  p_naz_zone_code                  IN         national_account_zones.naz_zone_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_naz_nac_code                   IN         national_account_zones.naz_nac_code%TYPE,
  p_naz_zone_code                  IN         national_account_zones.naz_zone_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_naz_nac_code                   IN         national_account_zones.naz_nac_code%TYPE,
  p_naz_zone_code                  IN         national_account_zones.naz_zone_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_naz_nac_code                   IN         national_account_zones.naz_nac_code%TYPE,
  p_naz_zone_code                  IN         national_account_zones.naz_zone_code%TYPE);


PROCEDURE INSERT_PROC(
  p_naz_nac_code           IN         national_account_zones.naz_nac_code%TYPE,
  p_naz_zone_code          IN         national_account_zones.naz_zone_code%TYPE,
  p_naz_description        IN         national_account_zones.naz_description%TYPE,
  p_naz_prv_code           IN         national_account_zones.naz_prv_code%TYPE,
  p_naz_srt_code           IN         national_account_zones.naz_srt_code%TYPE,
  p_naz_alt_description    IN         national_account_zones.naz_alt_description%TYPE         DEFAULT NULL,
  p_naz_synchronization_id IN         national_account_zones.naz_synchronization_id%TYPE      DEFAULT NULL,
  p_naz_unique_index       IN         national_account_zones.naz_unique_index%TYPE            DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY national_account_zones%ROWTYPE);

END NAZ_PACK;
/