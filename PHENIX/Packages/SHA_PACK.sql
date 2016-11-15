CREATE OR REPLACE PACKAGE phenix.SHA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  shipment_audits%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sha_id                         IN         shipment_audits.sha_id%TYPE,
  p_sha_rec                        OUT NOCOPY shipment_audits%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_sha_id                         IN         shipment_audits.sha_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sha_id                         IN         shipment_audits.sha_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sha_id                         IN         shipment_audits.sha_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sha_id                         IN         shipment_audits.sha_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sha_id                         IN         shipment_audits.sha_id%TYPE);


FUNCTION INSERT_FUNC(
  p_sha_date             IN         shipment_audits.sha_date%TYPE,
  p_sha_load_window      IN         shipment_audits.sha_load_window%TYPE,
  p_sha_car_code         IN         shipment_audits.sha_car_code%TYPE,
  p_sha_trailer_number   IN         shipment_audits.sha_trailer_number%TYPE,
  p_sha_loc_code         IN         shipment_audits.sha_loc_code%TYPE,
  p_sha_container_id     IN         shipment_audits.sha_container_id%TYPE,
  p_sha_use_code         IN         shipment_audits.sha_use_code%TYPE,
  p_sha_load_unload_flag IN         shipment_audits.sha_load_unload_flag%TYPE,
  p_sha_cus_code         IN         shipment_audits.sha_cus_code%TYPE              DEFAULT NULL,
  p_sha_ven_code         IN         shipment_audits.sha_ven_code%TYPE              DEFAULT NULL,
  p_sha_container_suffix IN         shipment_audits.sha_container_suffix%TYPE      DEFAULT NULL,
  p_sha_reference_number IN         shipment_audits.sha_reference_number%TYPE      DEFAULT NULL,
  p_sha_pmh_id           IN         shipment_audits.sha_pmh_id%TYPE                DEFAULT NULL,
  p_sha_actual_loc_code  IN         shipment_audits.sha_actual_loc_code%TYPE       DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY shipment_audits%ROWTYPE)
RETURN NUMBER;
----------------------------------------------------------------------------------------------------
--les fonctions/procedures existantes avant la regénération
----------------------------------------------------------------------------------------------------
FUNCTION GET_SHA_ID_FUNC RETURN NUMBER;

FUNCTION GET_FULL_SHA_BY_ID_FUNC(
	p_sha_id 			IN shipment_audits.sha_id%TYPE,
	p_sha_record	OUT shipment_audits%ROWTYPE
)
RETURN BOOLEAN;

PROCEDURE INSERT_SHA_PROC(
	p_sha_id               	IN shipment_audits.sha_id%TYPE,
	p_sha_date             	IN shipment_audits.sha_date%TYPE,
	p_sha_load_window      	IN shipment_audits.sha_load_window%TYPE,
	p_sha_car_code         	IN shipment_audits.sha_car_code%TYPE,
	p_sha_trailer_number   	IN shipment_audits.sha_trailer_number%TYPE,
	p_sha_loc_code         	IN shipment_audits.sha_loc_code%TYPE,
	p_sha_cus_code         	IN shipment_audits.sha_cus_code%TYPE,
	p_sha_ven_code         	IN shipment_audits.sha_ven_code%TYPE,
	p_sha_container_id     	IN shipment_audits.sha_container_id%TYPE,
	p_sha_container_suffix 	IN shipment_audits.sha_container_suffix%TYPE,
  p_sha_use_code 					IN shipment_audits.sha_use_code%TYPE,
  p_sha_reference_number  IN shipment_audits.sha_reference_number%TYPE,
  p_sha_load_unload_flag 	IN shipment_audits.sha_load_unload_flag%TYPE,
  p_sha_pmh_id   					IN shipment_audits.sha_pmh_id%TYPE,
  p_sha_actual_loc_code   IN shipment_audits.sha_actual_loc_code%TYPE    --CSC8347
);
END SHA_PACK;
/